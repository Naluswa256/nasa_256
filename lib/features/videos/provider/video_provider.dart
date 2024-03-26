import 'package:flutter/material.dart';
import 'package:tiktok/features/videos/video_notifier.dart';

class VideoProvider extends InheritedWidget {
  final VideoNotifier videoNotifier;

  const VideoProvider({
    super.key,
    required this.videoNotifier,
    required super.child,
  });

  static VideoProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<VideoProvider>();
    assert(provider != null, 'No VideoProvider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(VideoProvider oldWidget) => videoNotifier != oldWidget.videoNotifier;
}