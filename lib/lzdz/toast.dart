import 'package:flutter/material.dart';

/// 轻量 Toast。本项目根为 CupertinoApp,二级页树下没有 Scaffold,
/// 不能用 ScaffoldMessenger(会抛 "No ScaffoldMessenger widget found")。
/// 用 Overlay 直接插一层,1500ms 后自动移除。
void showLzToast(BuildContext context, String msg) {
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
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            msg,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    ),
  );
  overlay.insert(entry);
  Future.delayed(const Duration(milliseconds: 1500), () {
    if (entry.mounted) entry.remove();
  });
}
