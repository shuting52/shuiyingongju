import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

/// 随机密码生成器：长度 6~32 可调，大写/小写/数字/符号自由组合。
/// 移植自懒得找了 PasswordGeneratorSection.kt（v1.4.22）。
class PasswordGenToolPage extends StatefulWidget {
  const PasswordGenToolPage({super.key});

  static const String pageTitle = '密码生成器';

  @override
  State<PasswordGenToolPage> createState() => _PasswordGenToolPageState();
}

class _PasswordGenToolPageState extends State<PasswordGenToolPage> {
  double _length = 16;
  bool _useUpper = true;
  bool _useLower = true;
  bool _useDigit = true;
  bool _useSymbol = true;
  String _password = '';

  final _rand = Random();

  void _toast(String msg) {
    showLzToast(context, msg);
  }

  void _generate() {
    final pool = StringBuffer();
    if (_useUpper) pool.write('ABCDEFGHJKLMNPQRSTUVWXYZ');
    if (_useLower) pool.write('abcdefghijkmnpqrstuvwxyz');
    if (_useDigit) pool.write('23456789');
    if (_useSymbol) pool.write('!@#\$%^&*()-_=+[]{};:,.<>?');
    final chars = pool.toString();
    if (chars.isEmpty) {
      _toast('请至少勾选一种字符类型');
      return;
    }
    final n = _length.toInt();
    setState(() {
      _password = List.generate(
          n, (_) => chars[_rand.nextInt(chars.length)]).join();
    });
  }

  void _copy() {
    if (_password.isEmpty) {
      _toast('请先生成密码');
      return;
    }
    Clipboard.setData(ClipboardData(text: _password));
    _toast('已复制');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: PasswordGenToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.key, color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Text('随机密码生成器',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_password.isNotEmpty)
                      SelectableText(
                        _password,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                            color: pal.foreground,
                            height: 1.5),
                      )
                    else
                      Text('点击生成按钮，创建高强度随机密码',
                          style: TextStyle(
                              fontSize: 13, color: pal.secondary)),
                    const SizedBox(height: 12),
                    Text('密码长度：${_length.toInt()} 位',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: pal.foreground)),
                    Slider(
                      value: _length,
                      min: 6,
                      max: 32,
                      divisions: 26,
                      activeColor: pal.accent,
                      onChanged: (v) =>
                          setState(() => _length = v),
                    ),
                    _checkRow(pal, '大写字母 (A-Z)', _useUpper,
                        (v) => setState(() => _useUpper = v)),
                    _checkRow(pal, '小写字母 (a-z)', _useLower,
                        (v) => setState(() => _useLower = v)),
                    _checkRow(pal, '数字 (0-9)', _useDigit,
                        (v) => setState(() => _useDigit = v)),
                    _checkRow(pal, '特殊符号 (!@#…)', _useSymbol,
                        (v) => setState(() => _useSymbol = v)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: _generate,
                            icon: const Icon(Icons.refresh, size: 16),
                            label: const Text('生成密码',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                            style: FilledButton.styleFrom(
                              backgroundColor: pal.accent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _copy,
                            icon: const Icon(Icons.content_copy,
                                size: 16),
                            label: const Text('复制密码',
                                style: TextStyle(fontSize: 13)),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: pal.foreground,
                              side: BorderSide(
                                  color:
                                      pal.secondary.withOpacity(0.4)),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('提示：密码仅在本地生成，不会上传网络',
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkRow(Palette pal, String label, bool checked,
      ValueChanged<bool> onChange) {
    return InkWell(
      onTap: () => onChange(!checked),
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: (v) => onChange(v ?? false),
            activeColor: pal.accent,
          ),
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 13, color: pal.foreground)),
          ),
        ],
      ),
    );
  }
}
