import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

/// 倒数日 / 纪念日：添加重要日子，自动计算剩余天数或已过去天数，本地持久化。
/// 移植自懒得找了 CountdownSection.kt（v1.4.22）。
class CountdownToolPage extends StatefulWidget {
  const CountdownToolPage({super.key});

  static const String pageTitle = '倒数日';

  @override
  State<CountdownToolPage> createState() => _CountdownToolPageState();
}

class _CountDay {
  _CountDay(this.title, this.dateMillis);
  final String title;
  final int dateMillis;

  Map<String, dynamic> toJson() =>
      {'title': title, 'date': dateMillis};
}

/// 存储 key：前缀 lzdz_countdown_。
const String _kStorageKey = 'lzdz_countdown_list';

String _fmtDate(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

int _todayStartMillis() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day)
      .millisecondsSinceEpoch;
}

class _CountdownToolPageState extends State<CountdownToolPage> {
  List<_CountDay> _days = [];
  bool _loaded = false;

  bool _showAdd = false;
  final _titleCtrl = TextEditingController();
  DateTime? _newDate;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kStorageKey) ?? '[]';
      final list = (jsonDecode(raw) as List)
          .map((e) => _CountDay(
              (e as Map)['title'] as String,
              (e['date'] as num).toInt()))
          .toList()
        ..sort((a, b) => a.dateMillis.compareTo(b.dateMillis));
      if (mounted) setState(() => _days = list);
    } catch (_) {
      // 解析失败则视为空列表
    } finally {
      if (mounted) setState(() => _loaded = true);
    }
  }

  Future<void> _save(List<_CountDay> list) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          _kStorageKey,
          jsonEncode(list.map((e) => e.toJson()).toList()));
    } catch (_) {}
  }

  void _toast(String msg) {
    showLzToast(context, msg);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _newDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _newDate = picked);
  }

  void _submit() {
    final title = _titleCtrl.text.trim();
    if (title.isEmpty || _newDate == null) {
      _toast('请填写名称并选择日期');
      return;
    }
    final updated = [
      ..._days,
      _CountDay(title, _newDate!.millisecondsSinceEpoch)
    ]..sort((a, b) => a.dateMillis.compareTo(b.dateMillis));
    setState(() {
      _days = updated;
      _showAdd = false;
    });
    _save(updated);
  }

  void _remove(_CountDay item) {
    final updated = _days.where((e) => e != item).toList();
    setState(() => _days = updated);
    _save(updated);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final today = _todayStartMillis();

    return SubPage(
      title: CountdownToolPage.pageTitle,
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
                        Icon(Icons.event,
                            color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text('倒数日 · 纪念日',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: pal.foreground)),
                        ),
                        IconButton(
                          icon: Icon(Icons.add,
                              color: pal.accent),
                          tooltip: '添加',
                          onPressed: () => setState(() {
                            _titleCtrl.clear();
                            _newDate = null;
                            _showAdd = true;
                          }),
                        ),
                      ],
                    ),
                    if (_showAdd) ...[
                      const SizedBox(height: 8),
                      CupertinoTextField(
                        controller: _titleCtrl,
                        style: TextStyle(
                            fontSize: 14, color: pal.foreground),
                        placeholder: '事件名称 · 如：生日、考试、发工资',
                        placeholderStyle: TextStyle(
                            fontSize: 13, color: pal.secondary),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: _pickDate,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: pal.foreground,
                          side: BorderSide(
                              color: pal.secondary.withOpacity(0.4)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12)),
                        ),
                        child: Text(
                          _newDate == null
                              ? '选择日期'
                              : _fmtDate(_newDate!),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: _submit,
                              style: FilledButton.styleFrom(
                                backgroundColor: pal.accent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12)),
                              ),
                              child: const Text('保存',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () =>
                                  setState(() => _showAdd = false),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: pal.foreground,
                                side: BorderSide(
                                    color: pal.secondary
                                        .withOpacity(0.4)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12)),
                              ),
                              child: const Text('取消',
                                  style:
                                      TextStyle(fontSize: 13)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (!_loaded)
              GlassPanel(
                isDark: isDark,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: CircularProgressIndicator()),
                ),
              )
            else if (_days.isEmpty)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      '还没有倒数日，点击右上角 + 添加第一个重要日子',
                      style: TextStyle(
                          fontSize: 13, color: pal.secondary)),
                ),
              )
            else
              ..._days.map((item) {
                final diffDays =
                    (item.dateMillis - today) ~/ 86400000;
                final diffText = diffDays > 0
                    ? '还有 $diffDays 天'
                    : (diffDays == 0 ? '就是今天！' : '已过去 ${-diffDays} 天');
                return GlassPanel(
                  isDark: isDark,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(item.title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: pal.foreground)),
                              const SizedBox(height: 4),
                              Text(
                                  _fmtDate(DateTime
                                      .fromMillisecondsSinceEpoch(
                                          item.dateMillis)),
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: pal.secondary)),
                            ],
                          ),
                        ),
                        Text(diffText,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: pal.foreground)),
                        IconButton(
                          icon: Icon(Icons.delete_outline,
                              color: pal.secondary, size: 18),
                          tooltip: '删除',
                          onPressed: () => _remove(item),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
