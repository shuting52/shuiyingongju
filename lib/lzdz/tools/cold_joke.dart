import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

const List<String> kColdJokes = <String>[
  '为什么手机听歌要戴耳机？因为不戴耳机，手机以为自己在KTV。',
  '去面试，面试官问我有什么特长，我说我腿特长。',
  '为什么鱼从不说话？因为一开口就要被煲汤。',
  '你知道为什么秋天要喝奶茶吗？因为‘秋天第一杯奶茶’听起来比‘夏天第八杯奶茶’洋气。',
  '小明考试作弊被抓，老师问他为什么抄答案，他说：我只是在复习。',
  '为什么程序员分不清万圣节和圣诞节？因为 OCT 31 = DEC 25。',
  '有一次我摔倒了，爬起来拍拍身上的灰说：灰太狼都没我灰。',
  '为什么猫不玩捉迷藏？因为它一躲起来就真的找不到。',
  '去银行存钱，柜员问我：你确定是来存钱的吗？我说：你猜。',
  '为什么冬天的手机特别冷？因为它被冻得直哆嗦。',
  '我买了个会走路的闹钟，它每天自己走丢了。',
  '为什么数学书总是很忧郁？因为里面全是问题。',
  '熬夜对身体不好，所以我建议通宵。',
  '为什么蚊子不咬我？因为我已经被气饱了。',
  '熊猫的愿望是什么？拍一张彩色的照片。',
  '为什么乌鸦像写字台？因为我也不知道，但童话里都这么问。',
  '吃火锅的时候，毛肚和鸭肠谁更内卷？毛肚：我七上八下。',
  '为什么程序员的电脑总是很冷？因为里面有太多 CPU 风扇。',
  '医生对我说：你这病要戒酒、戒辣、戒熬夜。我问：那能戒饭吗？医生说：你想饿死我？',
  '为什么企鹅走路一摇一摆？因为它怕踩到自己的脚。',
  '我爸问我为什么不好好学习，我说：怕以后太优秀，配不上这世界。',
  '为什么说猪是吉祥物？因为‘猪’事顺利。',
  '我问冰箱有没有西瓜，冰箱说：你先把门关上。',
  '为什么汤圆那么圆？因为汤圆也想做‘圆’满的人。',
  '手机掉进水里怎么办？赶紧捞起来，不然水会进电。',
  '为什么月亮那么圆？因为它在努力‘圆’梦。',
  '坐公交车，售票员问我去哪，我说：去没烦恼的地方，他说：那你下车吧，前面就是。',
  '为什么说奶茶是快乐水？因为喝完快乐就‘吸’回来了。',
  '老师问：0.5 乘以 0.5 等于多少？小明：一半的一半。',
  '为什么仙人掌不交朋友？因为它扎手。',
  '我家的 WiFi 密码是我生日，结果邻居天天来蹭网祝我生日快乐。',
  '为什么奥特曼每次打完怪兽都要回光之国？因为家里没网，只能回光之国蹭WiFi。',
  '为什么方便面总是一包一包卖？因为它很‘方便’。',
  '去动物园，长颈鹿问我脖子累不累，我说：你试试抬头看我。',
  '为什么扫地机器人不开演唱会？因为它只会扫地，不会‘扫’音。',
  '老板问我要不要加班，我说：加，加到世界和平。',
  '为什么闹钟叫不醒我？因为它不懂我‘梦想’的重量。',
  '感冒了，我打喷嚏，老婆说：有人在想你。我说：那为什么我鼻子都打红了？',
  '为什么考试前要拜孔子？因为拜了孔子，及格‘孔’易。',
  '我养了一只乌龟，它说我走得快，我很感动。',
  '为什么西瓜怕热？因为它‘瓜’了。',
  '今天吃泡面，想加个蛋，翻遍冰箱没有，于是对着泡面说了句：蛋蛋的忧伤。',
];

/// 冷笑话：内置笑话库随机一条 + 复制/分享
///
/// 移植自懒得找了 ColdJokeSection.kt（全部 42 条笑话库完整保留）。
/// 注：源码用系统分享面板（ACTION_SEND）；本移植不引入 share_plus，
/// 「分享出去」改为复制文本到剪贴板并提示去粘贴分享。
class ColdJokeToolPage extends StatefulWidget {
  const ColdJokeToolPage({super.key});
  static const String pageTitle = '冷笑话';

  @override
  State<ColdJokeToolPage> createState() => _ColdJokeToolPageState();
}

class _ColdJokeToolPageState extends State<ColdJokeToolPage> {
  final Random _rnd = Random();
  late String _joke;

  @override
  void initState() {
    super.initState();
    _joke = kColdJokes[_rnd.nextInt(kColdJokes.length)];
  }

  void _nextJoke() {
    setState(() => _joke = kColdJokes[_rnd.nextInt(kColdJokes.length)]);
  }

  Future<void> _shareJoke() async {
    await Clipboard.setData(ClipboardData(text: '【冷笑话】$_joke\n—— 来自「懒得找了」App'));
    if (!mounted) return;
    final overlay = Overlay.of(context);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 90,
        left: 40,
        right: 40,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(10)),
            child: const Text('已复制笑话，去微信/QQ/抖音/微博粘贴分享吧～',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 13)),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (entry.mounted) entry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: ColdJokeToolPage.pageTitle,
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
                    const Text('😂 冷笑话',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: Color(0xFFE8730A))),
                    const SizedBox(height: 2),
                    Text('随机一条冷笑话 · 一键分享到聊天/短视频平台',
                        style: TextStyle(fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            // 笑话卡片
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
                child: Column(
                  children: [
                    const Text('❄️', style: TextStyle(fontSize: 26)),
                    const SizedBox(height: 10),
                    Text(
                      _joke,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1.6, color: pal.foreground),
                    ),
                  ],
                ),
              ),
            ),
            // 随机 & 分享
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _nextJoke,
                    icon: const Icon(Icons.refresh),
                    label: const Text('再来一条', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8730A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _shareJoke,
                    icon: const Icon(Icons.share),
                    label: const Text('分享出去', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: pal.secondary.withValues(alpha: 0.4)),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '分享面板会自动列出微信/QQ/抖音/微博等聊天与短视频平台，选一个就能发～（当前为复制文本方式分享）',
              style: TextStyle(fontSize: 11, color: pal.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

