import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

/// 二维码生成器：输入任意文本/链接，一键生成二维码，可复制内容。
/// 移植自懒得找了 QrGeneratorSection.kt（v1.4.22）。
class QrGenToolPage extends StatefulWidget {
  const QrGenToolPage({super.key});

  static const String pageTitle = '二维码生成';

  @override
  State<QrGenToolPage> createState() => _QrGenToolPageState();
}

class _QrGenToolPageState extends State<QrGenToolPage> {
  final _inputCtrl = TextEditingController();
  String _qrText = '';
  String _lastText = '';

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  void _toast(String msg) {
    showLzToast(context, msg);
  }

  void _generate() {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty) {
      _toast('请先输入内容');
      return;
    }
    setState(() {
      _qrText = text;
      _lastText = text;
    });
  }

  void _copyContent() {
    final text = _lastText.isNotEmpty ? _lastText : _inputCtrl.text;
    Clipboard.setData(ClipboardData(text: text));
    _toast('已复制');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: QrGenToolPage.pageTitle,
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
                        Icon(Icons.qr_code_2,
                            color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Text('二维码生成器',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('输入文本或链接，生成可扫码的二维码',
                        style:
                            TextStyle(fontSize: 12, color: pal.secondary)),
                    const SizedBox(height: 12),
                    CupertinoTextField(
                      controller: _inputCtrl,
                      minLines: 2,
                      maxLines: 4,
                      style:
                          TextStyle(fontSize: 14, color: pal.foreground),
                      placeholder: '粘贴链接或输入文本…',
                      placeholderStyle: TextStyle(
                          fontSize: 13, color: pal.secondary),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: pal.secondary.withOpacity(0.35)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: _generate,
                            icon:
                                const Icon(Icons.refresh, size: 16),
                            label: const Text('生成二维码',
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
                        OutlinedButton(
                          onPressed: _copyContent,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: pal.foreground,
                            side: BorderSide(
                                color: pal.secondary.withOpacity(0.4)),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                          ),
                          child: const Icon(Icons.content_copy,
                              size: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (_qrText.isNotEmpty)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(12),
                          child: QrImageView(
                            data: _qrText,
                            version: QrVersions.auto,
                            size: 220,
                            backgroundColor: Colors.white,
                            foregroundColor:
                                const Color(0xFF1A1A1A),
                            errorCorrectionLevel:
                                QrErrorCorrectLevel.M,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('长按截图保存 · 用微信/支付宝扫一扫识别',
                          style: TextStyle(
                              fontSize: 11, color: pal.secondary)),
                    ],
                  ),
                ),
              )
            else
              GlassPanel(
                isDark: isDark,
                child: SizedBox(
                  height: 180,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.qr_code_2,
                            color: pal.secondary, size: 44),
                        const SizedBox(height: 6),
                        Text('二维码将显示在这里',
                            style: TextStyle(
                                fontSize: 12,
                                color: pal.secondary)),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
