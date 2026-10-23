import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

/// 年龄算术：生日 -> 精确年龄 / 生肖 / 天干地支 / 人生进度条
///
/// 移植自懒得找了 AgeCalculatorSection.kt：
/// - 可任意输入 0~150 岁反推出生年，+/- 步进，快捷年龄 chips
/// - 出生月/日文本输入（允许删空），精准推算西方星座
/// - 精确到年月日的年龄、累计天/小时/分钟/秒（秒每秒实时刷新）
/// - 生肖 + 天干地支纪年、出生星期、下个生日倒计时
/// - 80 岁人生电量进度条、剩余周末/三餐/见父母次数
class AgeCalcToolPage extends StatefulWidget {
  const AgeCalcToolPage({super.key});
  static const String pageTitle = '年龄算术';

  @override
  State<AgeCalcToolPage> createState() => _AgeCalcToolPageState();
}

const List<String> _chineseZodiac = <String>['鼠', '牛', '虎', '兔', '龙', '蛇', '马', '羊', '猴', '鸡', '狗', '猪'];
const List<String> _heavenlyStems = <String>['甲', '乙', '丙', '丁', '戊', '己', '庚', '辛', '壬', '癸'];
const List<String> _earthlyBranches = <String>['子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌', '亥'];
const List<int> _quickAges = <int>[1, 6, 12, 16, 18, 20, 22, 25, 28, 30, 35, 40, 50, 60, 70, 80, 100];

/// 根据出生月/日精准判断西方星座（与源码边界一致）
String _westernZodiac(int month, int day) {
  final m = month.clamp(1, 12);
  final d = day.clamp(1, 31);
  if ((m == 1 && d >= 20) || (m == 2 && d <= 18)) return '♒ 水瓶座';
  if ((m == 2 && d >= 19) || (m == 3 && d <= 20)) return '♓ 双鱼座';
  if ((m == 3 && d >= 21) || (m == 4 && d <= 19)) return '♈ 白羊座';
  if ((m == 4 && d >= 20) || (m == 5 && d <= 20)) return '♉ 金牛座';
  if ((m == 5 && d >= 21) || (m == 6 && d <= 21)) return '♊ 双子座';
  if ((m == 6 && d >= 22) || (m == 7 && d <= 22)) return '♋ 巨蟹座';
  if ((m == 7 && d >= 23) || (m == 8 && d <= 22)) return '♌ 狮子座';
  if ((m == 8 && d >= 23) || (m == 9 && d <= 22)) return '♍ 处女座';
  if ((m == 9 && d >= 23) || (m == 10 && d <= 23)) return '♎ 天秤座';
  if ((m == 10 && d >= 24) || (m == 11 && d <= 22)) return '♏ 天蝎座';
  if ((m == 11 && d >= 23) || (m == 12 && d <= 21)) return '♐ 射手座';
  return '♑ 摩羯座';
}

String _weekdayZh(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return '星期一';
    case DateTime.tuesday:
      return '星期二';
    case DateTime.wednesday:
      return '星期三';
    case DateTime.thursday:
      return '星期四';
    case DateTime.friday:
      return '星期五';
    case DateTime.saturday:
      return '星期六';
    default:
      return '星期日';
  }
}

