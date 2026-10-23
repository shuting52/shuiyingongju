import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:jicun/lzdz/toast.dart';
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

/// 音乐播放器（在线搜索试听 + 播放列表 + 播放控制）
/// 移植自 10-05landezhaole 的 MusicPlayerSection.kt + MusicPlayerState.kt
/// 音频来源：iTunes Search API（30 秒试听预览，无需登录）
/// 本地扫描/手动添加为 Android 平台能力（MediaStore/文件选择），Flutter 端无对应允许的依赖，已删减
class MusicPlayerToolPage extends StatefulWidget {
  const MusicPlayerToolPage({super.key});
  static const String pageTitle = '音乐播放器';

  @override
  State<MusicPlayerToolPage> createState() => _MusicPlayerToolPageState();
}

class Track {
  final String title;
  final String artist;
  final String uri;
  const Track({required this.title, required this.artist, required this.uri});
}

enum PlayMode { sequential, shuffle, repeatOne }

String _modeLabel(PlayMode m) => switch (m) {
      PlayMode.shuffle => '随机播放',
      PlayMode.repeatOne => '单曲循环',
      PlayMode.sequential => '顺序播放',
    };

class _MusicPlayerToolPageState extends State<MusicPlayerToolPage> {
  AudioPlayer? _player;
  final List<Track> _playlist = [];
  int _currentIndex = -1;
  PlayMode _playMode = PlayMode.sequential;
  bool _isPlaying = false;
  bool _isLoading = false;
  String _errorMsg = '';

  String _query = '';
  List<Track> _results = [];
  bool _searching = false;

