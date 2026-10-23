import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sites_data.dart';
import 'package:jicun/lzdz/toast.dart';

/// 站点导航:移植自 10-05landezhaole(懒得找了) 首页.
/// 17 个分类 / 1100+ 站点,支持分类 + 子分类 + 关键词搜索,点卡片用系统浏览器打开。
class SitesView extends StatefulWidget {
  const SitesView({super.key});

  @override
  State<SitesView> createState() => _SitesViewState();
}

class _SitesViewState extends State<SitesView> {
  int _catIndex = 0;
  String _subId = 'all';
  String _query = '';
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _openSite(BuildContext context, LzSite site) async {
    final uri = Uri.tryParse(site.url);
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      showLzToast(context, '打不开这个链接:${site.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final cat = kLzCategories[_catIndex];

    List<LzSite> sites = cat.sites;
    if (_subId != 'all') {
      sites = sites.where((s) => s.sub == _subId).toList();
    }
    final q = _query.trim();
    if (q.isNotEmpty) {
      // 搜索时跨全部分类找,方便一下定位
      final all = kLzCategories.expand((c) => c.sites);
      sites = all
          .where((s) =>
              s.title.contains(q) ||
              s.desc.contains(q) ||
              s.url.contains(q) ||
              s.hl.contains(q))
          .toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 搜索框
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: GlassPanel(
            isDark: isDark,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: CupertinoTextField(
                controller: _searchCtrl,
                placeholder: '搜索 ${kLzCategories.fold<int>(0, (a, c) => a + c.sites.length)} 个站点…',
                placeholderStyle:
                    TextStyle(color: pal.secondary, fontSize: 14),
                prefix: Icon(Icons.search, color: pal.secondary, size: 20),
                suffix: _query.isEmpty
                    ? null
                    : GestureDetector(
                        onTap: () {
                          _searchCtrl.clear();
                          setState(() => _query = '');
                        },
                        child: Icon(Icons.clear,
                            color: pal.secondary, size: 18),
                      ),
                decoration: const BoxDecoration(),
                style: TextStyle(color: pal.foreground, fontSize: 14),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
          ),
        ),
        // 分类横滑
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: kLzCategories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final c = kLzCategories[i];
              final selected = i == _catIndex && q.isEmpty;
              return ChoiceChip(
                label: Text('${c.name} ${c.sites.length}'),
                selected: selected,
                onSelected: (_) {
                  setState(() {
                    _catIndex = i;
                    _subId = 'all';
                    _query = '';
                    _searchCtrl.clear();
                  });
                },
                selectedColor: pal.foreground.withValues(alpha: 0.16),
                backgroundColor: pal.foreground.withValues(alpha: 0.06),
                labelStyle: TextStyle(
                  color: selected ? pal.foreground : pal.secondary,
                  fontSize: 13,
                ),
                side: BorderSide.none,
                shape: const StadiumBorder(),
              );
            },
          ),
        ),
        // 子分类
        if (q.isEmpty && cat.subs.length > 1)
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
              itemCount: cat.subs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final s = cat.subs[i];
                final selected = s.id == _subId;
                return GestureDetector(
                  onTap: () => setState(() => _subId = s.id),
                  child: Text(
                    s.name,
                    style: TextStyle(
                      color: selected ? pal.foreground : pal.secondary,
                      fontSize: 13,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 8),
        // 站点列表
        Expanded(
          child: sites.isEmpty
              ? Center(
                  child: Text('没有找到相关站点',
                      style: TextStyle(color: pal.secondary, fontSize: 14)),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                  itemCount: sites.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final s = sites[i];
                    return _SiteCard(
                      site: s,
                      isDark: isDark,
                      onTap: () => _openSite(context, s),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

/// 站点图标:实时从网络加载 favicon,失败回退到首字占位。
class _SiteIcon extends StatelessWidget {
  const _SiteIcon({required this.site, required this.isDark});
  final LzSite site;
  final bool isDark;

  String? get _faviconUrl {
    if (site.icon.isNotEmpty) return site.icon;
    final uri = Uri.tryParse(site.url);
    if (uri == null || uri.host.isEmpty) return null;
    return 'https://' + uri.host + '/favicon.ico';
  }

  @override
  Widget build(BuildContext context) {
    final pal = Palette.of(isDark);
    final letter = site.fallback.isNotEmpty
        ? site.fallback.substring(0, 1)
        : (site.title.isNotEmpty ? site.title.substring(0, 1) : '站');
    final placeholder = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: pal.foreground.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(letter,
          style: TextStyle(
              color: pal.foreground,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
    );
    final url = _faviconUrl;
    if (url == null) return placeholder;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => placeholder,
      ),
    );
  }
}

class _SiteCard extends StatelessWidget {
  const _SiteCard({
    required this.site,
    required this.isDark,
    required this.onTap,
  });

  final LzSite site;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pal = Palette.of(isDark);
    return GestureDetector(
      onTap: onTap,
      child: GlassPanel(
        isDark: isDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              _SiteIcon(site: site, isDark: isDark),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            site.title,
                            style: TextStyle(
                              color: pal.foreground,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (site.badge.isNotEmpty) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: pal.foreground.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              site.badge,
                              style: TextStyle(
                                color: pal.secondary,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (site.desc.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          site.desc,
                          style: TextStyle(
                            color: pal.secondary,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),
              Icon(Icons.open_in_new, color: pal.secondary, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