class _AgeCalcToolPageState extends State<AgeCalcToolPage> {
  int _birthYear = 2000;
  int _birthMonth = 1;
  int _birthDay = 1;
  late TextEditingController _ageCtrl;
  late TextEditingController _monthCtrl;
  late TextEditingController _dayCtrl;
  DateTime _now = DateTime.now();
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ageCtrl = TextEditingController(text: (DateTime.now().year - 2000).toString());
    _monthCtrl = TextEditingController(text: '1');
    _dayCtrl = TextEditingController(text: '1');
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _ageCtrl.dispose();
    _monthCtrl.dispose();
    _dayCtrl.dispose();
    super.dispose();
  }

  void _applyAge(int ageVal) {
    final safe = ageVal.clamp(0, 150);
    _ageCtrl.text = safe.toString();
    setState(() => _birthYear = DateTime.now().year - safe);
  }

  Future<void> _pickBirthday() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(_birthYear, _birthMonth.clamp(1, 12), _birthDay.clamp(1, 28)),
      firstDate: DateTime(1850),
      lastDate: DateTime.now(),
      helpText: '选择生日',
      cancelText: '取消',
      confirmText: '确认',
    );
    if (picked == null) return;
    setState(() {
      _birthYear = picked.year;
      _birthMonth = picked.month;
      _birthDay = picked.day;
      _monthCtrl.text = picked.month.toString();
      _dayCtrl.text = picked.day.toString();
      _ageCtrl.text = (DateTime.now().year - picked.year).clamp(0, 150).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    final birth = DateTime(_birthYear, _birthMonth.clamp(1, 12), _birthDay.clamp(1, 28));

    // 精确年月日
    int calcYears = _now.year - birth.year;
    int calcMonths = _now.month - birth.month;
    int calcDays = _now.day - birth.day;
    if (calcDays < 0) {
      final prevMonth = DateTime(_now.year, _now.month, 0);
      calcDays += prevMonth.day;
      calcMonths--;
    }
    if (calcMonths < 0) {
      calcMonths += 12;
      calcYears--;
    }
    calcYears = calcYears < 0 ? 0 : calcYears;

    final lived = _now.difference(birth);
    final livedSeconds = lived.inSeconds < 0 ? 0 : lived.inSeconds;
    final livedMinutes = livedSeconds ~/ 60;
    final livedHours = livedSeconds ~/ 3600;
    final livedDays = livedSeconds ~/ 86400;

    // 生肖与干支
    String zodiac() {
      final idx = ((_birthYear - 4) % 12 + 12) % 12;
      return _chineseZodiac[idx];
    }

    String stemBranch() {
      final s = _heavenlyStems[((_birthYear - 4) % 10 + 10) % 10];
      final b = _earthlyBranches[((_birthYear - 4) % 12 + 12) % 12];
      return '$s$b${zodiac()} 年';
    }

    final zodiacSign = _westernZodiac(_birthMonth, _birthDay);
    final birthWeekday = _weekdayZh(birth.weekday);

    // 下次生日倒计时
    int nextBirthdayDays() {
      var next = DateTime(_now.year, _birthMonth.clamp(1, 12), _birthDay.clamp(1, 28));
      if (next.isBefore(_now)) next = DateTime(_now.year + 1, _birthMonth.clamp(1, 12), _birthDay.clamp(1, 28));
      final d = next.difference(_now).inDays;
      return d < 0 ? 0 : d;
    }

    // 80 岁人生电量
    const totalLifeDays = 80 * 365.25;
    final lifeProgress = (livedDays / totalLifeDays).clamp(0.0, 1.0);
    final remainingDays = (totalLifeDays - livedDays).toInt().clamp(0, 1 << 62);
    final remainingWeekends = remainingDays ~/ 7;
    final remainingMeals = remainingDays * 3;
    final remainingParentVisits = remainingDays ~/ 365;

    return SubPage(
      title: AgeCalcToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            // 1. Hero 卡
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(colors: [Color(0xFFE23A3A), Color(0xFFFF8A3D)]),
                      ),
                      child: const Icon(Icons.date_range, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('年龄推算 · 人生进度时钟',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: pal.foreground)),
                          const SizedBox(height: 2),
                          Text('生辰精准计算 · 生肖天干地支 · 时光沙漏与陪伴度量',
                              style: TextStyle(fontSize: 11.5, color: pal.secondary)),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _pickBirthday,
                      icon: const Icon(Icons.calendar_month, size: 14),
                      label: const Text('选择生日', style: TextStyle(fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE23A3A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 2. 任意输入年龄推算
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.edit, size: 16, color: Color(0xFFE23A3A)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text('可任意输入年龄推算',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: pal.foreground)),
                        ),
                        Text('支持0~150任意年龄即时测算', style: TextStyle(fontSize: 11, color: pal.secondary)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _stepBtn(context, Icons.remove, () {
                          final cur = int.tryParse(_ageCtrl.text) ?? calcYears;
                          _applyAge(cur - 1);
                        }),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _ageCtrl,
                            keyboardType: TextInputType.number,
                            singleLine: true,
                            onChanged: (t) {
                              final filtered = t.replaceAll(RegExp(r'[^0-9]'), '');
                              if (filtered != t) {
                                _ageCtrl.text = filtered;
                                _ageCtrl.selection = TextSelection.collapsed(offset: filtered.length);
                              }
                              final age = int.tryParse(filtered);
                              if (age != null && age >= 0 && age <= 150) {
                                setState(() => _birthYear = DateTime.now().year - age);
                              }
                            },
                            decoration: InputDecoration(
                              labelText: '输入任意年龄 (岁)',
                              labelStyle: const TextStyle(fontSize: 11),
                              suffixText: '岁',
                              suffixStyle: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFE23A3A)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFE23A3A)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _stepBtn(context, Icons.add, () {
                          final cur = int.tryParse(_ageCtrl.text) ?? calcYears;
                          _applyAge(cur + 1);
                        }),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // 出生月/日输入 + 星座
                    Row(
                      children: [
                        Text('出生', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: TextField(
                            controller: _monthCtrl,
                            keyboardType: TextInputType.number,
                            singleLine: true,
                            onChanged: (t) {
                              final filtered = t.replaceAll(RegExp(r'[^0-9]'), '');
                              final v = filtered.length > 2 ? filtered.substring(0, 2) : filtered;
                              if (v != t) {
                                _monthCtrl.text = v;
                                _monthCtrl.selection = TextSelection.collapsed(offset: v.length);
                              }
                              final m = int.tryParse(v);
                              if (m != null) setState(() => _birthMonth = m.clamp(1, 12));
                            },
                            decoration: InputDecoration(
                              labelText: '月份',
                              labelStyle: const TextStyle(fontSize: 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFFF8A3D)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _dayCtrl,
                            keyboardType: TextInputType.number,
                            singleLine: true,
                            onChanged: (t) {
                              final filtered = t.replaceAll(RegExp(r'[^0-9]'), '');
                              final v = filtered.length > 2 ? filtered.substring(0, 2) : filtered;
                              if (v != t) {
                                _dayCtrl.text = v;
                                _dayCtrl.selection = TextSelection.collapsed(offset: v.length);
                              }
                              final d = int.tryParse(v);
                              if (d != null) setState(() => _birthDay = d.clamp(1, 31));
                            },
                            decoration: InputDecoration(
                              labelText: '日期',
                              labelStyle: const TextStyle(fontSize: 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFFF8A3D)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('→ $zodiacSign',
                            style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w900, color: Color(0xFF7C4DFF))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('快捷设定：', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: pal.secondary)),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: _quickAges.map((q) {
                        final selected = _ageCtrl.text == q.toString();
                        return ChoiceChip(
                          label: Text('${q}岁', style: const TextStyle(fontSize: 11)),
                          selected: selected,
                          onSelected: (_) => _applyAge(q),
                          selectedColor: const Color(0xFFE23A3A).withValues(alpha: 0.15),
                          labelStyle: TextStyle(color: selected ? const Color(0xFFE23A3A) : pal.foreground),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // 3. 生辰档案
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('出生日期：$_birthYear年$_birthMonth月$_birthDay日 ($birthWeekday)',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: pal.foreground)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8A3D).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(stemBranch(),
                              style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFFFF8A3D))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: _metricBox(context, '星座', zodiacSign, highlight: true)),
                        const SizedBox(width: 8),
                        Expanded(child: _metricBox(context, '生肖', '${zodiac()} 年生（${stemBranch()}）')),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text('你已在世界上生活了：', style: TextStyle(fontSize: 13, color: pal.secondary)),
                        Text('$calcYears', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFFE23A3A))),
                        Text('岁 ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: pal.foreground)),
                        Text('$calcMonths', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFF8A3D))),
                        Text('个月 ', style: TextStyle(fontSize: 13, color: pal.foreground)),
                        Text('$calcDays', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFF8A3D))),
                        Text('天', style: TextStyle(fontSize: 13, color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _metricBox(context, '累计天数', '$livedDays 天')),
                        const SizedBox(width: 8),
                        Expanded(child: _metricBox(context, '累计小时', '$livedHours 小时')),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(child: _metricBox(context, '累计分钟', '$livedMinutes 分')),
                        const SizedBox(width: 8),
                        Expanded(child: _metricBox(context, '累计秒数 (实时)', '$livedSeconds 秒', highlight: true)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 4. 下个生日与人生进度
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.cake, size: 18, color: Color(0xFFE23A3A)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text('距离下一个生日还有：',
                              style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: pal.foreground)),
                        ),
                        Text(
                          nextBirthdayDays() == 0 ? '🎂 今天就是生日！祝你快乐！' : '${nextBirthdayDays()} 天',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Color(0xFFE23A3A)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        const Icon(Icons.hourglass_bottom, size: 16, color: Color(0xFFFF8A3D)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text('80岁人生电量进度：',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: pal.foreground)),
                        ),
                        Text('${(lifeProgress * 100).toStringAsFixed(2)}%',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Color(0xFFFF8A3D))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: LinearProgressIndicator(
                        value: lifeProgress,
                        minHeight: 10,
                        backgroundColor: Colors.black.withValues(alpha: 0.08),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF8A3D)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: pal.secondary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.schedule, size: 14, color: Color(0xFFFF8A3D)),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text('时光刻度：大约还剩 $remainingWeekends 个周末、可享用 $remainingMeals 顿一日三餐。',
                                    style: TextStyle(fontSize: 11.5, color: pal.secondary)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.favorite, size: 14, color: Color(0xFFE23A3A)),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text('亲情陪伴：若每年过年回老家一次，见父母的次数仅剩约 $remainingParentVisits 次。珍惜当下，常回家看看。',
                                    style: TextStyle(fontSize: 11.5, color: pal.secondary)),
                              ),
                            ],
                          ),
                        ],
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

  Widget _stepBtn(BuildContext context, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CupertinoTheme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.12)
              : Colors.black.withValues(alpha: 0.06),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _metricBox(BuildContext context, String title, String value, {bool highlight = false}) {
    const accent = Color(0xFFE23A3A);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: highlight ? accent.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(10),
        border: highlight ? Border.all(color: accent.withValues(alpha: 0.25)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 10.5, color: Palette.of(CupertinoTheme.of(context).brightness == Brightness.dark).secondary)),
          const SizedBox(height: 2),
          Text(value,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                  color: highlight ? accent : Palette.of(CupertinoTheme.of(context).brightness == Brightness.dark).foreground)),
        ],
      ),
    );
  }
}
