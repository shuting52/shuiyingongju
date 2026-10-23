import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

/// 工时打卡（日历打卡 + 班次工时 + 月度统计 + 薪资估算）
/// 移植自 10-05landezhaole 的 worktime/ 三文件（移植自 shuting52/jigongshi）
class WorktimeToolPage extends StatefulWidget {
  const WorktimeToolPage({super.key});
  static const String pageTitle = '工时打卡';

  @override
  State<WorktimeToolPage> createState() => _WorktimeToolPageState();
}

// ---------- 数据模型 ----------

enum ShiftType {
  normal('正班', Color(0xFF1257C9)),
  overtime('工作日加班', Color(0xFFF59E0B)),
  weekend('周末加班', Color(0xFF8B5CF6)),
  holiday('节假加班', Color(0xFFEF4444)),
  leave('请假', Color(0xFF6E7887)),
  rest('休息', Color(0xFF9AA5B1));

  final String label;
  final Color color;
  const ShiftType(this.label, this.color);
}

class WorkRecord {
  final String date; // yyyy-MM-dd
  final ShiftType shiftType;
  final double normalHours;
  final double overtimeHours;
  final String note;

  const WorkRecord({
    required this.date,
    this.shiftType = ShiftType.normal,
    this.normalHours = 8.0,
    this.overtimeHours = 0.0,
    this.note = '',
  });

  double totalHours() => normalHours + overtimeHours;

  factory WorkRecord.fromJson(Map<String, dynamic> j) {
    ShiftType st = ShiftType.normal;
    try {
      st = ShiftType.values.firstWhere((e) => e.name == j['shiftType']);
    } catch (_) {}
    return WorkRecord(
      date: (j['date'] as String?) ?? '',
      shiftType: st,
      normalHours: (j['normalHours'] as num?)?.toDouble() ?? 8.0,
      overtimeHours: (j['overtimeHours'] as num?)?.toDouble() ?? 0.0,
      note: (j['note'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'shiftType': shiftType.name,
        'normalHours': normalHours,
        'overtimeHours': overtimeHours,
        'note': note,
      };
}

class SalaryConfig {
  final double baseSalary;
  final double overtimeRate;
  final double weekendRate;
  final double holidayRate;

  const SalaryConfig({
    this.baseSalary = 5000.0,
    this.overtimeRate = 1.5,
    this.weekendRate = 2.0,
    this.holidayRate = 3.0,
  });

  /// 时薪 = 月薪 / 21.75 / 8
  double hourly() => baseSalary > 0 ? baseSalary / 21.75 / 8 : 0.0;

  factory SalaryConfig.fromJson(Map<String, dynamic> j) => SalaryConfig(
        baseSalary: (j['baseSalary'] as num?)?.toDouble() ?? 5000.0,
        overtimeRate: (j['overtimeRate'] as num?)?.toDouble() ?? 1.5,
        weekendRate: (j['weekendRate'] as num?)?.toDouble() ?? 2.0,
        holidayRate: (j['holidayRate'] as num?)?.toDouble() ?? 3.0,
      );

  Map<String, dynamic> toJson() => {
        'baseSalary': baseSalary,
        'overtimeRate': overtimeRate,
        'weekendRate': weekendRate,
        'holidayRate': holidayRate,
      };
}

/// 单日薪资估算
double estimatePay(WorkRecord r, SalaryConfig c) {
  final h = c.hourly();
  if (h <= 0) return 0.0;
  switch (r.shiftType) {
    case ShiftType.normal:
    case ShiftType.overtime:
      return r.normalHours * h + r.overtimeHours * h * c.overtimeRate;
    case ShiftType.weekend:
      return r.totalHours() * h * c.weekendRate;
    case ShiftType.holiday:
      return r.totalHours() * h * c.holidayRate;
    case ShiftType.leave:
    case ShiftType.rest:
      return 0.0;
  }
}

const _kRecordsKey = 'lzdz_worktime_records';
const _kSalaryKey = 'lzdz_worktime_salary';

String _dateKey(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

// ================= 页面 =================

class _WorktimeToolPageState extends State<WorktimeToolPage> {
  int _tab = 0;
  Map<String, WorkRecord> _records = {};
  SalaryConfig _salary = const SalaryConfig();
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final sp = await SharedPreferences.getInstance();
      final raw = sp.getString(_kRecordsKey) ?? '[]';
      final arr = (jsonDecode(raw) as List?) ?? [];
      final map = <String, WorkRecord>{};
      for (final e in arr) {
        if (e is Map) {
          final r = WorkRecord.fromJson(Map<String, dynamic>.from(e));
          if (r.date.isNotEmpty) map[r.date] = r;
        }
      }
      SalaryConfig salary = const SalaryConfig();
      final sraw = sp.getString(_kSalaryKey);
      if (sraw != null && sraw.isNotEmpty) {
        try {
          salary = SalaryConfig.fromJson(
              Map<String, dynamic>.from(jsonDecode(sraw) as Map));
        } catch (_) {}
      }
      if (mounted) {
        setState(() {
          _records = map;
          _salary = salary;
          _loaded = true;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loaded = true);
    }
  }

  Future<void> _persistRecords() async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kRecordsKey,
        jsonEncode(_records.values.map((r) => r.toJson()).toList()));
  }

  Future<void> _persistSalary() async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kSalaryKey, jsonEncode(_salary.toJson()));
  }