  StreamSubscription<PlayerState>? _stateSub;
  StreamSubscription<Duration?>? _durationSub;
  StreamSubscription<Duration>? _positionSub;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  Track? get _current =>
      (_currentIndex >= 0 && _currentIndex < _playlist.length)
          ? _playlist[_currentIndex]
          : null;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _stateSub = _player!.playerStateStream.listen((st) {
      if (!mounted) return;
      setState(() {
        _isPlaying = st.playing;
        if (st.processingState == ProcessingState.completed) {
          _onCompleted();
        } else if (st.processingState == ProcessingState.ready) {
          _isLoading = false;
        }
      });
    });
    _durationSub = _player!.durationStream.listen((d) {
      if (mounted) setState(() => _duration = d ?? Duration.zero);
    });
    _positionSub = _player!.positionStream.listen((p) {
      if (mounted) setState(() => _position = p);
    });
  }

  @override
  void dispose() {
    _stateSub?.cancel();
    _durationSub?.cancel();
    _positionSub?.cancel();
    _player?.dispose();
    _player = null;
    super.dispose();
  }

  // ---------- 播放控制 ----------

  Future<void> _playAt(int index) async {
    if (index < 0 || index >= _playlist.length) return;
    final p = _player;
    if (p == null) return;
    setState(() {
      _isLoading = true;
      _errorMsg = '';
      _duration = Duration.zero;
      _position = Duration.zero;
    });
    try {
      await p.setUrl(_playlist[index].uri);
      if (!mounted) return;
      setState(() => _currentIndex = index);
      await p.play();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMsg = '播放失败，试试下一首';
      });
      final next = index + 1;
      if (next < _playlist.length) {
        _playAt(next);
      }
    }
  }

  Future<void> _toggle() async {
    final p = _player;
    if (p == null) return;
    if (p.playing) {
      await p.pause();
    } else {
      if (_currentIndex < 0 && _playlist.isNotEmpty) {
        await _playAt(0);
      } else {
        try {
          await p.play();
        } catch (_) {
          setState(() => _errorMsg = '播放失败');
        }
      }
    }
  }

  void _onCompleted() {
    if (_playlist.isEmpty) return;
    switch (_playMode) {
      case PlayMode.repeatOne:
        _playAt(_currentIndex);
        break;
      case PlayMode.shuffle:
        if (_playlist.length > 1) {
          final rng = Random();
          var next = _currentIndex;
          while (next == _currentIndex) {
            next = rng.nextInt(_playlist.length);
          }
          _playAt(next);
        } else {
          _playAt(0);
        }
        break;
      case PlayMode.sequential:
        final next = _currentIndex + 1;
        if (next < _playlist.length) {
          _playAt(next);
        } else {
          setState(() => _isPlaying = false);
        }
        break;
    }
  }

  void _playNext() {
    if (_playlist.isEmpty) return;
    int next;
    if (_playMode == PlayMode.shuffle && _playlist.length > 1) {
      final rng = Random();
      next = _currentIndex;
      while (next == _currentIndex) {
        next = rng.nextInt(_playlist.length);
      }
    } else if (_currentIndex + 1 < _playlist.length) {
      next = _currentIndex + 1;
    } else {
      next = 0;
    }
    _playAt(next);
  }

  void _playPrev() {
    if (_playlist.isEmpty) return;
    final prev =
        _currentIndex - 1 >= 0 ? _currentIndex - 1 : _playlist.length - 1;
    _playAt(prev);
  }

  void _cycleMode() {
    setState(() {
      _playMode = switch (_playMode) {
        PlayMode.sequential => PlayMode.shuffle,
        PlayMode.shuffle => PlayMode.repeatOne,
        PlayMode.repeatOne => PlayMode.sequential,
      };
    });
  }

  void _addTrack(Track t) {
    if (_playlist.any((e) => e.uri == t.uri)) return;
    setState(() => _playlist.add(t));
  }

  void _playOrAdd(Track t) {
    final idx = _playlist.indexWhere((e) => e.uri == t.uri);
    if (idx >= 0) {
      _playAt(idx);
    } else {
      _addTrack(t);
      _playAt(_playlist.length - 1);
    }
  }

  Future<void> _clearAll() async {
    try {
      await _player?.stop();
    } catch (_) {}
    setState(() {
      _playlist.clear();
      _currentIndex = -1;
      _isPlaying = false;
      _isLoading = false;
      _errorMsg = '';
      _results = [];
    });
  }

  // ---------- 在线搜索（iTunes Search API） ----------

  Future<void> _searchOnline() async {
    final q = _query.trim();
    if (q.isEmpty) {
      showLzToast(context, '请先输入歌名或歌手');
      return;
    }
    setState(() {
      _searching = true;
      _errorMsg = '';
    });
    try {
      final url = Uri.parse(
          'https://itunes.apple.com/search?term=${Uri.encodeQueryComponent(q)}&media=music&entity=song&limit=20&country=CN');
      final resp = await http.get(url).timeout(const Duration(seconds: 15));
      final body = jsonDecode(resp.body) as Map<String, dynamic>?;
      final arr = (body?['results'] as List?) ?? [];
      final found = <Track>[];
      for (final e in arr) {
        if (e is! Map) continue;
        final preview = (e['previewUrl'] as String?) ?? '';
        if (preview.isEmpty) continue;
        found.add(Track(
          title: (e['trackName'] as String?) ?? '未知歌曲',
          artist: (e['artistName'] as String?) ?? '未知歌手',
          uri: preview,
        ));
      }
      if (!mounted) return;
      setState(() {
        _results = found.take(10).toList();
        _searching = false;
      });
      if (found.isEmpty && mounted) {
        showLzToast(context, '没搜到，换个关键词试试');
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _searching = false;
        _errorMsg = '搜索失败，请检查网络后重试';
      });
    }
  }

  // ---------- UI ----------

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final cur = _current;

    return SubPage(
      title: MusicPlayerToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.music_note,
                            color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Text('正在播放',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (cur != null) ...[
                      Text(cur.title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: pal.foreground),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(cur.artist,
                          style: TextStyle(
                              fontSize: 12, color: pal.secondary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 8),
                      if (_isLoading)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2),
                            ),
                            const SizedBox(width: 8),
                            Text('加载中…',
                                style: TextStyle(
                                    fontSize: 12, color: pal.secondary)),
                          ],
                        ),
                      if (_errorMsg.isNotEmpty)
                        Text(_errorMsg,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xFFE53935))),
                      _progressBar(pal),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: _cycleMode,
                            icon: Icon(
                              _playMode == PlayMode.shuffle
                                  ? Icons.shuffle
                                  : _playMode == PlayMode.repeatOne
                                      ? Icons.repeat_one
                                      : Icons.repeat,
                              color: pal.accent,
                              size: 26,
                            ),
                            tooltip: _modeLabel(_playMode),
                          ),
                          IconButton(
                            onPressed: _playPrev,
                            icon: Icon(Icons.skip_previous,
                                color: pal.accent, size: 36),
                            tooltip: '上一首',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: _toggle,
                            icon: Icon(
                              _isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_filled,
                              color: pal.accent,
                              size: 52,
                            ),
                            tooltip: '播放/暂停',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: _playNext,
                            icon: Icon(Icons.skip_next,
                                color: pal.accent, size: 36),
                            tooltip: '下一首',
                          ),
                        ],
                      ),
                      Text(_modeLabel(_playMode),
                          style: TextStyle(
                              fontSize: 11, color: pal.secondary)),
                    ] else
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text('还没有播放内容，先在下方搜索试听',
                            style: TextStyle(
                                fontSize: 13, color: pal.secondary)),
                      ),
                  ],
                ),
              ),
            ),
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('在线搜索试听',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: pal.foreground)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (v) => _query = v,
                            onSubmitted: (_) => _searchOnline(),
                            decoration: InputDecoration(
                              hintText: '歌名 / 歌手',
                              hintStyle:
                                  const TextStyle(fontSize: 13),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(12)),
                              contentPadding:
                                  const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _searching ? null : _searchOnline,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pal.accent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                          ),
                          child: _searching
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2))
                              : const Icon(Icons.search, size: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('搜索结果为 30 秒试听预览（iTunes 免费接口，无需登录）',
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                    if (_results.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      ..._results.map((t) => _trackRow(pal, t)),
                    ],
                  ],
                ),
              ),
            ),
            if (_playlist.isNotEmpty)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('播放列表（${_playlist.length}）',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: pal.foreground)),
                          const Spacer(),
                          TextButton(
                            onPressed: _clearAll,
                            child: Text('清空列表',
                                style: TextStyle(
                                    fontSize: 12, color: pal.accent)),
                          ),
                        ],
                      ),
                      ...List.generate(_playlist.length, (i) {
                        final t = _playlist[i];
                        final selected = i == _currentIndex;
                        return GestureDetector(
                          onTap: () => _playAt(i),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selected
                                  ? pal.accent.withAlpha(24)
                                  : Colors.transparent,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 9),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text('${i + 1}. ${t.title}',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: selected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: selected
                                              ? pal.accent
                                              : pal.foreground),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                if (selected && _isPlaying)
                                  Icon(Icons.music_note,
                                      color: pal.accent, size: 16),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _progressBar(Palette pal) {
    final total = _duration.inMilliseconds;
    final pos = _position.inMilliseconds.clamp(0, total > 0 ? total : 0);
    return Row(
      children: [
        Text(_fmtDur(_position),
            style: TextStyle(fontSize: 10, color: pal.secondary)),
        Expanded(
          child: Slider(
            value: total > 0 ? pos / total : 0.0,
            onChanged: total > 0
                ? (v) => _player?.seek(
                    Duration(milliseconds: (v * total).toInt()))
                : null,
            activeColor: pal.accent,
          ),
        ),
        Text(_fmtDur(_duration),
            style: TextStyle(fontSize: 10, color: pal.secondary)),
      ],
    );
  }

  String _fmtDur(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Widget _trackRow(Palette pal, Track t) {
    return GestureDetector(
      onTap: () => _playOrAdd(t),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Icon(Icons.album, color: pal.secondary, size: 32),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.title,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: pal.foreground),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(t.artist,
                      style:
                          TextStyle(fontSize: 11, color: pal.secondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Icon(Icons.play_arrow, color: pal.accent),
          ],
        ),
      ),
    );
  }
}
