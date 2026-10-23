import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/lzdz/toast.dart';
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

class _MouthpieceCategory {
  const _MouthpieceCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.triggers,
    required this.templates,
  });

  final String id;
  final String name;
  final String icon;
  final List<String> triggers;
  final List<(String, String)> templates; // (语气, 回怼话术)
}

const List<_MouthpieceCategory> _categories = [
  _MouthpieceCategory(
    id: 'keyboard',
    name: '怼杠精网络喷子',
    icon: '💥',
    triggers: [
      '就我觉得一般吗？',
      '不会吧不会吧，真有人信？',
      '你怎么这么玻璃心啊',
      '你要这么想我也没办法',
      '认真你就输了',
    ],
    templates: [
      ('犀利暴击', '对对对，宇宙起源于你的觉得，连大爆炸都得先向你的审美报备。'),
      ('优雅体面', '您独特的思维方式确实填补了人类未曾设想的认知空白，叹为观止。'),
      ('幽默自嘲', '你说得对，但我这人有个毛病，就是不爱听正确的话，尤其是你说的。'),
      ('降维打击', '如果脑子是用来做装饰的，那您今天这身极简风格确实很有品味。'),
    ],
  ),
  _MouthpieceCategory(
    id: 'workplace',
    name: '职场高情商反击',
    icon: '💼',
    triggers: [
      '能者多劳，周末辛苦加个班',
      '年轻人不要光看眼前待遇，要有格局',
      '这点小事你都做不好？',
      '公司不是慈善机构',
      '大家都在加班，你怎么先走了',
    ],
    templates: [
      ('犀利暴击', '能者多劳的前提是能者多得，您只画饼不给面粉，这叫无米之炊。'),
      ('优雅体面', '非常理解领导的期待，为了周一能以充沛精力产出高质量成果，我按劳动法进行科学休整。'),
      ('幽默自嘲', '格局太大容易着凉，我这人胃浅，目前只吃得下按时足额发放的加班费。'),
      ('降维打击', '加班是能力的补丁，准时下班是效率的体现。工作已高质量交付，告辞。'),
    ],
  ),
  _MouthpieceCategory(
    id: 'relatives',
    name: '亲戚催婚问工资',
    icon: '🧧',
    triggers: [
      '多大年纪了还不结婚，眼光太高了',
      '现在一个月能挣多少钱啊？',
      '女孩子读那么多书有什么用',
      '什么时候买房买车啊？',
      '我家孩子今年考上编制了，你呢',
    ],
    templates: [
      ('犀利暴击', '国家都提倡优生优育，我不急着结婚，正是为了对下一代的基因和未来高度负责。'),
      ('优雅体面', '托您的福，衣食无忧身体健康，倒是听说表哥房贷压力不小，您可得多帮衬点。'),
      ('幽默自嘲', '赚得不多，刚好够买几把锁，把自己生活的门锁好，不让无关的人随便进来指点。'),
      ('降维打击', '结婚是人生的体验卡，不是打卡机；我单身是因为选择多，不是因为凑合快。'),
    ],
  ),
  _MouthpieceCategory(
    id: 'yinyang',
    name: '优雅阴阳怪气',
    icon: '🍵',
    triggers: [
      '你平时看着挺朴素的',
      '你人真好，就是太好说话了',
      '你怎么又换发型了，之前挺好的',
      '哎呀我这个人说话比较直',
    ],
    templates: [
      ('犀利暴击', '您说话不是直，是根本没走脑子，直接从造化弄人那里抄了条捷径流出来的。'),
      ('优雅体面', '您这份未经雕琢的原始野性，在大自然纪录片里一定很受保护动物的青睐。'),
      ('幽默自嘲', '我朴素是因为气质由内而发，不像有些人，全靠声音大撑场面。'),
      ('降维打击', '既然您承认自己说话不过脑子，那我就当是对讲机漏电，原谅您这一次。'),
    ],
  ),
  _MouthpieceCategory(
    id: 'borrow_money',
    name: '委婉拒绝借钱',
    icon: '💰',
    triggers: [
      '在吗？借我五千周转一下，下周还',
      '咱们这交情，你还不信我？',
      '你不是刚发了年终奖吗',
    ],
    templates: [
      ('犀利暴击', '交情归交情，钱归账户。为了咱们友谊长青，借钱免谈，请你喝杯奶茶倒是随时欢迎。'),
      ('优雅体面', '最近刚定投了不可撤回的理财和房贷自动扣款，流动资金实在捉襟见肘，深表歉意。'),
      ('幽默自嘲', '不瞒你说，我现在每天翻钱包，里面的余额都用可怜的眼神看着我呢。'),
      ('降维打击', '原则第一条：不向朋友借钱，也不借钱给朋友。规矩立在前面，大家都舒坦。'),
    ],
  ),
];

