import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

/// 离线百宝：LED 滚动弹幕 / 电子木鱼 / 随机做决定 / SOS 爆闪
///
/// 移植自懒得找了 OfflineTreasureSection.kt：
/// - 顶部 4 个小工具标签切换
/// - LED：弹幕文字输入 + 6 色霓虹色彩选择 + 全屏横向滚动横幅（点击退出）
/// - 电子木鱼：点击计数 + 震动反馈（HapticFeedback）+ 缩放动效 + 「功德 +1 · 烦恼-1」浮字
///   + 自动积德开关（750ms 自动敲）+ 清空计数
/// - 随机做决定：今天吃什么 / 抛硬币 / 掷骰子三档，摇出结果并震动
/// - SOS：全屏白光按国际摩尔斯电码（... --- ...）循环爆闪，点击退出
class OfflineTreasureToolPage extends StatefulWidget {
  const OfflineTreasureToolPage({super.key});
  static const String pageTitle = '离线百宝';

  @override
  State<OfflineTreasureToolPage> createState() => _OfflineTreasureToolPageState();
}

class _OfflineTreasureToolPageState extends State<OfflineTreasureToolPage> {
  String _tool = 'LED_BANNER';

  static const _tools = <({String id, String label})>[
    (id: 'LED_BANNER', label: '📺 手持LED弹幕'),
    (id: 'WOODEN_FISH', label: '🪵 电子功德木鱼'),
    (id: 'DECIDER', label: '🎲 随机做决定器'),
    (id: 'SOS_LIGHT', label: '🚨 SOS屏幕爆闪'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: OfflineTreasureToolPage.pageTitle,
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
                        gradient: const LinearGradient(colors: [Color(0xFFFF8A3D), Color(0xFFE23A3A)]),
                      ),
                      child: const Icon(Icons.lightbulb, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('离线百宝 · 实用黑科技小组件',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: pal.foreground)),
                          Text('手持LED滚动弹幕 · 电子功德木鱼 · 随机做决定 · SOS白光爆闪',
                              style: TextStyle(fontSize: 11.5, color: pal.secondary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 2. 小工具标签栏
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final t in _tools) ...[
                    ChoiceChip(
                      label: Text(t.label, style: const TextStyle(fontSize: 12)),
                      selected: _tool == t.id,
                      onSelected: (_) => setState(() => _tool = t.id),
                      selectedColor: const Color(0xFFE23A3A),
                      labelStyle: TextStyle(
                          color: _tool == t.id ? Colors.white : pal.foreground,
                          fontWeight: _tool == t.id ? FontWeight.bold : FontWeight.normal),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            // 3. 子工具
            if (_tool == 'LED_BANNER') const _LedBannerTool(),
            if (_tool == 'WOODEN_FISH') const _WoodenFishTool(),
            if (_tool == 'DECIDER') const _DeciderTool(),
            if (_tool == 'SOS_LIGHT') const _SosLightTool(),
          ],
        ),
      ),
    );
  }
}

/// 1. 手持 LED 滚动弹幕
class _LedBannerTool extends StatefulWidget {
  const _LedBannerTool();

  @override
  State<_LedBannerTool> createState() => _LedBannerToolState();
}

class _LedBannerToolState extends State<_LedBannerTool> {
  final TextEditingController _textCtrl = TextEditingController();
  int _colorIdx = 0;

