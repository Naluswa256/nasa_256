import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/core/constants/breakpoints.dart';
import 'package:tiktok/core/constants/gaps.dart';
import 'package:tiktok/core/constants/sizes.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/core/services/auth_service.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/provider/video_provider.dart';
import 'package:tiktok/features/videos/video_notifier.dart';
import 'package:tiktok/features/videos/view/widgets/video_button.dart';
import 'package:tiktok/features/videos/view/widgets/video_comments.dart';
import 'package:tiktok/screens/homepage/controller/homepagecontroller.dart';
import 'package:tiktok/screens/homepage/screen/homeprofilescreen.dart';
import 'package:tiktok/screens/homepage/screen/reportpagescreen.dart';
import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final VideoModel videoData;

  final int index;
  final int pageIndex;

  const VideoPost({
    super.key,
    required this.videoData,
    required this.onVideoFinished,
    required this.index,
    required this.pageIndex,
  });

  @override
  VideoPostState createState() => VideoPostState();
}

class VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;
  final Duration _animationDuration = const Duration(milliseconds: 200);
  final String payload =
      "Let me go home but you should know\nthere is super long sentence here";
  HomePageController homePageController = Get.put(HomePageController());
  late final AnimationController _animationController;
  bool _isPaused = false;
  bool _showDetail = false;
  final _localStorge = locator<LocalStorageService>();
  final firebaseauth = locator<FirebaseAuth>();

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoData.videoUrl));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    if (kIsWeb) {
      await _videoPlayerController.setVolume(0);
    }
    _videoPlayerController.addListener(_onVideoChange);
    setState(() {}); // mandatory?
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // void _onPlaybackConfigChanged() {
  //   if (!mounted) return;
  //   final muted = _localStorge.isMuted;
  //   ref.read(playbackConfigProvider.notifier).setMuted(!muted);
  //   if (muted) {
  //     _videoPlayerController.setVolume(0);
  //   } else {
  //     _videoPlayerController.setVolume(1);
  //   }
  // }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      final autoplay = _localStorge.isAutoPlay;
      if (autoplay) {
        _videoPlayerController.play();
      }
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (!mounted) return;
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  // void _onMuteTap() {
  //   if (_videoPlayerController.value.volume == 0) {
  //     _videoPlayerController.setVolume(0.1);
  //   } else {
  //     _videoPlayerController.setVolume(0);
  //   }
  //   setState(() {});
  // }

  void toggleDetail() {
    setState(() {
      _showDetail = !_showDetail;
    });
  }

  String handleDetail(String payload) {
    if (payload.length <= 20) {
      return payload;
    }

    return _showDetail ? payload : "${payload.substring(0, 20)}...";
  }

  String _getCountText(int count) {
    if (count >= 1000) {
      final formattedCount = '${(count / 1000).toStringAsFixed(1)}K';
      return formattedCount;
    } else {
      return '$count';
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Image.network(
                    widget.videoData.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@${widget.videoData.username}",
                  style: const TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                AnimatedCrossFade(
                  duration: const Duration(microseconds: 2000),
                  firstChild: Container(),
                  secondChild: Text(
                    handleDetail(widget.videoData.caption),
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.white,
                    ),
                  ),
                  crossFadeState: _showDetail
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Sizes.size200,
                      child: _showDetail
                          ? Container()
                          : Text(
                              handleDetail(widget.videoData.caption),
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    GestureDetector(
                      onTap: toggleDetail,
                      child: Text(
                        _showDetail ? "less" : "more",
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: Get.height * 0.20,
              right: 10,
              child: sideMenu(pageIndex: widget.pageIndex, context: context)),
        ],
      ),
    );
  }

  commentwidget() {
    Get.bottomSheet(
        StatefulBuilder(
          builder: (context, setState) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: Get.height * .70,
                width: Get.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: whitecolor),
                child: Column(children: [
                  const SizedBox(
                    height: 75,
                    child: Center(
                      child: Text(
                        '579 Comments',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: blackcolor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: lightborderColor,
                    height: 2,
                    width: Get.width,
                  ),
                  SizedBox(
                    height: Get.height * .45,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: SizedBox(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          feed1,
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Kristin Watson',
                                      style: TextStyle(
                                        color: blackcolor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Amet minim mollit non deserunt ullamco est sit aliquadolos do amet sint. Velit official consequat duis enim velit.',
                                  style: TextStyle(
                                    color: blackcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(redheart),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      '123',
                                      style: TextStyle(
                                        color: blackcolor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      '3 days ago',
                                      style: TextStyle(
                                        color: Color(0xFF86878B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      'Reply',
                                      style: TextStyle(
                                        color: Color(0xFF86878B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 100,
                  // )
                ]),
              ),
              Container(
                color: whitecolor,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: homePageController
                                    .commentcontroller.text.isNotEmpty
                                ? primaryColor
                                : Colors.transparent),
                        color:
                            homePageController.commentcontroller.text.isNotEmpty
                                ? lightpinkColor
                                : greyEB,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: Get.width * .80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width * .60,
                              child: TextField(
                                autofocus: false,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller:
                                    homePageController.commentcontroller,
                                style: const TextStyle(color: primaryColor),
                                decoration: const InputDecoration(
                                    hintText: "Add comment...",
                                    border: InputBorder.none),
                              ),
                            ),
                            Icon(
                              Icons.alternate_email_outlined,
                              color: homePageController
                                      .commentcontroller.text.isNotEmpty
                                  ? primaryColor
                                  : blackcolor,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.emoji_emotions_outlined,
                              color: homePageController
                                      .commentcontroller.text.isNotEmpty
                                  ? primaryColor
                                  : blackcolor,
                            )
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(send)
                  ],
                ),
              )
            ],
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.none);
  }

  sharewidget() {
    Get.bottomSheet(
        Container(
          width: Get.width,
          height: height < 700 ? Get.height * .75 : Get.height * .70,
          decoration: const BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 75,
              child: Center(
                child: Text(
                  'Send to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackcolor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              color: lightborderColor,
              height: 2,
              width: Get.width,
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homePageController.sendtolist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(
                        homePageController.sendtolist[index],
                        height: Get.width * .15,
                        width: Get.width * .15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        homePageController.sendtonamelist[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: blackcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                color: lightborderColor,
                height: 2,
                width: Get.width,
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homePageController.sendtoicon.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.to(() => const ReportScreen());
                          }
                        },
                        child: Image.asset(
                          homePageController.sendtoicon[index],
                          height: Get.width * .15,
                          width: Get.width * .15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        homePageController.sendtoiconstring[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: blackcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.none);
  }

  Widget sideMenu({required int pageIndex, required BuildContext context}) {
    final videoNotifier = VideoProvider.of(context).videoNotifier;
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pageIndex == 0
              ? GestureDetector(
                  onTap: () {
                    Get.to(() => const HomeProfileScreen());
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        feed2,
                        height: 48,
                        width: 48,
                      )))
              : GestureDetector(
                  onTap: () {
                    Get.to(() => const HomeProfileScreen());
                  },
                  child: Stack(clipBehavior: Clip.none, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          feed1,
                          height: 48,
                          width: 48,
                        )),
                    Positioned(
                      bottom: -10,
                      left: 15,
                      child: Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(42)),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 16,
                            color: whitecolor,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () async {
              await videoNotifier
                  .toggleLike(); // Call toggleLike method on click
            },
            child: SvgPicture.asset(heart1,
                colorFilter: videoNotifier.isLiked
                    ? const ColorFilter.mode(Colors.red, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                // Change SVG based on isLiked state
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            _getCountText(videoNotifier.likeCount),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () async {
              await videoNotifier
                  .toggleBookmark(); // Call toggleBookmark method on click
            },
            child: SvgPicture.asset(save,
                colorFilter: videoNotifier.isBookmarked
                    ? const ColorFilter.mode(Colors.red, BlendMode.srcIn)
                    : const ColorFilter.mode(
                        Colors.white,
                        BlendMode
                            .srcIn) // Change SVG based on isBookmarked state
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            _getCountText(videoNotifier.bookmarkCount),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
              onTap: () {
                sharewidget();
              },
              child: SvgPicture.asset(share)),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Share',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
