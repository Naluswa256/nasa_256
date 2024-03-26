import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok/features/videos/blocs/video_preview_cubit.dart';
import 'package:tiktok/features/videos/repository/video_repository.dart';
import '../../features/authentication/bloc/auth_bloc.dart';
import '../../features/videos/blocs/video_timeline_cubit.dart';
import '../localStorage/local_storage.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  locator.registerSingleton<LocalStorageService>(LocalStorageService());
  locator
      .registerLazySingleton<AuthenticationCubit>(() => AuthenticationCubit());
  locator.registerLazySingleton<VideosRepository>(() => VideosRepository());
  locator.registerLazySingleton<VideosCubit>(() => VideosCubit());
  locator.registerLazySingleton<UploadCubit>(() => UploadCubit());
  //locator.registerSingleton<AuthService>(AuthService());
}
