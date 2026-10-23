import 'package:flutter/cupertino.dart';
// material 是**选择性**转出 foundation 的,defaultTargetPlatform 不在里面,得自己引。
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/motion.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/ui/popup.dart';
import 'package:jicun/update_service.dart';

/// 「关于本APP」二级页,从 lib/pages/settings.dart 拆出来。
///
/// 连同它用的开源仓库地址 [kRepoUrl] 一起搬 —— 那个常量只有这一页用。

/// 「关于本APP」上的开源仓库地址。
///
/// 要和 update_service.dart 里的 [kRepoOwner] / [kRepoName] 对得上 —— 那边是
/// 检查更新实际去打的仓库,这里写错就是让人去一个不存在的地方看源码。
const String kRepoUrl = 'https://github.com/shuting52/shuiyingongju';

/// 「设置 → 关于本APP」的二级页。四张一行卡。
class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;

    return SubPage(
      title: '关于本APP',
      child: GoogleSurface(
        brightness: isDark ? Brightness.dark : Brightness.light,
        child: SafeArea(
          child: ListView(
            physics: const ShortBounceScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            children: [
              AboutInfoCard(
                title: '开源地址',
                value: kRepoUrl,
                // 点了就复制,不提示怎么点 —— URL 在卡片上选不中,只能这么给
                onTap: () async {
                  await Clipboard.setData(
                    const ClipboardData(text: kRepoUrl),
                  );
                  if (!context.mounted) return;
                  showInfo(context, '已复制', '开源地址已复制到剪贴板。');
                },
              ),
              const SizedBox(height: 12),
              const AboutInfoCard(title: '制作人', value: '春日大阪'),
              const SizedBox(height: 12),
              const AboutInfoCard(title: '彩蛋出席', value: '奶龙,不知名小人物,不知名大人物'),
              const SizedBox(height: 12),
              const AboutInfoCard(
                title: '免责声明',
                value:
                    '本项目仅供学习与技术交流使用，请勿用于商业用途。'
                    '解析与下载的内容版权归原作者所有，请自行确认拥有相应权利后再保存或传播，'
                    '因使用本工具产生的一切后果由使用者自行承担。',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 关于页的一张卡:只有一行「标题:内容」,和文案长得一样。
///
/// 刻意做成一行:这四张卡就是四句话,不是四块版面。分两行摆(标题一行、值一行)
/// 会把卡片撑到两倍高,四张摞起来像四个板块。
///
/// [onTap] 非空时整行可点(开源地址那张用它复制)。**不给"点击即可复制"这类提示**:
/// 是用户点名的。点了有回音就够了。
class AboutInfoCard extends StatelessWidget {
  const AboutInfoCard({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
  });

  final String title;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final (foreground: foreground, secondary: secondary) = settingsPalette(
      isDark,
    );
    // RichText 而不是 Text.rich:标题和内容一个色号、只差字重,拆成两段 Span
    // 排版上就是一行,长内容自然换行时也不用管缩进对不对齐。
    final line = Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title:',
            style: TextStyle(fontWeight: FontWeight.w600, color: foreground),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: secondary),
          ),
        ],
      ),
      style: const TextStyle(fontSize: 14.5, height: 1.35),
    );

    return GlassPanel(
      isDark: isDark,
      child: onTap == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: line,
            )
          : PlainTap(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                child: line,
              ),
            ),
    );
  }
}
