import 'package:flutter/material.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/repository/video_repository.dart';

class VideoNotifier extends ChangeNotifier {
  final String videoId;

  // Local state variables initialized from the provided Video model
  late int _likeCount;
  late int _commentCount;
  late int _bookmarkCount;
  final VideosRepository _videoRepository = locator<VideosRepository>();

  bool _isLiked = false;
  bool _isBookmarked = false;

  VideoNotifier(this.videoId, VideoModel video) {
    _likeCount = video.likeCount;
    _commentCount = video.commentCount;
    _bookmarkCount = video.bookmarkCount;
    _fetchUserInteraction(); // Renamed to _fetchUserInteraction
  }

  // Getters for local state
  int get likeCount => _likeCount;
  int get commentCount => _commentCount;
  int get bookmarkCount => _bookmarkCount;

  // Expose liked and bookmarked state
  bool get isLiked => _isLiked;
  bool get isBookmarked => _isBookmarked;

  // Update like count and call toggleLike on VideosRepository
  Future<void> toggleLike() async {
   // _isLiked = await _videoRepository.isUserLiked(videoId);
    _likeCount = _isLiked ? _likeCount - 1 : _likeCount + 1;
    _isLiked = !_isLiked;
    notifyListeners();

    // Call Firebase function to update likes (assuming handled by VideosRepository)
    await _videoRepository.likeVideo(videoId);
  }

  // Update bookmark status and call toggleBookmark on VideosRepository
  Future<void> toggleBookmark() async {
   // _isBookmarked = await _videoRepository.isUserBookmarked(videoId);
    _bookmarkCount = _isBookmarked ? _bookmarkCount - 1 : _bookmarkCount + 1;
    _isBookmarked = !_isBookmarked;
    notifyListeners();

    // Call Firebase function to update bookmarks (assuming handled by VideosRepository)
    await _videoRepository.toggleBookmark(videoId);
  }

  // Helper method to update _isLiked and _isBookmarked based on repository calls
  Future<void> _fetchUserInteraction() async {
    _isLiked = await _videoRepository.isUserLiked(videoId);
    _isBookmarked = await _videoRepository.isUserBookmarked(videoId);
    notifyListeners(); // Notify UI of initial liked and bookmarked state
  }
}
