import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/lzdz/toast.dart';
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

class _PromptItem {
  const _PromptItem({required this.key, required this.desc});

  final String key;
  final String desc;

  factory _PromptItem.fromJson(Map<String, dynamic> j) => _PromptItem(
        key: (j['key'] as String?) ?? '',
        desc: (j['desc'] as String?) ?? '',
      );
}

class _PromptCategory {
  const _PromptCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.prompts,
  });

  final String id;
  final String name;
  final String icon;
  final List<_PromptItem> prompts;

  factory _PromptCategory.fromJson(Map<String, dynamic> j) {
    final prompts = ((j['prompts'] as List?) ?? [])
        .map((e) => _PromptItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return _PromptCategory(
      id: (j['id'] as String?) ?? '',
      name: (j['name'] as String?) ?? '',
      icon: (j['icon'] as String?) ?? '',
      prompts: prompts,
    );
  }
}

/// 读取 assets/lzdz/image_prompts.json（{meta, categories: [{id, name, icon, prompts: [{key, desc}]}]}）
Future<List<_PromptCategory>> _loadPromptCategories() async {
  try {
    final raw =
        await rootBundle.loadString('assets/lzdz/image_prompts.json');
    final root = json.decode(raw) as Map<String, dynamic>;
    final arr = (root['categories'] as List?) ?? [];
    return arr
        .map((e) => _PromptCategory.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (_) {
    return [];
  }
}

class ImagePromptsToolPage extends StatefulWidget {
  const ImagePromptsToolPage({super.key});
  static const String pageTitle = '做图指令大全';

  @override
  State<ImagePromptsToolPage> createState() => _ImagePromptsToolPageState();
}

class _ImagePromptsToolPageState extends State<ImagePromptsToolPage> {
  List<_PromptCategory> _categories = [];
  bool _loaded = false;
  String _query = '';
  String? _openedCategoryId;
  (_PromptCategory, _PromptItem)? _randomPick;

  @override
  void initState() {
    super.initState();
    _loadPromptCategories().then((cats) {
      if (!mounted) return;
      setState(() {
        _categories = cats;
        _loaded = true;
      });
    });
  }

  _PromptCategory? get _openedCategory {
    if (_openedCategoryId == null) return null;
    for (final c in _categories) {
      if (c.id == _openedCategoryId) return c;
    }
    return null;
  }

  int get _totalPrompts =>
      _categories.fold(0, (sum, c) => sum + c.prompts.length);

  /// 全库搜索（分类名/key/中文说明）
  List<(_PromptCategory, _PromptItem)> get _searchResults {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return [];
    final out = <(_PromptCategory, _PromptItem)>[];
    for (final c in _categories) {
      final hitCat = c.name.toLowerCase().contains(q);
      for (final p in c.prompts) {
        if (hitCat ||
            p.key.toLowerCase().contains(q) ||
            p.desc.toLowerCase().contains(q)) {
          out.add((c, p));
        }
      }
    }
    return out;
  }

  void _copyText(String text, String toast) {
    Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    showLzToast(context, toast);
  }

  void _copyKey(_PromptItem item) => _copyText(item.key, '已复制');
  void _copyFull(_PromptItem item) =>
      _copyText('${item.key}\n${item.desc}', '已复制');

  void _pickRandom() {
    final all = <(_PromptCategory, _PromptItem)>[];
    for (final c in _categories) {
      for (final p in c.prompts) {
        all.add((c, p));
      }
    }
    if (all.isEmpty) return;
    setState(
        () => _randomPick = all[Random().nextInt(all.length)]);
    _showRandomDialog();
  }

  void _showRandomDialog() {
    final pick = _randomPick;
    if (pick == null) return;
    final isDark =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final (cat, item) = pick;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor:
            isDark ? const Color(0xFF2A2A2C) : Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.auto_awesome, size: 18, color: pal.accent),
            const SizedBox(width: 6),
            Text('🎲 灵感来了',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: pal.foreground)),
            const Spacer(),
            Text(cat.name,
                style: TextStyle(fontSize: 11, color: pal.secondary)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.key,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: pal.accent)),
            const SizedBox(height: 6),
            Text(item.desc,
                style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: pal.secondary)),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                _copyKey(item);
                Navigator.of(ctx).pop();
              },
              child: const Text('复制 key')),
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                _pickRandom();
              },
              child: const Text('换一条')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final opened = _openedCategory;
    final searching = _query.trim().isNotEmpty;
    final searchResults = _searchResults;

    Widget body;
    if (!_loaded) {
      body = const Padding(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Center(child: CupertinoActivityIndicator(radius: 14)),
      );
    } else if (searching) {
      // ===== 搜索结果（扁平，带分类标签） =====
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('全库命中 ${searchResults.length} 条',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: pal.secondary)),
          const SizedBox(height: 8),
          if (searchResults.isEmpty)
            _EmptyHint(text: '没有匹配的指令，换个关键词试试', pal: pal)
          else
            ...searchResults.map((e) =>
                _PromptRow(cat: e.$1, item: e.$2, pal: pal, isDark: isDark,
                    onCopyKey: () => _copyKey(e.$2),
                    onCopyFull: () => _copyFull(e.$2))),
        ],
      );
    } else if (opened != null) {
      // ===== 分类内指令列表（二级） =====
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _openedCategoryId = null),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,
                    size: 16, color: pal.accent),
                Text('全部分类',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: pal.accent)),
                Text('  /  ${opened.name}（${opened.prompts.length} 条）',
                    style: TextStyle(
                        fontSize: 13, color: pal.secondary)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ...opened.prompts.map((item) => _PromptRow(
              cat: null,
              item: item,
              pal: pal,
              isDark: isDark,
              onCopyKey: () => _copyKey(item),
              onCopyFull: () => _copyFull(item))),
        ],
      );
    } else {
      // ===== 分类宫格（一级） =====
      body = _categories.isEmpty
          ? _EmptyHint(text: '指令库加载失败，请重启 App 试试', pal: pal)
          : GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.7,
              children: _categories
                  .map((cat) => _CategoryCard(
                      cat: cat,
                      pal: pal,
                      isDark: isDark,
                      onTap: () =>
                          setState(() => _openedCategoryId = cat.id)))
                  .toList(),
            );
    }

    return SubPage(
      title: ImagePromptsToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            // ===== 标题区 =====
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
                          child: Text('🎨 做图指令大全',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: pal.foreground)),
                        ),
                        GestureDetector(
                          onTap: _pickRandom,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                color: pal.accent,
                                borderRadius:
                                    BorderRadius.circular(20)),
                            child: const Row(
                              children: [
                                Icon(Icons.casino,
                                    size: 14, color: Colors.white),
                                SizedBox(width: 4),
                                Text('随机一条',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                        '${_categories.length} 分类 · $_totalPrompts 条指令 · 点卡片复制 key，右侧按钮复制全文',
                        style: TextStyle(
                            fontSize: 12, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // ===== 搜索框 =====
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CupertinoTextField(
                  placeholder: '全库搜索，如：黏土 / 霓虹 / 宠物 / 婚礼',
                  placeholderStyle: TextStyle(
                      color: pal.secondary, fontSize: 13),
                  style:
                      TextStyle(color: pal.foreground, fontSize: 13),
                  prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(CupertinoIcons.search,
                          size: 16, color: Colors.grey)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 8),
                  decoration:
                      const BoxDecoration(color: Colors.transparent),
                  onChanged: (v) => setState(() {
                    _query = v;
                    _openedCategoryId = null;
                  }),
                ),
              ),
            ),
            const SizedBox(height: 12),
            body,
          ],
        ),
      ),
    );
  }
}