/// 万能金句：随机补充 1-2 条，保证每次刷新都有新鲜感
const List<String> _randomPunchlines = [
  '认知不同，不必强融；三观不在一个平流层，再聊就是对氧气的浪费。',
  '您有空操心我的生活，不如多给自己的发际线加点油。',
  '我活着是为了取悦自己，不是来参加你主持的人生辩论赛。',
  '你的建议很宝贵，但我建议你保留给更有需要的人，比如你自己。',
  '把你的优越感收一收，大清都亡了一百多年了，别乱发圣旨。',
  '我的脾气取决于你的态度，你若礼貌相待，我便是春风拂面；你若无理取闹，我便是冷血杀手。',
  '不尊重别人隐私的人，就像没有密码的公共WiFi，谁都能连，但没啥安全感。',
  '别拿你的尺子来量我的人生，尺寸不合，容易折断。',
];

const List<String> _toneOptions = [
  '全部语气', '犀利暴击', '优雅体面', '幽默自嘲', '降维打击'
];

class MouthpieceToolPage extends StatefulWidget {
  const MouthpieceToolPage({super.key});
  static const String pageTitle = '最强嘴替';

  @override
  State<MouthpieceToolPage> createState() => _MouthpieceToolPageState();
}

class _MouthpieceToolPageState extends State<MouthpieceToolPage> {
  String _selectedCategoryId = _categories[0].id;
  String _selectedTone = '全部语气';
  final TextEditingController _inputCtrl = TextEditingController();
  List<(String, String)> _generatedReplies = [];
  final Set<String> _favorites = <String>{};
  int _refreshCounter = 0;

  _MouthpieceCategory get _currentCategory =>
      _categories.firstWhere((c) => c.id == _selectedCategoryId);

  @override
  void initState() {
    super.initState();
    _generateRepliesForText('');
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  /// 生成回怼文案：每次生成/刷新都带随机性，同一输入刷新也产出全新文案
  void _generateRepliesForText(String input) {
    final rnd = Random(
        DateTime.now().millisecondsSinceEpoch +
            input.hashCode * 31 +
            _refreshCounter * 7);
    final filtered = _currentCategory.templates.where((t) {
      return _selectedTone == '全部语气' || _selectedTone == t.$1;
    }).toList()
      ..shuffle(rnd);
    final list = <(String, String)>[];
    for (final (tone, reply) in filtered) {
      final enhanced =
          input.isNotEmpty ? '“$input”？—— $reply' : reply;
      list.add((tone, enhanced));
    }
    // 随机补充 1-2 条万能金句
    if (rnd.nextBool()) {
      final extras =
          List<String>.from(_randomPunchlines)..shuffle(rnd);
      final count = rnd.nextBool() ? 2 : 1;
      for (var i = 0; i < count; i++) {
        final tone = switch (rnd.nextInt(3)) {
          0 => '犀利暴击',
          1 => '幽默自嘲',
          _ => '优雅体面',
        };
        final punch = extras[i];
        list.add((
          tone,
          input.isNotEmpty ? '“$input”？—— $punch' : punch
        ));
      }
    }
    if (list.isEmpty) {
      list.addAll(_currentCategory.templates);
    }
    setState(() => _generatedReplies = list);
  }

  void _copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    showLzToast(context, '已复制回怼话术！');
  }

