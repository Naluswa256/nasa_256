import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/features/videos/blocs/video_timeline_cubit.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/provider/video_provider.dart';
import 'package:tiktok/features/videos/video_notifier.dart';
import 'package:tiktok/features/videos/view/widgets/video_post.dart';
import 'package:tiktok/screens/profile/screen/profileloginscreen.dart';

import 'package:tiktok/utils/color.dart';
import 'package:tiktok/utils/images.dart';

import '../controller/homepagecontroller.dart';
import 'homeprofilescreen.dart';
import 'livescreen.dart';
import 'reportpagescreen.dart';
import 'searchscreen.dart';
import 'usesoundscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomePageController homePageController = Get.put(HomePageController());
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  final videosCubit = locator<VideosCubit>();
  var currentPageValue = 0.0;
  var mItemCount = 2;
  //int _itemCount = 0;

  //final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 250);

  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    controller.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == mItemCount - 1) {
      videosCubit.fetchNextPage();
    }
  }

  void _onVideoFinished() {
    return;
    /* _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    ); */
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });

    videosCubit.fetchVideos(lastItemCreatedAt: null);
  }

  bool checkAuthentication() {
    return locator<LocalStorageService>().token != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideosCubit, VideosState>(
      bloc: videosCubit,
      builder: (context, state) {
        if (state is VideosLoaded) {
          final videos = state.videos; // Access the list of videomodels

          return Scaffold(
            backgroundColor: blackcolor,
            body: RefreshIndicator(
              onRefresh: () => videosCubit.refresh(),
              displacement: 50,
              edgeOffset: 20,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: controller,
                      itemCount: videos.length,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, index) {
                        final videoData = videos[index];
                        final videoNotifier =
                            VideoNotifier(videoData.id, videoData);
                        return Stack(
                          children: [
                            VideoProvider(
                              videoNotifier: videoNotifier,
                              child: VideoPost(
                                onVideoFinished: _onVideoFinished,
                                index: index,
                                videoData: videoData,
                                pageIndex:
                                    homePageController.selectedindex.value,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  topmenu(),
                                  Spacer(),
                                  // Obx(
                                  //   () => sideMenu(pageIndex: homePageController.selectedindex.value)
                                  // ),
                                  SizedBox(
                                    height: 80,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is VideosLoading) {
          return Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300]!,
                  // Set aspect ratio or size based on your video dimensions
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context)
                      .height, // Adjust height as needed
                ),
              ),
            ],
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                topmenu(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                // const Spacer(),
                const Center(
                    child: Text('Something Went Wrong try again',
                        style: TextStyle(color: Colors.white, fontSize: 18))),
                const SizedBox(height: 25),
                IconButton(
                    onPressed: () => videosCubit.fetchVideos(),
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowsRotate,
                      size: 18,
                      color: Colors.white,
                    ))
              ],
            ),
          );
        }
      },
      listener: (BuildContext context, VideosState state) {},
    );
  }

  Widget topmenu() {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Get.to(() => const LiveScreen());
            },
            child: SvgPicture.asset(live)),
        const Spacer(),
        Obx(
          () => GestureDetector(
            onTap: () {
              homePageController.selectedindex.value = 0;
              if (checkAuthentication()) {
                // Fetch videos for following only if user is authenticated
                homePageController.selectedindex.value = 0;
                videosCubit.fetchFollowingVideos();
              } else {
                // Or navigate to login screen:
                Get.to(() => const ProfileLoginScreen());
              }
            },
            child: Text(
              'Following',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: homePageController.selectedindex.value == 0
                    ? whitecolor
                    : whitecolor.withOpacity(0.7),
                fontSize: homePageController.selectedindex.value == 0 ? 18 : 16,
                fontWeight: homePageController.selectedindex.value == 0
                    ? FontWeight.w700
                    : FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              homePageController.selectedindex.value = 1;
            },
            child: Text(
              'For You',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: homePageController.selectedindex.value == 1
                    ? whitecolor
                    : whitecolor.withOpacity(0.7),
                fontSize: homePageController.selectedindex.value == 1 ? 18 : 16,
                fontWeight: homePageController.selectedindex.value == 1
                    ? FontWeight.w700
                    : FontWeight.w700,
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.to(() => const SearchScreen());
          },
          icon: const Icon(
            Icons.search,
            color: whitecolor,
          ),
        ),
      ],
    );
  }

  Widget bottomtextforyou() {
    return Positioned(
      bottom: 80,
      left: 0,
      child: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '@craig_love',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'The most satisfying Job',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8999999761581421),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: '#fyp #satisfying \n #roadmarking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const UseSoundScreen());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(musicnode),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Roddy Roundicch - The Rou',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8999999761581421),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomtextfollowing() {
    return Positioned(
      bottom: 80,
      left: 0,
      child: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '@karennne · 1-28',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '#fyp #satisfying \n #roadmarking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const UseSoundScreen());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(musicnode),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Avicii - Waiting For Love (ft. ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8999999761581421),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
