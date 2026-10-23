import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jicun/lzdz/toast.dart';
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

/// 生理期记录（经期日历 + 排卵易孕期预测 + 记录）
/// 移植自 10-05landezhaole 的 PeriodSection.kt（v1.4.21）
class PeriodToolPage extends StatefulWidget {
  const PeriodToolPage({super.key});
  static const String pageTitle = '生理期记录';

  @override
  State<PeriodToolPage> createState() => _PeriodToolPageState();
}

// ---------- 数据模型 ----------

class PeriodRecord {
  final int id;
  final String startDate; // yyyy-MM-dd
  final String endDate; // yyyy-MM-dd
  final String note;
  final int flow; // 0=轻 1=中 2=重
  final List<String> symptoms;
  final int mood; // -1=未记 0..4

  const PeriodRecord({
    required this.id,
    required this.startDate,
    required this.endDate,
    this.note = '',
    this.flow = 1,
    this.symptoms = const [],
    this.mood = -1,
  });

  factory PeriodRecord.fromJson(Map<String, dynamic> j) => PeriodRecord(
        id: (j['id'] as num?)?.toInt() ?? 0,
        startDate: (j['start'] as String?) ?? '',
        endDate: (j['end'] as String?) ?? '',
        note: (j['note'] as String?) ?? '',
        flow: (j['flow'] as num?)?.toInt() ?? 1,
        symptoms: ((j['symptoms'] as List?) ?? [])
            .map((e) => e.toString())
            .toList(),
        mood: (j['mood'] as num?)?.toInt() ?? -1,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'start': startDate,
        'end': endDate,
        'note': note,
        'flow': flow,
        'symptoms': symptoms,
        'mood': mood,
      };
}

class PeriodSettings {
  final int cycleLen;
  final int periodLen;
  final bool autoCycle;

  const PeriodSettings({
    this.cycleLen = 28,
    this.periodLen = 5,
    this.autoCycle = true,
  });

  factory PeriodSettings.fromJson(Map<String, dynamic> j) => PeriodSettings(
        cycleLen: (j['cycleLen'] as num?)?.toInt() ?? 28,
        periodLen: (j['periodLen'] as num?)?.toInt() ?? 5,
        autoCycle: (j['autoCycle'] as bool?) ?? true,
      );

  Map<String, dynamic> toJson() => {
        'cycleLen': cycleLen,
        'periodLen': periodLen,
        'autoCycle': autoCycle,
      };
}

class PeriodForecast {
  final int cycleLen;
  final int periodLen;
  final DateTime? nextStart;
  final DateTime? ovulation;
  final DateTime? fertileStart;
  final DateTime? fertileEnd;
  final int? avgCycle;
  final int? avgPeriod;
  final String regularity;

  const PeriodForecast({
    required this.cycleLen,
    required this.periodLen,
    this.nextStart,
    this.ovulation,
    this.fertileStart,
    this.fertileEnd,
    this.avgCycle,
    this.avgPeriod,
    required this.regularity,
  });
}

// ---------- 常量 ----------

const _kRecordsKey = 'lzdz_period_records';
const _kSettingsKey = 'lzdz_period_settings';

const _periodRed = Color(0xFFE5486B);
const _periodRedLight = Color(0xFFFFD9E2);
const _fertileYellowLight = Color(0xFFFFF3D1);
const _ovulationPurple = Color(0xFF9B6BF3);

const _flowLabels = ['量少', '适中', '量多'];
const _moodEmojis = ['😢', '😟', '😐', '🙂', '😄'];
const _moodNames = ['低落', '烦躁', '平静', '不错', '开心'];
const _symptomOptions = [
  '痛经',
  '头痛',
  '腰酸',
  '乏力',
  '情绪波动',
  '失眠',
  '食欲大增',
  '乳房胀痛',
  '水肿',
  '长痘'
];

// ---------- 日期工具 ----------