  Color _toneColor(String tone) {
    return switch (tone) {
      '犀利暴击' => const Color(0xFFE5484D),
      '优雅体面' => const Color(0xFF007A87),
      '幽默自嘲' => const Color(0xFFF76B15),
      _ => const Color(0xFF8E4EC6),
    };
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: MouthpieceToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            // 1. Hero 卡
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🗣 最强嘴替 · 神级回怼生成器',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: pal.foreground)),
                    const SizedBox(height: 4),
                    Text('专治杠精、职场推锅、亲戚催婚 · 优雅不带脏字',
                        style: TextStyle(
                            fontSize: 11.5, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 2. 场景类别选择
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((category) {
                  final sel = category.id == _selectedCategoryId;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryId = category.id;
                          _inputCtrl.clear();
                        });
                        _generateRepliesForText('');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                            color:
                                sel ? pal.accent : pal.subtleFill,
                            borderRadius:
                                BorderRadius.circular(10)),
                        child: Text(
                            '${category.icon} ${category.name}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: sel
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: sel
                                    ? Colors.white
                                    : pal.foreground)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            // 3. 常见挑衅金句速选
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('💡 常见挑衅/送命题快速点击：',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: pal.foreground)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: _currentCategory.triggers.map((trigger) {
                        return GestureDetector(
                          onTap: () {
                            _inputCtrl.text = trigger;
                            _generateRepliesForText(trigger);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                                color: pal.subtleFill,
                                borderRadius:
                                    BorderRadius.circular(8)),
                            child: Text(trigger,
                                style: TextStyle(
                                    fontSize: 11.5,
                                    color: pal.foreground)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 4. 自定义挑衅输入框
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CupertinoTextField(
                  controller: _inputCtrl,
                  placeholder: '输入对方说的刻薄/杠精/催婚话，一键生成绝杀回怼…',
                  placeholderStyle: TextStyle(
                      color: pal.secondary, fontSize: 12),
                  style:
                      TextStyle(color: pal.foreground, fontSize: 13),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration:
                      const BoxDecoration(color: Colors.transparent),
                  onChanged: _generateRepliesForText,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 5. 语气选择器
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _toneOptions.map((tone) {
                  final sel = _selectedTone == tone;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _selectedTone = tone);
                        _generateRepliesForText(_inputCtrl.text);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: sel
                                ? pal.accentSoft
                                : Colors.transparent,
                            borderRadius:
                                BorderRadius.circular(8),
                            border: Border.all(
                                color: sel
                                    ? pal.accent
                                    : Colors.transparent)),
                        child: Text(tone,
                            style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: sel
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: sel
                                    ? pal.accent
                                    : pal.secondary)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            // 5.5 随机刷新按钮
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 10),
                color: pal.accent,
                borderRadius: BorderRadius.circular(12),
                onPressed: () {
                  _refreshCounter++;
                  _generateRepliesForText(_inputCtrl.text);
                },
                child: const Text(
                    '🎲 刷新文案（输入任意内容，点击即可生成全新回怼）',
                    style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12),
            // 6. 生成结果卡片列表
            ..._generatedReplies.map((entry) {
              final (tone, text) = entry;
              final isFav = _favorites.contains(text);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GlassPanel(
                  isDark: isDark,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2),
                              decoration: BoxDecoration(
                                  color: _toneColor(tone)
                                      .withOpacity(0.12),
                                  borderRadius:
                                      BorderRadius.circular(
                                          6)),
                              child: Text(tone,
                                  style: TextStyle(
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.bold,
                                      color: _toneColor(tone))),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => setState(() {
                                if (isFav) {
                                  _favorites.remove(text);
                                } else {
                                  _favorites.add(text);
                                }
                              }),
                              child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 20,
                                  color: isFav
                                      ? const Color(0xFFE5484D)
                                      : pal.secondary),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () => _copyText(text),
                              child: Icon(Icons.content_copy,
                                  size: 18,
                                  color: pal.accent),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(text,
                            style: TextStyle(
                                fontSize: 13.5,
                                height: 1.4,
                                fontWeight: FontWeight.w500,
                                color: pal.foreground)),
                      ],
                    ),
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
