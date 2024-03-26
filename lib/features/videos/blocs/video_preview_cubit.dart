import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/features/videos/repository/video_repository.dart';

abstract class UploadState {}

class VideosInitial extends UploadState {}

class Videosloading extends UploadState {}

class VideosUploaded extends UploadState {}

class VideosError extends UploadState {
  final String error;

  VideosError(this.error);
}

class UploadCubit extends Cubit<UploadState> {
  final VideosRepository _repository = locator<VideosRepository>();

  UploadCubit() : super(VideosInitial());

  Future<void> uploadVideo(String caption, String videoPath) async {
    emit(Videosloading()); // Emit uploading state
    await _repository.uploadVideo(caption, videoPath);
    emit(VideosUploaded()); // Emit uploaded state
  }
}