  void _saveRecord(WorkRecord r) {
    setState(() => _records = {..._records, r.date: r});
    _persistRecords();
  }

  void _deleteRecord(String date) {
    final m = {..._records}..remove(date);
    setState(() => _records = m);
    _persistRecords();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: WorktimeToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('⏱️ 工时打卡',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: pal.foreground)),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text('日历打卡 · 班次工时 · 月度统计 · 薪资估算',
                                style: TextStyle(
                                    fontSize: 11, color: pal.secondary)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _tabBar(pal),
            if (!_loaded)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                    child: Text('加载中…',
                        style: TextStyle(fontSize: 12, color: pal.secondary))),
              )
            else if (_tab == 0)
              _CheckInTab(
                isDark: isDark,
                pal: pal,
                records: _records,
                onSave: _saveRecord,
                onDelete: _deleteRecord,
              )
            else if (_tab == 1)
              _StatsTab(isDark: isDark, pal: pal, records: _records, salary: _salary)
            else
              _SettingsTab(
                isDark: isDark,
                pal: pal,
                salary: _salary,
                onSave: (s) {
                  setState(() => _salary = s);
                  _persistSalary();
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar(Palette pal) {
    const tabs = ['打卡', '统计', '设置'];
    return Container(
      decoration: BoxDecoration(
        color: pal.subtleFill,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final selected = _tab == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _tab = i),
              child: Container(
                decoration: BoxDecoration(
                  color: selected ? pal.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: const EdgeInsets.symmetric(vertical: 9),
                alignment: Alignment.center,
                child: Text(tabs[i],
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        color:
                            selected ? Colors.white : pal.secondary)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ================= 打卡页 =================

class _CheckInTab extends StatefulWidget {
  final bool isDark;
  final Palette pal;
  final Map<String, WorkRecord> records;
  final void Function(WorkRecord) onSave;
  final void Function(String) onDelete;
  const _CheckInTab({
    required this.isDark,
    required this.pal,
    required this.records,
    required this.onSave,
    required this.onDelete,
  });

  @override
  State<_CheckInTab> createState() => _CheckInTabState();
}

class _CheckInTabState extends State<_CheckInTab> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month, 1);

  void _openSheet(DateTime date) {
    final key = _dateKey(date);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => _RecordSheet(
        pal: widget.pal,
        date: date,
        existing: widget.records[key],
        onSave: (r) {
          widget.onSave(r);
          Navigator.of(context).pop();
        },
        onDelete: () {
          widget.onDelete(key);
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pal = widget.pal;
    final todayKey = _dateKey(DateTime.now());
    final firstDay = DateTime(_month.year, _month.month, 1);
    final offset = firstDay.weekday - 1; // 周一起始
    final daysInMonth = DateTime(_month.year, _month.month + 1, 0).day;

    return GlassPanel(
      isDark: widget.isDark,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => setState(() => _month =
                      DateTime(_month.year, _month.month - 1, 1)),
                  icon: Icon(Icons.arrow_back, color: pal.accent),
                ),
                Text('${_month.year}年${_month.month}月',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: pal.foreground)),
                IconButton(
                  onPressed: () => setState(() => _month =
                      DateTime(_month.year, _month.month + 1, 1)),
                  icon: Icon(Icons.arrow_forward, color: pal.accent),
                ),
              ],
            ),
            Row(
              children: ['一', '二', '三', '四', '五', '六', '日']
                  .map((w) => Expanded(
                          child: Center(
                              child: Text(w,
                                  style: TextStyle(
                                      fontSize: 12, color: pal.secondary)))))
                  .toList(),
            ),
            const SizedBox(height: 4),
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(offset + daysInMonth, (i) {
                final dayNum = i - offset + 1;
                if (dayNum < 1 || dayNum > daysInMonth) {
                  return const SizedBox.shrink();
                }
                final date = DateTime(_month.year, _month.month, dayNum);
                final key = _dateKey(date);
                final rec = widget.records[key];
                final isToday = key == todayKey;
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () => _openSheet(date),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: rec != null
                            ? rec.shiftType.color.withAlpha(40)
                            : isToday
                                ? pal.accent.withAlpha(26)
                                : Colors.transparent,
                        border: isToday
                            ? Border.all(color: pal.accent, width: 1)
                            : null,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('$dayNum',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isToday
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: pal.foreground)),
                          const SizedBox(height: 2),
                          if (rec != null)
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: rec.shiftType.color),
                            )
                          else
                            const SizedBox(width: 6, height: 6),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 12,
              runSpacing: 6,
              children: ShiftType.values.take(4).map((st) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: st.color),
                    ),
                    const SizedBox(width: 4),
                    Text(st.label,
                        style:
                            TextStyle(fontSize: 11, color: pal.secondary)),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text('点日期记录打卡',
                style: TextStyle(fontSize: 11, color: pal.secondary)),
          ],
        ),
      ),
    );
  }
}

