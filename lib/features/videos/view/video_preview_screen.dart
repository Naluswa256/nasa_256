import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/features/videos/blocs/video_preview_cubit.dart'; // Import uploadCubit
import 'package:saver_gallery/saver_gallery.dart';
import 'package:tiktok/screens/bottomnavigation/screen/bottomnavigationscreen.dart';
import 'package:tiktok/screens/homepage/screen/homescreen.dart';
import 'package:video_player/video_player.dart';
import 'package:toast/toast.dart';

class VideoPreviewScreen extends StatefulWidget {
  final XFile video;
  final bool isPicked;

  const VideoPreviewScreen({
    super.key,
    required this.video,
    required this.isPicked,
  });

  @override
  VideoPreviewScreenState createState() => VideoPreviewScreenState();
}

class VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;
  final uploadCubit = locator<UploadCubit>(); // Get uploadCubit

  bool _savedVideo = false;

  Future<void> _initVideo() async {
    _videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.setVolume(1);
    await _videoPlayerController.play();
    // setState(() {});
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _initVideo();
  // }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _saveToGallery() async {
    if (_savedVideo) return;

    await SaverGallery.saveFile(widget.video.path);

    _savedVideo = true;

    setState(() {});
  }

  void _onUploadPressed() async {
    await _videoPlayerController.pause();
    uploadCubit.uploadVideo(
        '', widget.video.path); // Use uploadCubit for upload
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Preview video'),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveToGallery,
              icon: FaIcon(
                _savedVideo
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.download,
              ),
            ),
          BlocConsumer<UploadCubit, UploadState>(
            bloc: uploadCubit, // Reference the cubit instance
            builder: (context, state) {
              return IconButton(
                onPressed: state is Videosloading
                    ? null
                    : _onUploadPressed, // Disable button if uploading
                icon: state is Videosloading
                    ? const CircularProgressIndicator()
                    : const FaIcon(FontAwesomeIcons.cloudArrowUp),
              );
            },
            listener: (BuildContext context, UploadState state) {
              if (state is VideosUploaded) {
                // Navigate to HomeScreen on successful upload
                Get.to(() => const BottomNavigation());
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _initVideo(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController);
          }
        },
      ),
    );
  }
}
