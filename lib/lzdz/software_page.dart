import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:url_launcher/url_launcher.dart';

import 'software_data.dart';
import 'package:jicun/lzdz/toast.dart';

/// 软件库:移植自 10-05landezhaole(懒得找了) 软件库.
/// 精选软件条目,点卡片跳转官网。
class SoftwareView extends StatefulWidget {
  const SoftwareView({super.key});

  @override
  State<SoftwareView> createState() => _SoftwareViewState();
}

class _SoftwareViewState extends State<SoftwareView> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      showLzToast(context, '打不开这个链接:$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final q = _query.trim().toLowerCase();
    final list = q.isEmpty
        ? kLzSoftware
        : kLzSoftware
            .where((s) =>
                s.title.toLowerCase().contains(q) ||
                s.desc.toLowerCase().contains(q))
            .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
          child: GlassPanel(
            isDark: isDark,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: CupertinoTextField(
                controller: _searchCtrl,
                placeholder: '搜索软件…',
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
        Expanded(
          child: list.isEmpty
              ? Center(
                  child: Text(
                    '没找到相关软件',
                    style: TextStyle(color: pal.secondary, fontSize: 13),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 120),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final s = list[i];
                    return GestureDetector(
                      onTap: () => _open(context, s.url),
                      child: GlassPanel(
                        isDark: isDark,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: pal.foreground
                                      .withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.apps,
                                    color: pal.foreground, size: 24),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            s.title,
                                            style: TextStyle(
                                              color: pal.foreground,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (s.badge.isNotEmpty) ...[
                                          const SizedBox(width: 6),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: pal.foreground
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              s.badge,
                                              style: TextStyle(
                                                  color: pal.secondary,
                                                  fontSize: 11),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        s.desc,
                                        style: TextStyle(
                                            color: pal.secondary, fontSize: 12),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        '${s.author} · ${s.tags}',
                                        style: TextStyle(
                                            color: pal.secondary
                                                .withValues(alpha: 0.7),
                                            fontSize: 11),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.open_in_new,
                                  color: pal.secondary, size: 18),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
