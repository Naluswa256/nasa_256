// videos_cubit.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/repository/video_repository.dart';
import 'package:tiktok/core/logging/custom_logger.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props;
}

class VideosInitial extends VideosState {
  @override
  List<Object> get props => [];
}

class VideosLoading extends VideosState {
  @override
  List<Object> get props => [];
}

class VideosLoaded extends VideosState {
  final List<VideoModel> videos;

  const VideosLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}

class VideosError extends VideosState {
  final String error;

  const VideosError(this.error);

  @override
  List<Object> get props => [error];
}

class VideosCubit extends Cubit<VideosState> {
  final VideosRepository _repository = locator<VideosRepository>();
  final log = CustomLogger(className: 'videosCubit');

  VideosCubit() : super(VideosInitial());

  Future<void> fetchVideos({DateTime? lastItemCreatedAt}) async {
    log.i('Fetching videos (lastItemCreatedAt: $lastItemCreatedAt)');
    emit(VideosLoading());
    try {
      final videos =
          await _repository.fetchVideos(lastItemCreatedAt: lastItemCreatedAt);
      final videoList = videos.docs
          .map((doc) =>VideoModel.fromSnap(doc as DocumentSnapshot))
          .toList();
      emit(VideosLoaded(videoList));
      log.i('Fetched videos successfully. Count: ${videoList.length}');
    } catch (e) {
      log.e('Error fetching videos: $e');
      emit(VideosError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchVideos(lastItemCreatedAt: null);
  }

  Future<void> fetchNextPage() async {
    if (state is VideosLoaded) {
      final lastVideo = (state as VideosLoaded).videos.last;
      log.i(
          'Fetching next page of videos (last video createdAt: ${lastVideo.createdAt})');
      await fetchVideos(lastItemCreatedAt: lastVideo.createdAt);
    }
  }

  
  Future<void> fetchFollowingVideos() async {
    log.i('Fetching following videos');
    emit(VideosLoading());
    try {
      final followingVideos = await _repository.fetchFollowingVideos();
      emit(VideosLoaded(followingVideos));
      log.i('Fetched following videos successfully. Count: ${followingVideos.length}');
    } catch (e) {
      log.e('Error fetching following videos: $e');
      emit(VideosError(e.toString()));
    }
  }

  Future<void> fetchVideosByTags(List<String> tags) async {
    log.i('Fetching videos by tags: $tags');
    emit(VideosLoading());
    try {
      final videos = await _repository.fetchVideosByTags(tags);
      emit(VideosLoaded(videos));
      log.i('Fetched videos by tags successfully. Count: ${videos.length}');
    } catch (e) {
      log.e('Error fetching videos by tags: $e');
      emit(VideosError(e.toString()));
    }
  }
}
