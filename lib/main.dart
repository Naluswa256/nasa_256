import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/logging/custom_logger.dart';
import 'package:tiktok/screens/SplashPage/splashscreen.dart';
import 'package:tiktok/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:connectivity_bloc/connectivity_bloc.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    // navigation bar color
    statusBarColor: Colors.transparent,
    // status bar color
    statusBarBrightness: Brightness.dark,
    //status bar brigtness
    statusBarIconBrightness: Brightness.light,
    //status barIcon Brightness
    systemNavigationBarDividerColor: Colors.transparent,
    //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.immersiveSticky,
  // );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //  await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  await setupLocator();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityBloc(),
      child: FirebasePhoneAuthProvider(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TikTok',
          theme: ThemeData(
            unselectedWidgetColor: primaryColor,
            fontFamily: "ProximaNova",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home:
          const SplashScreen(),
        ),
      ),
    );
  }
}