DateTime? _parse(String s) {
  try {
    return DateTime.parse(s);
  } catch (_) {
    return null;
  }
}

String _fmt(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

DateTime _addDays(DateTime d, int n) => d.add(Duration(days: n));

int _daysBetween(DateTime a, DateTime b) =>
    (DateTime(b.year, b.month, b.day)
                .difference(DateTime(a.year, a.month, a.day))
                .inHours /
            24)
        .round();

DateTime _todayStart() {
  final n = DateTime.now();
  return DateTime(n.year, n.month, n.day);
}

// ---------- 预测模型 ----------

PeriodForecast buildForecast(List<PeriodRecord> records, PeriodSettings s) {
  int? avgCycle;
  if (records.length >= 2) {
    final sorted = [...records]
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    final gaps = <int>[];
    for (var i = 1; i < sorted.length; i++) {
      final a = _parse(sorted[i - 1].startDate);
      final b = _parse(sorted[i].startDate);
      if (a != null && b != null) {
        final g = _daysBetween(a, b);
        if (g >= 15 && g <= 60) gaps.add(g);
      }
    }
    if (gaps.isNotEmpty()) {
      avgCycle = (gaps.reduce((a, b) => a + b) / gaps.length + 0.5).toInt();
    }
  }

  int? avgPeriod;
  final lens = <int>[];
  for (final r in records) {
    final st = _parse(r.startDate);
    final en = _parse(r.endDate);
    if (st != null && en != null) {
      final d = _daysBetween(st, en) + 1;
      if (d >= 1 && d <= 15) lens.add(d);
    }
  }
  if (lens.isNotEmpty()) {
    avgPeriod = (lens.reduce((a, b) => a + b) / lens.length + 0.5).toInt();
  }

  String regularity = '数据不足';
  if (records.length >= 3 && avgCycle != null) {
    final sorted = [...records]
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    final gaps = <int>[];
    for (var i = 1; i < sorted.length; i++) {
      final a = _parse(sorted[i - 1].startDate);
      final b = _parse(sorted[i].startDate);
      if (a != null && b != null) {
        final g = _daysBetween(a, b);
        if (g >= 15 && g <= 60) gaps.add(g);
      }
    }
    if (gaps.length >= 2) {
      final maxDev = gaps.map((g) => (g - avgCycle!).abs()).reduce(max);
      regularity = maxDev <= 2
          ? '很规律'
          : maxDev <= 5
              ? '较规律'
              : '不太规律';
    }
  }

  final cycleLen = (s.autoCycle && avgCycle != null) ? avgCycle : s.cycleLen;
  final periodLen = avgPeriod ?? s.periodLen;

  final lastStart =
      records.isNotEmpty ? _parse(records.first.startDate) : null;
  final nextStart = lastStart == null ? null : _addDays(lastStart, cycleLen);
  final ovulation = nextStart == null ? null : _addDays(nextStart, -14);
  final fertileStart = ovulation == null ? null : _addDays(ovulation, -5);
  final fertileEnd = ovulation == null ? null : _addDays(ovulation, 1);
  return PeriodForecast(
    cycleLen: cycleLen,
    periodLen: periodLen,
    nextStart: nextStart,
    ovulation: ovulation,
    fertileStart: fertileStart,
    fertileEnd: fertileEnd,
    avgCycle: avgCycle,
    avgPeriod: avgPeriod,
    regularity: regularity,
  );
}

/// 当前阶段
class PhaseInfo {
  final String title;
  final String desc;
  final int kind; // 0无 1经期 2临近 3排卵 4易孕 5安全
  const PhaseInfo(this.title, this.desc, this.kind);
}

PhaseInfo currentPhase(
    List<PeriodRecord> records, PeriodForecast fc, DateTime today) {
  if (records.isEmpty()) return const PhaseInfo('开始记录吧', '添加第一条经期记录，开启智能预测', 0);
  for (final r in records) {
    final s = _parse(r.startDate);
    final e = _parse(r.endDate);
    if (s != null && e != null && !today.isBefore(s) && !today.isAfter(e)) {
      final day = _daysBetween(s, today) + 1;
      final total = _daysBetween(s, e) + 1;
      return PhaseInfo('经期第 $day 天', '好好休息，多喝热水', 1);
    }
  }
  if (fc.nextStart != null) {
    final pe = _addDays(fc.nextStart!, fc.periodLen - 1);
    if (!today.isBefore(fc.nextStart!) && !today.isAfter(pe)) {
      return const PhaseInfo('经期就在今天', '经期将至，注意保暖', 2);
    }
    final d = _daysBetween(today, fc.nextStart!);
    if (d >= 1 && d <= 7) {
      return PhaseInfo('距下次经期 $d 天', '经期将至，注意保暖', 2);
    }
  }
  if (fc.ovulation != null && _fmt(fc.ovulation!) == _fmt(today)) {
    return const PhaseInfo('排卵日', '易孕期峰值', 3);
  }
  if (fc.fertileStart != null &&
      fc.fertileEnd != null &&
      !today.isBefore(fc.fertileStart!) &&
      !today.isAfter(fc.fertileEnd!)) {
    return const PhaseInfo('易孕期', '受孕概率较高', 4);
  }
  return const PhaseInfo('安全期', '相对安全，放松心情', 5);
}

// ================= 页面 =================

class _PeriodToolPageState extends State<PeriodToolPage> {
  List<PeriodRecord> _records = [];
  PeriodSettings _settings = const PeriodSettings();
  int _monthOffset = 0;
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
      final records = arr
          .whereType<Map>()
          .map((e) => PeriodRecord.fromJson(
              Map<String, dynamic>.from(e as Map<dynamic, dynamic>)))
          .toList()
        ..sort((a, b) => b.startDate.compareTo(a.startDate));
      PeriodSettings settings = const PeriodSettings();
      final sraw = sp.getString(_kSettingsKey);
      if (sraw != null && sraw.isNotEmpty) {
        try {
          settings = PeriodSettings.fromJson(
              Map<String, dynamic>.from(jsonDecode(sraw) as Map));
        } catch (_) {}
      }
      if (mounted) {
        setState(() {
          _records = records;
          _settings = settings;
          _loaded = true;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loaded = true);
    }
  }

  Future<void> _persistRecords() async {
    _records.sort((a, b) => b.startDate.compareTo(a.startDate));
    final sp = await SharedPreferences.getInstance();
    await sp.setString(
        _kRecordsKey, jsonEncode(_records.map((r) => r.toJson()).toList()));
  }

  Future<void> _persistSettings() async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kSettingsKey, jsonEncode(_settings.toJson()));
  }

  void _upsert(PeriodRecord rec) {
    setState(() {
      _records = [..._records.where((r) => r.id != rec.id), rec]
        ..sort((a, b) => b.startDate.compareTo(a.startDate));
    });
    _persistRecords();
  }

  void _delete(int id) {
    setState(() {
      _records = _records.where((r) => r.id != id).toList();
    });
    _persistRecords();
  }

  void _openEditor([PeriodRecord? editing]) {
    showDialog(
      context: context,
      builder: (_) => _PeriodEditorDialog(
        initial: editing,
        onSave: (rec) {
          _upsert(rec);
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _openSettings() {
    showDialog(
      context: context,
      builder: (_) => _PeriodSettingsDialog(
        initial: _settings,
        onSave: (s) {
          setState(() => _settings = s);
          _persistSettings();
          Navigator.of(context).pop();
          showLzToast(context, '设置已保存');
        },
      ),
    );
  }

  void _exportCopy() {
    final today = _todayStart();
    final fc = buildForecast(_records, _settings);
    final sb = StringBuffer('🌸 我的生理期记录\n');
    sb.writeln(
        '平均周期 ${fc.avgCycle != null ? '${fc.avgCycle}天' : '—'} · 平均经期 ${fc.avgPeriod != null ? '${fc.avgPeriod}天' : '—'}');
    if (fc.nextStart != null) sb.writeln('预计下次 ${_fmt(fc.nextStart!)}');
    if (fc.ovulation != null) sb.writeln('预计排卵 ${_fmt(fc.ovulation!)}');
    sb.writeln('\n历史记录（${_records.length} 条）：');
    final sorted = [..._records]
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    for (final r in sorted) {
      sb.write(
          '${r.startDate}→${r.endDate} 流量${r.flow >= 0 && r.flow < _flowLabels.length ? _flowLabels[r.flow] : '?'}');
      if (r.symptoms.isNotEmpty()) sb.write(' ${r.symptoms.join('/')}');
      if (r.note.isNotBlank) sb.write(' ${r.note}');
      sb.writeln();
    }
    Clipboard.setData(ClipboardData(text: sb.toString()));
    showLzToast(context, '记录文本已复制到剪贴板');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final today = _todayStart();
    final fc = buildForecast(_records, _settings);
    final phase = currentPhase(_records, fc, today);

    return SubPage(
      title: PeriodToolPage.pageTitle,
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
                          Text('🌸 生理期记录',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: pal.foreground)),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text('经期日历 · 排卵预测 · 症状心情 · 周期统计',
                                style: TextStyle(
                                    fontSize: 11, color: pal.secondary)),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: _openSettings,
                      icon: Icon(Icons.settings, color: pal.accent),
                      tooltip: '设置',
                    ),
                    IconButton(
                      onPressed: _exportCopy,
                      icon: Icon(Icons.ios_share, color: pal.accent),
                      tooltip: '导出复制',
                    ),
                  ],
                ),
              ),
            ),
            _phaseBanner(pal, phase),
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    if (_records.isNotEmpty)
                      _cycleRing(pal, _records, fc, today),
                    Row(
                      children: [
                        Expanded(
                            child: _dashCell(pal, '预计下次',
                                fc.nextStart != null ? _fmt(fc.nextStart!) : '—')),
                        const SizedBox(width: 6),
                        Expanded(
                            child: _dashCell(pal, '排卵日',
                                fc.ovulation != null ? _fmt(fc.ovulation!) : '—')),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                            child: _dashCell(
                                pal,
                                '平均周期',
                                (fc.avgCycle != null
                                        ? '${fc.avgCycle}天'
                                        : '${fc.cycleLen}天') +
                                    ((_settings.autoCycle && fc.avgCycle != null)
                                        ? '(自动)'
                                        : ''))),
                        const SizedBox(width: 6),
                        Expanded(child: _dashCell(pal, '规律性', fc.regularity)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _calendarCard(pal, fc, today),
            if (!_loaded)
              Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text('加载中…',
                          style:
                              TextStyle(fontSize: 12, color: pal.secondary))))
            else if (_records.isEmpty)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Center(
                    child: Text('还没有记录，点击下方「添加记录」开始吧～',
                        style: TextStyle(fontSize: 12, color: pal.secondary)),
                  ),
                ),
              )
            else
              ..._records.map((r) => _recordRow(pal, isDark, r)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _openEditor(),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('添加记录',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: pal.accent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- 组件 ----------

  Widget _phaseBanner(Palette pal, PhaseInfo phase) {
    late List<Color> grad;
    switch (phase.kind) {
      case 1:
        grad = [_periodRed, const Color(0xFFFF8FB1)];
        break;
      case 2:
        grad = [const Color(0xFFFF9A3D), const Color(0xFFFFD66B)];
        break;
      case 3:
        grad = [_ovulationPurple, const Color(0xFFC4A5FF)];
        break;
      case 4:
        grad = [const Color(0xFFE8A93D), const Color(0xFFFFD66B)];
        break;
      default:
        grad = [pal.accent, pal.accent.withAlpha(180)];
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: grad),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🌸',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                Text(phase.title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(phase.desc,
                      style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.white.withAlpha(230))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashCell(Palette pal, String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: pal.subtleFill,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: pal.accent),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(label, style: TextStyle(fontSize: 10, color: pal.secondary)),
        ],
      ),
    );
  }

  Widget _cycleRing(Palette pal, List<PeriodRecord> records, PeriodForecast fc,
      DateTime today) {
    final ls = _parse(records.first.startDate);
    final dayInCycle = ls == null
        ? 0
        : max(0, _daysBetween(ls, today)) % fc.cycleLen;
    final progress = fc.cycleLen > 0 ? dayInCycle / fc.cycleLen : 0.0;
    return SizedBox(
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(140, 140),
            painter: _RingPainter(progress, pal.accent),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('第 $dayInCycle 天',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: pal.foreground)),
              Text('${(progress * 100).toInt()}% · 周期 ${fc.cycleLen} 天',
                  style: TextStyle(fontSize: 10, color: pal.secondary)),
              Text('预计 ${fc.nextStart != null ? _fmt(fc.nextStart!) : '—'}',
                  style: TextStyle(fontSize: 10, color: pal.secondary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _calendarCard(Palette pal, PeriodForecast fc, DateTime today) {
    final base = DateTime(today.year, today.month + _monthOffset, 1);
    final year = base.year;
    final month = base.month;
    final isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;

    final periodDays = <String>{};
    for (final r in _records) {
      final s = _parse(r.startDate);
      final e = _parse(r.endDate);
      if (s == null || e == null) continue;
      var d = s;
      while (!d.isAfter(e)) {
        periodDays.add(_fmt(d));
        d = _addDays(d, 1);
      }
    }
    final predictedDays = <String>{};
    if (fc.nextStart != null) {
      var cur = fc.nextStart!;
      for (var k = 0; k < 3; k++) {
        for (var i = 0; i < fc.periodLen; i++) {
          predictedDays.add(_fmt(_addDays(cur, i)));
        }
        cur = _addDays(cur, fc.cycleLen);
      }
    }
    final ovulationDays = <String>{};
    if (fc.ovulation != null) {
      var cur = fc.ovulation!;
      for (var k = 0; k < 3; k++) {
        ovulationDays.add(_fmt(cur));
        cur = _addDays(cur, fc.cycleLen);
      }
    }
    final fertileDays = <String>{};
    if (fc.fertileStart != null && fc.fertileEnd != null) {
      var bs = fc.fertileStart!;
      var be = fc.fertileEnd!;
      for (var k = 0; k < 3; k++) {
        var d = bs;
        while (!d.isAfter(be)) {
          fertileDays.add(_fmt(d));
          d = _addDays(d, 1);
        }
        bs = _addDays(bs, fc.cycleLen);
        be = _addDays(be, fc.cycleLen);
      }
    }
    fertileDays.removeAll(ovulationDays);

    final offset = DateTime(year, month, 1).weekday % 7; // 周日开头
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final todayStr = _fmt(today);
    const weekTitles = ['日', '一', '二', '三', '四', '五', '六'];

    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => setState(() => _monthOffset--),
                  icon: Icon(Icons.chevron_left, color: pal.accent),
                ),
                Expanded(
                  child: Center(
                    child: Text('$year年$month月',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: pal.foreground)),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _monthOffset++),
                  icon: Icon(Icons.chevron_right, color: pal.accent),
                ),
              ],
            ),
            Row(
              children: weekTitles
                  .map((w) => Expanded(
                          child: Center(
                              child: Text(w,
                                  style: TextStyle(
                                      fontSize: 11, color: pal.secondary)))))
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
                final ds =
                    _fmt(DateTime(year, month, dayNum));
                final isPeriod = periodDays.contains(ds);
                final isPredicted =
                    !isPeriod && predictedDays.contains(ds);
                final isOvulation = ovulationDays.contains(ds);
                final isFertile =
                    !isOvulation && fertileDays.contains(ds);
                final isToday = ds == todayStr;
                final Color bg = isPeriod
                    ? _periodRed
                    : isOvulation
                        ? _ovulationPurple
                        : isFertile
                            ? _fertileYellowLight
                            : isPredicted
                                ? _periodRedLight
                                : Colors.transparent;
                return Center(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bg,
                      border: isToday
                          ? Border.all(color: pal.accent, width: 2)
                          : isPredicted
                              ? Border.all(
                                  color: _periodRed.withAlpha(128), width: 1)
                              : null,
                    ),
                    alignment: Alignment.center,
                    child: Text('$dayNum',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: (isPeriod || isOvulation || isToday)
                                ? FontWeight.w900
                                : FontWeight.normal,
                            color: (isPeriod || isOvulation)
                                ? Colors.white
                                : pal.foreground)),
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [
                _legendDot(pal, _periodRed, '经期'),
                _legendDot(pal, _periodRedLight, '预测经期', bordered: true),
                _legendDot(pal, _ovulationPurple, '排卵日'),
                _legendDot(pal, _fertileYellowLight, '易孕期', bordered: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(Palette pal, Color color, String label,
      {bool bordered = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: bordered
                ? Border.all(color: pal.accent.withAlpha(100), width: 1)
                : null,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 11, color: pal.secondary)),
      ],
    );
  }

  Widget _recordRow(Palette pal, bool isDark, PeriodRecord r) {
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: _periodRedLight,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text('🌸', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${r.startDate} → ${r.endDate}',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: pal.foreground)),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Wrap(
                      spacing: 6,
                      children: [
                        _chip(pal,
                            '🩸${r.flow >= 0 && r.flow < _flowLabels.length ? _flowLabels[r.flow] : '?'}'),
                        if (r.mood >= 0 && r.mood < _moodEmojis.length)
                          _chip(pal, '${_moodEmojis[r.mood]}${_moodNames[r.mood]}'),
                      ],
                    ),
                  ),
                  Builder(builder: (_) {
                    final extra = [
                      if (r.symptoms.isNotEmpty) r.symptoms.join('·'),
                      if (r.note.isNotBlank) r.note,
                    ].join(' | ');
                    if (extra.isEmpty) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(extra,
                          style:
                              TextStyle(fontSize: 11, color: pal.secondary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    );
                  }),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _openEditor(r),
              icon: Icon(Icons.edit, size: 17, color: pal.accent),
              tooltip: '编辑',
              constraints: const BoxConstraints(),
            ),
            IconButton(
              onPressed: () => _confirmDelete(pal, r),
              icon: const Icon(Icons.delete, size: 17, color: Color(0xFFE53935)),
              tooltip: '删除',
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(Palette pal, String text) {
    return Container(
      decoration: BoxDecoration(
        color: pal.accent.withAlpha(24),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Text(text,
          style: TextStyle(fontSize: 10.5, color: pal.secondary)),
    );
  }

  void _confirmDelete(Palette pal, PeriodRecord r) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('删除这条记录？',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        content: Text('${r.startDate} → ${r.endDate}',
            style: const TextStyle(fontSize: 13)),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('取消')),
          ElevatedButton(
            onPressed: () {
              _delete(r.id);
              Navigator.of(ctx).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                foregroundColor: Colors.white),
            child: const Text('删除'),
          ),
        ],
      ),
    );
  }
}

