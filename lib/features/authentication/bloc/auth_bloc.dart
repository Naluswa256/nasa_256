import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/core/services/auth_service.dart';
import 'package:tiktok/features/authentication/bloc/authentication_state.dart';
import 'package:get/get.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
 // final _authService = locator<AuthService>();
  final AuthService _authService = Get.put(AuthService());
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(AuthenticationLoading());
    final result = await _authService.signInWithEmailAndPassword(email: email, password: password);
    result.fold(
      (error) => emit(AuthenticationFailure(message: error.toString())),
      (_) => emit(AppAutheticated()),
    );
  }

  
  Future<void> appStarted() async {
     emit(AuthenticationLoading());
    try {
      final String? authToken = locator<LocalStorageService>().token;
      final bool isAuthenticated = authToken != null;
      if (isAuthenticated) {
        emit(AppAutheticated());
      } else {
        emit(AuthenticationNotAuthenticated());
      }
    } catch (e) {
        emit(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    emit(AuthenticationLoading());
    final result = await _authService.createUserWithEmailAndPassword(email: email, password: password);
    result.fold(
      (error) => emit(AuthenticationFailure(message: error.toString())),
      (_) => emit(AppAutheticated()),
    );
  }

  Future<void> signInAnonymously(List<String> selectedInterests) async {
    emit(AuthenticationLoading());
    final result = await _authService.anonymousSignInMethod(selectedInterests);
    result.fold(
      (error) => emit(AuthenticationFailure(message: error.toString())),
      (_) => emit(AppAutheticated()),
    );
  }

  Future<void> convertAnonymousToEmailAndPassword(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      await _authService.convertAnonymousToEmailandPassword(email: email, password: password);
      emit(AppAutheticated());
    } catch (error) {
      emit(AuthenticationFailure(message: error.toString()));
    }
  }

  Future<void> convertAnonymousToGoogle() async {
    emit(AuthenticationLoading());
    final result = await _authService.signInWithGoogle();
    result.fold(
      (error) => emit(AuthenticationFailure(message: error.toString())),
      (_) => emit(AppAutheticated()),
    );
  }

  // Add other authentication methods as needed...

  // For example:
  Future<void> logOut() async {
    emit(AuthenticationLoading());
    await _authService.logOut();
    emit(UserLogoutState());
  }
}