  static const _neonColors = <({Color color, String name})>[
    (color: Color(0xFFFFEB3B), name: '荧光黄'),
    (color: Color(0xFFFF5722), name: '火焰橙'),
    (color: Color(0xFF00E5FF), name: '电光青'),
    (color: Color(0xFFFF4081), name: '霓虹粉'),
    (color: Color(0xFF00E676), name: '激光绿'),
    (color: Color(0xFFFFFFFF), name: '纯净白'),
  ];

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('手持滚动跑马灯配置',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: pal.foreground)),
            const SizedBox(height: 10),
            TextField(
              controller: _textCtrl,
              decoration: InputDecoration(
                labelText: '输入弹幕大字',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            const SizedBox(height: 10),
            Text('霓虹文字色彩：', style: TextStyle(fontSize: 12, color: pal.secondary)),
            const SizedBox(height: 6),
            Row(
              children: [
                for (var i = 0; i < _neonColors.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () => setState(() => _colorIdx = i),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _neonColors[i].color,
                          border: Border.all(
                              width: _colorIdx == i ? 2 : 1,
                              color: _colorIdx == i ? Colors.black : Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  final text = _textCtrl.text.trim().isEmpty ? '懒得找了' : _textCtrl.text.trim();
                  showDialog(
                    context: context,
                    barrierColor: Colors.black,
                    builder: (_) => _LedFullscreenDialog(text: text, color: _neonColors[_colorIdx].color),
                  );
                },
                icon: const Icon(Icons.fullscreen, size: 16),
                label: const Text('开启全屏滚动横幅 (点击退出)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE23A3A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// LED 全屏滚动横幅（横向滚动文字动画，点击退出）
class _LedFullscreenDialog extends StatefulWidget {
  const _LedFullscreenDialog({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  State<_LedFullscreenDialog> createState() => _LedFullscreenDialogState();
}

class _LedFullscreenDialogState extends State<_LedFullscreenDialog> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    // 源码 scrollSpeed 固定为中档（2 -> 5000ms），无 UI 可调，保持一致
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 72, fontWeight: FontWeight.w900);
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final tp = TextPainter(
                text: TextSpan(text: widget.text, style: style),
                textDirection: TextDirection.ltr,
              )..layout();
              final startX = constraints.maxWidth;
              final endX = -tp.width;
              return Stack(
                children: [
                  Center(
                    child: AnimatedBuilder(
                      animation: _ctrl,
                      builder: (_, __) {
                        final x = startX + (endX - startX) * _ctrl.value;
                        return Transform.translate(
                          offset: Offset(x, 0),
                          child: Text(widget.text, style: style.copyWith(color: widget.color)),
                        );
                      },
                    ),
                  ),
                  const Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: Text('轻触屏幕任意位置关闭',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Color(0x66FFFFFF))),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 2. 电子功德木鱼
class _WoodenFishTool extends StatefulWidget {
  const _WoodenFishTool();

  @override
  State<_WoodenFishTool> createState() => _WoodenFishToolState();
}

class _WoodenFishToolState extends State<_WoodenFishTool> {
  int _count = 0;
  double _scale = 1.0;
  bool _autoPlay = false;
  bool _showPlus = false;
  Timer? _autoTimer;
  Timer? _plusTimer;

  @override
  void dispose() {
    _autoTimer?.cancel();
    _plusTimer?.cancel();
    super.dispose();
  }

  Future<void> _hitFish() async {
    if (!mounted) return;
    setState(() {
      _count++;
      _scale = 0.88;
      _showPlus = true;
    });
    HapticFeedback.vibrate();
    await Future.delayed(const Duration(milliseconds: 80));
    if (!mounted) return;
    setState(() => _scale = 1.05);
    await Future.delayed(const Duration(milliseconds: 80));
    if (!mounted) return;
    setState(() => _scale = 1.0);
    _plusTimer?.cancel();
    _plusTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _showPlus = false);
    });
  }

  void _setAuto(bool v) {
    setState(() => _autoPlay = v);
    _autoTimer?.cancel();
    if (v) {
      _autoTimer = Timer.periodic(const Duration(milliseconds: 750), (_) => _hitFish());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('今日累计功德：', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFFFF8A3D))),
                Text('$_count', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFFFF8A3D))),
                Row(
                  children: [
                    Text('自动积德', style: TextStyle(fontSize: 12, color: pal.secondary)),
                    const SizedBox(width: 4),
                    Switch(value: _autoPlay, onChanged: _setAuto),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedScale(
                    scale: _scale,
                    duration: const Duration(milliseconds: 80),
                    child: GestureDetector(
                      onTap: _hitFish,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(colors: [Color(0xFF8D6E63), Color(0xFF4E342E)]),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.self_improvement, size: 68, color: Color(0xFFFFD54F)),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _showPlus ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 120),
                      child: Text('功德 +1 · 烦恼-1',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFFFB300))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text('点击木鱼即可敲击積德 · 烦恼归零', style: TextStyle(fontSize: 12, color: pal.secondary)),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => setState(() => _count = 0),
              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: const Text('清空计数', style: TextStyle(fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }
}

/// 3. 随机做决定器
class _DeciderTool extends StatefulWidget {
  const _DeciderTool();

  @override
  State<_DeciderTool> createState() => _DeciderToolState();
}

class _DeciderToolState extends State<_DeciderTool> {
  String _type = 'FOOD'; // FOOD, COIN, DICE
  String _result = '点击下方立即摇出决定！';

  static const _foodOptions = <String>[
    '火锅 🍲', '沙拉轻食 🥗', '螺蛳粉 🍜', '烧烤撸串 🍢', '自己下厨 🍳',
    '汉堡披萨 🍔', '川菜小炒 🥘', '减脂断食 💧', '日料寿司 🍣',
  ];
  static const _types = <({String id, String label})>[
    (id: 'FOOD', label: '今天吃什么'),
    (id: 'COIN', label: '抛硬币'),
    (id: 'DICE', label: '掷骰子'),
  ];

  void _roll() {
    final rnd = Random();
    setState(() {
      if (_type == 'FOOD') {
        _result = '今天就吃：${_foodOptions[rnd.nextInt(_foodOptions.length)]}！';
      } else if (_type == 'COIN') {
        _result = rnd.nextInt(2) == 0 ? '🪙 硬币正面（支持/去做）' : '🪙 硬币反面（拒绝/放弃）';
      } else {
        _result = '🎲 掷出点数：${1 + rnd.nextInt(6)} 点';
      }
    });
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                for (final t in _types) ...[
                  ChoiceChip(
                    label: Text(t.label, style: const TextStyle(fontSize: 12)),
                    selected: _type == t.id,
                    onSelected: (_) => setState(() {
                      _type = t.id;
                      _result = '点击下方立即摇出决定！';
                    }),
                    selectedColor: const Color(0xFFE23A3A),
                    labelStyle: TextStyle(color: _type == t.id ? Colors.white : pal.foreground),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: pal.secondary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFFF8A3D).withValues(alpha: 0.2)),
              ),
              alignment: Alignment.center,
              child: Text(_result,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: pal.foreground)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _roll,
                icon: const Icon(Icons.casino, size: 16),
                label: const Text('立即随机抽取', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8A3D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 4. SOS 屏幕爆闪
class _SosLightTool extends StatelessWidget {
  const _SosLightTool();

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.flash_on, size: 20, color: Color(0xFFE23A3A)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text('紧急求救 SOS 屏幕高频爆闪',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: pal.foreground)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '开启后全屏白光将按照国际标准摩尔斯电码 (... --- ...) 极高亮度循环爆闪，夜间骑行防追尾或户外迷路求援极具穿透力。',
              style: TextStyle(fontSize: 12, height: 1.4, color: pal.secondary),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black,
                    builder: (_) => const _SosFullscreenDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE23A3A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('启动全屏 SOS 闪烁模式', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// SOS 全屏爆闪（摩尔斯电码 ... --- ... 循环，定时器切换背景色，点击退出）
class _SosFullscreenDialog extends StatefulWidget {
  const _SosFullscreenDialog();

  @override
  State<_SosFullscreenDialog> createState() => _SosFullscreenDialogState();
}

class _SosFullscreenDialogState extends State<_SosFullscreenDialog> {
  // 与源码一致的摩尔斯序列（毫秒）
  static const _morse = <int>[150, 150, 150, 150, 150, 400, 400, 150, 400, 150, 400, 400, 150, 150, 150, 150, 150, 1000];
  bool _flashOn = true;
  bool _active = true;

  @override
  void initState() {
    super.initState();
    _loop();
  }

  Future<void> _loop() async {
    while (_active && mounted) {
      for (final ms in _morse) {
        await Future.delayed(Duration(milliseconds: ms));
        if (!_active || !mounted) return;
        setState(() => _flashOn = !_flashOn);
      }
    }
  }

  @override
  void dispose() {
    _active = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: _flashOn ? Colors.white : Colors.black,
          alignment: Alignment.center,
          child: Text(
            'SOS 模式运行中 · 点击任意位置退出',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w900, color: _flashOn ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