// ---------- 周期环 ----------

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  _RingPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = 13.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - stroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, 0, 2 * pi,
        false, Paint()..color = color.withAlpha(38)..strokeWidth = stroke..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawArc(rect, -pi / 2, 2 * pi * progress.clamp(0.0, 1.0), false,
        Paint()..color = color..strokeWidth = stroke..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.progress != progress || old.color != color;
}

// ---------- 添加/编辑弹窗 ----------

class _PeriodEditorDialog extends StatefulWidget {
  final PeriodRecord? initial;
  final void Function(PeriodRecord) onSave;
  const _PeriodEditorDialog({this.initial, required this.onSave});

  @override
  State<_PeriodEditorDialog> createState() => _PeriodEditorDialogState();
}

class _PeriodEditorDialogState extends State<_PeriodEditorDialog> {
  String _start = '';
  String _end = '';
  String _note = '';
  int _flow = 1;
  List<String> _symptoms = [];
  int _mood = -1;
  String? _error;

  @override
  void initState() {
    super.initState();
    _start = widget.initial?.startDate ?? '';
    _end = widget.initial?.endDate ?? '';
    _note = widget.initial?.note ?? '';
    _flow = widget.initial?.flow ?? 1;
    _symptoms = [...(widget.initial?.symptoms ?? [])];
    _mood = widget.initial?.mood ?? -1;
  }

