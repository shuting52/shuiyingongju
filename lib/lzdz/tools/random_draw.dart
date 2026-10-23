import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

/// 随机抽签：随机数 / 抛硬币 / 掷骰子 / 名单抽取，一站式随机决策。
/// 移植自懒得找了 RandomDrawSection.kt（v1.4.22）。
class RandomDrawToolPage extends StatefulWidget {
  const RandomDrawToolPage({super.key});

  static const String pageTitle = '随机抽签';

  @override
  State<RandomDrawToolPage> createState() => _RandomDrawToolPageState();
}

const List<String> _modes = ['随机数', '抛硬币', '掷骰子', '名单抽取'];
const List<String> _diceFaces = ['⚀', '⚁', '⚂', '⚃', '⚄', '⚅'];

class _RandomDrawToolPageState extends State<RandomDrawToolPage> {
  int _mode = 0; // 0随机数 1硬币 2骰子 3名单
  final _minCtrl = TextEditingController(text: '1');
  final _maxCtrl = TextEditingController(text: '100');
  final _namesCtrl = TextEditingController();
  String _result = '';

  final _rand = Random();

  @override
  void dispose() {
    _minCtrl.dispose();
    _maxCtrl.dispose();
    _namesCtrl.dispose();
    super.dispose();
  }

  void _toast(String msg) {
    showLzToast(context, msg);
  }

  void _draw() {
    String r;
    switch (_mode) {
      case 0:
        final a = int.tryParse(_minCtrl.text) ?? 1;
        final b = int.tryParse(_maxCtrl.text) ?? 100;
        r = a > b
            ? '最小值不能大于最大值'
            : (_rand.nextInt(b - a + 1) + a).toString();
        break;
      case 1:
        r = _rand.nextBool() ? '正面 🎉' : '反面 🌙';
        break;
      case 2:
        final d = _rand.nextInt(6) + 1;
        r = '${_diceFaces[d - 1]}  $d 点';
        break;
      default:
        final names = _namesCtrl.text
            .split(RegExp(r'[\n，,、 ]'))
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
        r = names.isEmpty
            ? '请先输入名单（每行一个名字）'
            : names[_rand.nextInt(names.length)];
    }
    setState(() => _result = r);
  }

  void _copyResult() {
    Clipboard.setData(ClipboardData(text: _result));
    _toast('已复制');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: RandomDrawToolPage.pageTitle,
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
                        Icon(Icons.casino,
                            color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Text('随机抽签',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(_modes.length, (i) {
                        final selected = _mode == i;
                        return GestureDetector(
                          onTap: () => setState(() {
                            _mode = i;
                            _result = '';
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20),
                              color: selected
                                  ? pal.accentSoft
                                  : Colors.transparent,
                              border: Border.all(
                                color: selected
                                    ? pal.accent
                                    : pal.secondary
                                        .withOpacity(0.35),
                              ),
                            ),
                            child: Text(
                              _modes[i],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: selected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: selected
                                    ? pal.foreground
                                    : pal.secondary,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                    if (_mode == 0)
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: _minCtrl,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9\-]'))
                              ],
                              style: TextStyle(
                                  fontSize: 14,
                                  color: pal.foreground),
                              placeholder: '最小值',
                              placeholderStyle: TextStyle(
                                  fontSize: 12,
                                  color: pal.secondary),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        CupertinoColors.systemGrey4),
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CupertinoTextField(
                              controller: _maxCtrl,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9\-]'))
                              ],
                              style: TextStyle(
                                  fontSize: 14,
                                  color: pal.foreground),
                              placeholder: '最大值',
                              placeholderStyle: TextStyle(
                                  fontSize: 12,
                                  color: pal.secondary),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        CupertinoColors.systemGrey4),
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (_mode == 3)
                      CupertinoTextField(
                        controller: _namesCtrl,
                        minLines: 4,
                        maxLines: 8,
                        style: TextStyle(
                            fontSize: 14, color: pal.foreground),
                        placeholder: '名单（每行一个名字）',
                        placeholderStyle: TextStyle(
                            fontSize: 12, color: pal.secondary),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  pal.secondary.withOpacity(0.35)),
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: _draw,
                      icon: const Icon(Icons.casino, size: 16),
                      label: const Text('开始抽取',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      style: FilledButton.styleFrom(
                        backgroundColor: pal.accent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_result.isNotEmpty)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text('抽取结果',
                            style: TextStyle(
                                fontSize: 12,
                                color: pal.secondary)),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          _result,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                              color: pal.foreground),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: OutlinedButton.icon(
                          onPressed: _copyResult,
                          icon: const Icon(Icons.content_copy,
                              size: 14),
                          label: const Text('复制结果',
                              style: TextStyle(fontSize: 12)),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