class _RecordSheet extends StatefulWidget {
  final Palette pal;
  final DateTime date;
  final WorkRecord? existing;
  final void Function(WorkRecord) onSave;
  final VoidCallback onDelete;
  const _RecordSheet({
    required this.pal,
    required this.date,
    this.existing,
    required this.onSave,
    required this.onDelete,
  });

  @override
  State<_RecordSheet> createState() => _RecordSheetState();
}

class _RecordSheetState extends State<_RecordSheet> {
  ShiftType _shift = ShiftType.normal;
  String _normalH = '8';
  String _overtimeH = '0';
  String _note = '';

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _shift = e.shiftType;
      _normalH = _trimNum(e.normalHours);
      _overtimeH = _trimNum(e.overtimeHours);
      _note = e.note;
    }
  }

  static String _trimNum(double v) =>
      v == v.truncateToDouble() ? v.toInt().toString() : v.toString();

  @override
  Widget build(BuildContext context) {
    final pal = widget.pal;
    return Padding(
      padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 28),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: pal.secondary.withAlpha(80),
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 12),
            Text('${_dateKey(widget.date)} 打卡',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: pal.foreground)),
            const SizedBox(height: 12),
            Text('班次类型',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: pal.secondary)),
            const SizedBox(height: 8),
            ...ShiftType.values.toList().slices(3).map((row) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    ...row.map((st) {
                      final selected = _shift == st;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _shift = st),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: selected
                                  ? st.color
                                  : pal.foreground.withAlpha(12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (selected)
                                  const Icon(Icons.check,
                                      size: 14, color: Colors.white),
                                if (selected) const SizedBox(width: 4),
                                Text(st.label,
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold,
                                        color: selected
                                            ? Colors.white
                                            : pal.foreground)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    ...List.generate(3 - row.length,
                        (_) => const Expanded(child: SizedBox.shrink())),
                  ],
                ),
              );
            }),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _normalH)
                      ..selection = TextSelection.collapsed(
                          offset: _normalH.length),
                    onChanged: (v) => _normalH =
                        v.replaceAll(RegExp(r'[^0-9.]'), ''),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    decoration: const InputDecoration(
                      labelText: '正班时长(小时)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _overtimeH)
                      ..selection = TextSelection.collapsed(
                          offset: _overtimeH.length),
                    onChanged: (v) => _overtimeH =
                        v.replaceAll(RegExp(r'[^0-9.]'), ''),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    decoration: const InputDecoration(
                      labelText: '加班时长(小时)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: _note)
                ..selection =
                    TextSelection.collapsed(offset: _note.length),
              onChanged: (v) => _note = v,
              decoration: const InputDecoration(
                labelText: '备注（可选）',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                if (widget.existing != null)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: widget.onDelete,
                      icon: const Icon(Icons.delete_outline, size: 16),
                      label: const Text('删除'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEF4444),
                          foregroundColor: Colors.white),
                    ),
                  ),
                if (widget.existing != null) const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onSave(WorkRecord(
                        date: _dateKey(widget.date),
                        shiftType: _shift,
                        normalHours: double.tryParse(_normalH) ?? 0.0,
                        overtimeHours: double.tryParse(_overtimeH) ?? 0.0,
                        note: _note,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: pal.accent,
                        foregroundColor: Colors.white),
                    child: const Text('保存打卡',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on List<ShiftType> {
  Iterable<List<ShiftType>> slices(int size) sync* {
    for (var i = 0; i < length; i += size) {
      yield sublist(i, (i + size).clamp(0, length));
    }
  }
}

// ================= 统计页 =================

class _StatsTab extends StatefulWidget {
  final bool isDark;
  final Palette pal;
  final Map<String, WorkRecord> records;
  final SalaryConfig salary;
  const _StatsTab({
    required this.isDark,
    required this.pal,
    required this.records,
    required this.salary,
  });

  @override
  State<_StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<_StatsTab> {
  DateTime _month = DateTime(DateTime.now().year, DateTime.now().month, 1);

  @override
  Widget build(BuildContext context) {
    final pal = widget.pal;
    final prefix =
        '${_month.year.toString().padLeft(4, '0')}-${_month.month.toString().padLeft(2, '0')}';
    final monthRecords = widget.records.values
        .where((r) => r.date.startsWith(prefix))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    final workDays = monthRecords
        .where((r) =>
            r.shiftType != ShiftType.leave && r.shiftType != ShiftType.rest)
        .length;
    final totalHours =
        monthRecords.fold<double>(0, (s, r) => s + r.totalHours());
    final overtimeHours =
        monthRecords.fold<double>(0, (s, r) => s + r.overtimeHours);
    final totalPay =
        monthRecords.fold<double>(0, (s, r) => s + estimatePay(r, widget.salary));
    final leaveDays =
        monthRecords.where((r) => r.shiftType == ShiftType.leave).length;

    final children = <Widget>[
      GlassPanel(
        isDark: widget.isDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => setState(() => _month =
                    DateTime(_month.year, _month.month - 1, 1)),
                icon: Icon(Icons.arrow_back, color: pal.accent),
              ),
              Text('${_month.year}年${_month.month}月',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: pal.foreground)),
              IconButton(
                onPressed: () => setState(() => _month =
                    DateTime(_month.year, _month.month + 1, 1)),
                icon: Icon(Icons.arrow_forward, color: pal.accent),
              ),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: pal.accent,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('本月预估薪资',
                style:
                    TextStyle(fontSize: 12, color: Colors.white.withAlpha(200))),
            Text('¥${totalPay.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statMini('出勤', '$workDays天'),
                _statMini('总工时', '${totalHours.toStringAsFixed(1)}h'),
                _statMini('加班', '${overtimeHours.toStringAsFixed(1)}h'),
                _statMini('请假', '$leaveDays天'),
              ],
            ),
          ],
        ),
      ),
    ];

    if (monthRecords.isEmpty) {
      children.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
            child: Text('本月暂无打卡记录',
                style: TextStyle(fontSize: 13, color: pal.secondary))),
      ));
    } else {
      for (final r in monthRecords) {
        children.add(GlassPanel(
          isDark: widget.isDark,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(r.date,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: pal.foreground)),
                      Text(
                          '${r.shiftType.label} · ${r.totalHours().toStringAsFixed(1)}h' +
                              (r.note.isNotEmpty ? ' · ${r.note}' : ''),
                          style: TextStyle(
                              fontSize: 11.5, color: pal.secondary)),
                    ],
                  ),
                ),
                Text('¥${estimatePay(r, widget.salary).toStringAsFixed(0)}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: pal.accent)),
              ],
            ),
          ),
        ));
      }
    }

    return Column(
        children: children
            .map((w) => Padding(
                padding: const EdgeInsets.only(bottom: 10), child: w))
            .toList());
  }

  Widget _statMini(String label, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Text(label,
            style:
                TextStyle(fontSize: 11, color: Colors.white.withAlpha(190))),
      ],
    );
  }
}