  Future<void> _pickDate(bool isStart) async {
    final init = _parse(isStart ? _start : _end) ?? DateTime.now();
    final d = await showDatePicker(
      context: context,
      initialDate: init,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (d != null) {
      setState(() {
        if (isStart) {
          _start = _fmt(d);
        } else {
          _end = _fmt(d);
        }
        _error = null;
      });
    }
  }

  void _save() {
    if (_start.isEmpty || _end.isEmpty) {
      setState(() => _error = '请选择开始和结束日期');
      return;
    }
    final s = _parse(_start);
    final e = _parse(_end);
    if (s == null || e == null) {
      setState(() => _error = '日期解析失败');
      return;
    }
    if (e.isBefore(s)) {
      setState(() => _error = '结束日期不能早于开始日期');
      return;
    }
    widget.onSave(PeriodRecord(
      id: widget.initial?.id ?? DateTime.now().millisecondsSinceEpoch,
      startDate: _start,
      endDate: _end,
      note: _note.trim(),
      flow: _flow,
      symptoms: _symptoms,
      mood: _mood,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return AlertDialog(
      title: Text(widget.initial == null ? '🌸 添加记录' : '🌸 编辑记录',
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _dateBox(pal, '开始', _start, () => _pickDate(true))),
                const SizedBox(width: 8),
                Expanded(child: _dateBox(pal, '结束', _end, () => _pickDate(false))),
              ],
            ),
            const SizedBox(height: 10),
            Text('经血量',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: pal.foreground)),
            const SizedBox(height: 6),
            Row(
              children: List.generate(_flowLabels.length, (i) {
                final sel = _flow == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _flow = i),
                    child: Container(
                      margin: EdgeInsets.only(
                          right: i < _flowLabels.length - 1 ? 8 : 0),
                      decoration: BoxDecoration(
                        color: sel ? pal.accent : pal.accent.withAlpha(20),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      child: Text(_flowLabels[i],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                                  sel ? Colors.white : pal.foreground)),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Text('症状（可多选）',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: pal.foreground)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: _symptomOptions.map((s) {
                final sel = _symptoms.contains(s);
                return GestureDetector(
                  onTap: () => setState(() {
                    if (sel) {
                      _symptoms.remove(s);
                    } else {
                      _symptoms.add(s);
                    }
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: sel ? pal.accent : pal.accent.withAlpha(20),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: sel
                              ? Colors.transparent
                              : pal.accent.withAlpha(60),
                          width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    child: Text(s,
                        style: TextStyle(
                            fontSize: 11.5,
                            color: sel ? Colors.white : pal.foreground)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text('心情',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: pal.foreground)),
            const SizedBox(height: 6),
            Row(
              children: List.generate(_moodEmojis.length, (i) {
                final sel = _mood == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _mood = sel ? -1 : i),
                    child: Container(
                      margin: EdgeInsets.only(
                          right: i < _moodEmojis.length - 1 ? 6 : 0),
                      decoration: BoxDecoration(
                        color: sel
                            ? pal.accent.withAlpha(45)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: pal.accent.withAlpha(sel ? 150 : 38),
                            width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      alignment: Alignment.center,
                      child: Text(_moodEmojis[i],
                          style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: _note)
                ..selection =
                    TextSelection.collapsed(offset: _note.length),
              onChanged: (v) =>
                  _note = v.length > 60 ? v.substring(0, 60) : v,
              maxLength: 60,
              decoration: const InputDecoration(
                labelText: '备注（可选）',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(_error!,
                    style: const TextStyle(
                        fontSize: 11, color: Color(0xFFE53935))),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消')),
        ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
              backgroundColor: pal.accent, foregroundColor: Colors.white),
          child:
              const Text('保存', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _dateBox(
      Palette pal, String label, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: pal.accent.withAlpha(80), width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text('$label\n${value.isEmpty ? '选择' : value}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: pal.foreground)),
      ),
    );
  }
}

// ---------- 设置弹窗 ----------

class _PeriodSettingsDialog extends StatefulWidget {
  final PeriodSettings initial;
  final void Function(PeriodSettings) onSave;
  const _PeriodSettingsDialog({required this.initial, required this.onSave});

  @override
  State<_PeriodSettingsDialog> createState() => _PeriodSettingsDialogState();
}

class _PeriodSettingsDialogState extends State<_PeriodSettingsDialog> {
  String _cycleLen = '28';
  String _periodLen = '5';
  bool _autoCycle = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cycleLen = widget.initial.cycleLen.toString();
    _periodLen = widget.initial.periodLen.toString();
    _autoCycle = widget.initial.autoCycle;
  }

  void _save() {
    final c = int.tryParse(_cycleLen);
    final p = int.tryParse(_periodLen);
    if (c == null || c < 15 || c > 60) {
      setState(() => _error = '周期天数应在 15~60 天');
      return;
    }
    if (p == null || p < 1 || p > 15) {
      setState(() => _error = '经期天数应在 1~15 天');
      return;
    }
    widget.onSave(PeriodSettings(cycleLen: c, periodLen: p, autoCycle: _autoCycle));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return AlertDialog(
      title: const Text('⚙️ 周期设置',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('自动计算周期',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: pal.foreground)),
                      Text('有足够记录时用平均周期预测',
                          style:
                              TextStyle(fontSize: 11, color: pal.secondary)),
                    ],
                  ),
                ),
                Switch(
                    value: _autoCycle,
                    onChanged: (v) => setState(() => _autoCycle = v)),
              ],
            ),
            const SizedBox(height: 4),
            TextField(
              controller: TextEditingController(text: _cycleLen)
                ..selection =
                    TextSelection.collapsed(offset: _cycleLen.length),
              onChanged: (v) => _cycleLen =
                  v.replaceAll(RegExp(r'[^0-9]'), '').take(2).toString(),
              enabled: !_autoCycle,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '周期天数（手动）',
                suffixText: '天',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: _periodLen)
                ..selection =
                    TextSelection.collapsed(offset: _periodLen.length),
              onChanged: (v) => _periodLen =
                  v.replaceAll(RegExp(r'[^0-9]'), '').take(2).toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '经期天数',
                suffixText: '天',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Text('说明：排卵日 = 下次经期前 14 天；易孕期 = 排卵日前 5 天至后 1 天。预测仅供参考，身体不适请及时就医。',
                style: TextStyle(fontSize: 10.5, color: pal.secondary)),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(_error!,
                    style: const TextStyle(
                        fontSize: 11, color: Color(0xFFE53935))),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消')),
        ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
              backgroundColor: pal.accent, foregroundColor: Colors.white),
          child:
              const Text('保存', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

extension on String {
  bool get isNotBlank => trim().isNotEmpty;
}
