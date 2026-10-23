import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

import 'sites_page.dart';
import 'tools_page.dart';
import 'software_page.dart';
import 'sites_data.dart';
import 'tools_data.dart';

/// 「发现」tab:聚合 10-05landezhaole(懒得找了) 的站点 / 工具 / 软件.
/// - 站点:17 分类 1100+ 导航站点
/// - 工具:21 个离线小工具
/// - 软件:精选软件库
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _seg = 0;

  static const _segs = ['站点', '工具', '软件'];

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final siteCount =
        kLzCategories.fold<int>(0, (a, c) => a + c.sites.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, kBoardHeaderTop, 20, 0),
          child: BoardHeader(
            title: '发现',
            trailing: Text(
              '$siteCount 站点 · ${kLzTools.length} 工具',
              style: TextStyle(color: pal.secondary, fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CupertinoSlidingSegmentedControl<int>(
            groupValue: _seg,
            backgroundColor: pal.foreground.withValues(alpha: 0.08),
            thumbColor: isDark
                ? const Color(0xFF3A3A3C)
                : CupertinoColors.white,
            onValueChanged: (v) {
              if (v != null) setState(() => _seg = v);
            },
            children: {
              for (int i = 0; i < _segs.length; i++)
                i: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    _segs[i],
                    style: TextStyle(
                      color: _seg == i ? pal.foreground : pal.secondary,
                      fontSize: 14,
                      fontWeight: _seg == i
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: IndexedStack(
            index: _seg,
            children: const [
              SitesView(),
              ToolsView(),
              SoftwareView(),
            ],
          ),
        ),
      ],
    );
  }
}
