import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

/// 测量 TCP 建连延迟（毫秒）：依次尝试 speed.cloudflare.com / www.baidu.com 的 443 端口
Future<int?> _measurePing(List<String> hosts) async {
  for (final host in hosts) {
    try {
      final t0 = DateTime.now();
      final socket = await Socket.connect(host, 443,
          timeout: const Duration(seconds: 4));
      final ms = DateTime.now().difference(t0).inMilliseconds;
      socket.destroy();
      return ms;
    } catch (_) {
      // 换下一个节点继续测
    }
  }
  return null;
}

/// 下载测速：真实下载 Cloudflare 测速文件（10MB 起），返回 Mbps
Future<double?> _measureDownload(List<String> urls) async {
  final client = http.Client();
  try {
    for (final urlStr in urls) {
      try {
        final request = http.Request('GET', Uri.parse(urlStr));
        request.headers['User-Agent'] = 'LazyFind-SpeedTest';
        final resp = await client.send(request).timeout(
            const Duration(seconds: 6));
        if (resp.statusCode != 200) continue;
        final stopwatch = Stopwatch()..start();
        var total = 0;
        final deadline = DateTime.now().add(const Duration(seconds: 12));
        final completer = Completer<void>();
        StreamSubscription<List<int>>? sub;
        sub = resp.stream.listen((chunk) {
          total += chunk.length;
          if (DateTime.now().isAfter(deadline)) {
            if (!completer.isCompleted) completer.complete();
          }
        }, onDone: () {
          if (!completer.isCompleted) completer.complete();
        }, onError: (_) {
          if (!completer.isCompleted) completer.complete();
        });
        await completer.future.timeout(const Duration(seconds: 15),
            onTimeout: () {});
        await sub.cancel();
        stopwatch.stop();
        final elapsedSec = stopwatch.elapsedMilliseconds / 1000.0;
        if (elapsedSec > 0.1 && total > 0) {
          return (total * 8.0) / (elapsedSec * 1000000.0); // Mbps
        }
      } catch (_) {
        // 换备用下载源
      }
    }
    return null;
  } finally {
    client.close();
  }
}

/// IP 定位：无需 GPS 权限，解析出口 IP 的城市/运营商
Future<String?> _locateByIp() async {
  try {
    final resp = await http
        .get(Uri.parse('https://ipinfo.io/json'))
        .timeout(const Duration(seconds: 6));
    if (resp.statusCode == 200) {
      final j = json.decode(resp.body) as Map<String, dynamic>;
      final city = (j['city'] as String?) ?? '';
      final region = (j['region'] as String?) ?? '';
      final country = (j['country'] as String?) ?? '';
      final org = (j['org'] as String?) ?? '';
      final loc = (j['loc'] as String?) ?? '';
      final parts = [country, region, city]
          .where((e) => e.isNotEmpty)
          .toSet()
          .toList();
      final coord = loc.isNotEmpty ? ' · $loc' : '';
      final isp = org.isNotEmpty ? '（$org）' : '';
      if (parts.isNotEmpty || isp.isNotEmpty) {
        return '📍 ${parts.join(' ')}$coord $isp'.trim();
      }
    }
  } catch (_) {}
  try {
    final resp = await http
        .get(Uri.parse('http://ip-api.com/json/?lang=zh-CN'))
        .timeout(const Duration(seconds: 6));
    if (resp.statusCode == 200) {
      final j = json.decode(resp.body) as Map<String, dynamic>;
      final country = (j['country'] as String?) ?? '';
      final city = (j['city'] as String?) ?? '';
      final isp = (j['isp'] as String?) ?? '';
      final parts = [country, city].where((e) => e.isNotEmpty).toList();
      final ispStr = isp.isNotEmpty ? '（$isp）' : '';
      if (parts.isNotEmpty || ispStr.isNotEmpty) {
        return '📍 ${parts.join(' ')} $ispStr'.trim();
      }
    }
  } catch (_) {}
  return null;
}

class SpeedTestToolPage extends StatefulWidget {
  const SpeedTestToolPage({super.key});
  static const String pageTitle = '测速网';

  @override
  State<SpeedTestToolPage> createState() => _SpeedTestToolPageState();
}

class _SpeedTestToolPageState extends State<SpeedTestToolPage> {
  bool _testing = false;
  double? _downloadMbps;
  int? _pingMs;
  String? _locationText;
  String _status = '点击开始测速';

  @override
  void initState() {
    super.initState();
    _locate();
  }

  Future<void> _locate() async {
    final loc = await _locateByIp();
    if (!mounted) return;
    setState(() {
      _locationText = loc ?? '📍 网络定位同步中，请点击刷新';
      if (_status == '点击开始测速') _status = '定位已实时同步（免开启GPS）';
    });
  }

  Future<void> _runTest() async {
    if (_testing) return;
    setState(() {
      _testing = true;
      _status = '正在测量 Ping…';
    });
    // 1. Ping 延迟
    final ping = await _measurePing(['speed.cloudflare.com', 'www.baidu.com']);
    if (!mounted) return;
    setState(() {
      _pingMs = ping;
      _status = '正在下载测速文件（10MB）…';
    });
    // 2. 下载测速
    final mbps = await _measureDownload([
      'https://speed.cloudflare.com/__down?bytes=10000000',
      'https://speed.cloudflare.com/__down?bytes=5000000',
    ]);
    if (!mounted) return;
    setState(() {
      _downloadMbps = mbps;
      _testing = false;
      _status = mbps != null ? '测速完成 ✅' : '测速失败（网络不可达）';
    });
    // 3. 定位
    _locate();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: SpeedTestToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            // 标题卡
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('⚡ 测速网',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: pal.foreground)),
                    const SizedBox(height: 2),
                    Text('真实下载测速 · Ping 延迟 · 当前位置',
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 测速结果面板
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 22),
                child: Column(
                  children: [
                    if (_testing)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 12),
                        child: CupertinoActivityIndicator(
                            radius: 14, color: pal.accent),
                      ),
                    Text(
                      _downloadMbps != null
                          ? '${_downloadMbps!.toStringAsFixed(2)} Mbps'
                          : '—',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: pal.accent),
                    ),
                    Text('下载速度',
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(_pingMs != null ? '$_pingMs ms' : '—',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: pal.foreground)),
                              Text('Ping 延迟',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: pal.secondary)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(_locationText ?? '未定位',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: pal.foreground)),
                              Text('当前位置',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: pal.secondary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(_status,
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 开始测速
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 12),
                color: pal.accent,
                borderRadius: BorderRadius.circular(14),
                onPressed: _testing ? null : _runTest,
                child: Text(_testing ? '测速中…' : '开始测速',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            // 单独刷新定位
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 12),
                borderRadius: BorderRadius.circular(14),
                color: pal.subtleFill,
                onPressed: _locate,
                child: Text('📍 刷新定位',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: pal.foreground)),
              ),
            ),
            const SizedBox(height: 10),
            Text('测速通过 Cloudflare 全球节点真实下载文件计算；定位基于 IP 解析实时同步（无需开启手机 GPS 定位与 VPN，自动解析真实网络位置）。',
                style:
                    TextStyle(fontSize: 11, color: pal.secondary)),
          ],
        ),
      ),
    );
  }
}