// ================= 设置页 =================

class _SettingsTab extends StatefulWidget {
  final bool isDark;
  final Palette pal;
  final SalaryConfig salary;
  final void Function(SalaryConfig) onSave;
  const _SettingsTab({
    required this.isDark,
    required this.pal,
    required this.salary,
    required this.onSave,
  });

  @override
  State<_SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<_SettingsTab> {
  String _base = '5000';
  String _otRate = '1.5';
  String _weRate = '2.0';
  String _hoRate = '3.0';
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    _base = _num(widget.salary.baseSalary);
    _otRate = _num(widget.salary.overtimeRate);
    _weRate = _num(widget.salary.weekendRate);
    _hoRate = _num(widget.salary.holidayRate);
  }

  static String _num(double v) =>
      v == v.truncateToDouble() ? v.toInt().toString() : v.toString();

  double _d(String s) => double.tryParse(s) ?? 0.0;

  @override
  Widget build(BuildContext context) {
    final pal = widget.pal;
    return Column(
      children: [
        GlassPanel(
          isDark: widget.isDark,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('薪资设置',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: pal.foreground)),
                const SizedBox(height: 4),
                Text('时薪 = 月底薪 ÷ 21.75 ÷ 8',
                    style: TextStyle(fontSize: 11.5, color: pal.secondary)),
                const SizedBox(height: 10),
                _salaryField('月底薪（元）', _base,
                    (v) => setState(() => _base = v)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: _salaryField('平时加班倍率', _otRate,
                            (v) => setState(() => _otRate = v))),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _salaryField('周末倍率', _weRate,
                            (v) => setState(() => _weRate = v))),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _salaryField('节假倍率', _hoRate,
                            (v) => setState(() => _hoRate = v))),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onSave(SalaryConfig(
                        baseSalary: _d(_base),
                        overtimeRate:
                            _d(_otRate) > 0 ? _d(_otRate) : 1.5,
                        weekendRate: _d(_weRate) > 0 ? _d(_weRate) : 2.0,
                        holidayRate: _d(_hoRate) > 0 ? _d(_hoRate) : 3.0,
                      ));
                      setState(() => _saved = true);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: pal.accent,
                        foregroundColor: Colors.white),
                    child: const Text('保存设置',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                if (_saved)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Center(
                      child: Text('已保存 ✓',
                          style: TextStyle(
                              fontSize: 12,
                              color: const Color(0xFF16A34A))),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        GlassPanel(
          isDark: widget.isDark,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('计薪规则',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: pal.foreground)),
                const SizedBox(height: 6),
                ...[
                  '正班：正班时长 × 时薪 ＋ 加班时长 × 时薪 × 平时倍率',
                  '周末加班：总工时 × 时薪 × 周末倍率',
                  '节假加班：总工时 × 时薪 × 节假倍率',
                  '请假 / 休息：不计薪',
                ].map((t) => Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text('· $t',
                          style: TextStyle(
                              fontSize: 12,
                              color: pal.secondary,
                              height: 1.6)),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _salaryField(
      String label, String value, void Function(String) onChanged) {
    return TextField(
      controller: TextEditingController(text: value)
        ..selection = TextSelection.collapsed(offset: value.length),
      onChanged: (v) => onChanged(v.replaceAll(RegExp(r'[^0-9.]'), '')),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 12),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