/// 分类宫格卡片
class _CategoryCard extends StatelessWidget {
  const _CategoryCard(
      {required this.cat,
      required this.pal,
      required this.isDark,
      required this.onTap});

  final _PromptCategory cat;
  final Palette pal;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      isDark: isDark,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                    color: pal.accent,
                    borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(height: 8),
              Text(cat.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: pal.foreground)),
              const SizedBox(height: 4),
              Text('${cat.prompts.length} 条指令 →',
                  style:
                      TextStyle(fontSize: 11.5, color: pal.secondary)),
            ],
          ),
        ),
      ),
    );
  }
}

/// 单条指令行：key + 中文说明 + 复制按钮（整行可点复制 key）
class _PromptRow extends StatelessWidget {
  const _PromptRow(
      {required this.cat,
      required this.item,
      required this.pal,
      required this.isDark,
      required this.onCopyKey,
      required this.onCopyFull});

  final _PromptCategory? cat;
  final _PromptItem item;
  final Palette pal;
  final bool isDark;
  final VoidCallback onCopyKey;
  final VoidCallback onCopyFull;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassPanel(
        isDark: isDark,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onCopyKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (cat != null)
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 2),
                          child: Text(cat!.name,
                              style: TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.bold,
                                  color: pal.secondary)),
                        ),
                      Text(item.key,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: pal.accent)),
                      const SizedBox(height: 2),
                      Text(item.desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12.5,
                              height: 1.35,
                              color: pal.secondary)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    GestureDetector(
                      onTap: onCopyKey,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: pal.accent,
                            borderRadius:
                                BorderRadius.circular(10)),
                        child: const Icon(Icons.content_copy,
                            size: 17, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: onCopyFull,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: pal.accent
                                    .withOpacity(0.4)),
                            borderRadius:
                                BorderRadius.circular(8)),
                        child: Text('全文',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: pal.accent)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyHint extends StatelessWidget {
  const _EmptyHint({required this.text, required this.pal});

  final String text;
  final Palette pal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
          child: Text(text,
              style: TextStyle(fontSize: 13, color: pal.secondary))),
    );
  }
}
