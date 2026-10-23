/// 软件库:移植自 10-05landezhaole(懒得找了) 软件库.
/// 原 App 的软件库以云端同步为主,这里收录内置的精选条目。
class LzSoftware {
  final String id;
  final String title;
  final String desc;
  final String url;
  final String author;
  final String badge;
  final String tags;

  const LzSoftware({
    required this.id,
    required this.title,
    required this.desc,
    required this.url,
    required this.author,
    required this.badge,
    required this.tags,
  });
}

const List<LzSoftware> kLzSoftware = [
  LzSoftware(
    id: 'init-sw-1',
    title: 'Geek Uninstaller',
    desc: '极简高效的Windows彻底卸载清理神器,免安装单文件,强制剔除注册表残留。',
    url: 'https://geekuninstaller.com/',
    author: 'Thomas',
    badge: '站长自用',
    tags: 'Windows / 清理',
  ),
  LzSoftware(
    id: 'init-sw-2',
    title: 'PotPlayer 64bit 绿色优化版',
    desc: '全球极佳的高清影音播放器,内置无缝解码器,支持4K HDR与杜比视界蓝光直出。',
    url: 'https://potplayer.daum.net/',
    author: 'Daum',
    badge: '装机必备',
    tags: '影音播放 / 4K',
  ),
  LzSoftware(
    id: 'init-sw-3',
    title: 'Everything 极速搜盘',
    desc: '1秒内秒搜百万本地文件的搜索神器,毫秒级响应,几乎零内存占用。',
    url: 'https://www.voidtools.com/',
    author: 'Voidtools',
    badge: '神器',
    tags: '生产力 / 搜索',
  ),
];
