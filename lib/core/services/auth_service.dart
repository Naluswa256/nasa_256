
import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok/core/constants/app_constants.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/core/services/collections_refs.dart';
import 'package:tiktok/features/authentication/model/user_model.dart';


typedef EitherException<T> = Future<Either<Exception, T>>;


class AuthService{
  final firebaseAuth = locator<FirebaseAuth>();
  
   Future<String> getCurrentUserUid() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser != null) {
      return currentUser.uid;
    } else {
      throw Exception('User is not signed in');
    }
  }
  

  
  
  EitherException<bool> updateEmail({required String email}) async {
    final user = firebaseAuth.currentUser;
    try {
      if (EmailValidator.validate(email)) {
        await user?.updateEmail(email);
        return const Right(true);
      }
    } on Exception catch (e) {
      return Left(e);
    }
    return Left(Exception(AppConstants.please_enter_valid_email_key));
  }


  EitherException<bool> updatePassword({required String newPassword}) async {
    final user = firebaseAuth.currentUser;
    RegExp regExletters = RegExp(r"(?=.*[a-z])\w+");
    RegExp regExnumbers = RegExp(r"(?=.*[0-9])\w+");
    RegExp regExbigletters = RegExp(r"(?=.*[A-Z])\w+");

    try {
      if (regExletters.hasMatch(newPassword) == false ||
          regExnumbers.hasMatch(newPassword) == false ||
          regExbigletters.hasMatch(newPassword) == false) {
        return Left(Exception(
          AppConstants
              .please_the_password_should_contain_at_least_8_characters_and_big_letters_and_small_with_one_number_at_least_key
        ));
      }
      await user?.updatePassword(newPassword);
      return const Right(true);
    } on Exception catch (e) {
      if (e.toString() ==
          "[firebase_auth/requires-recent-login] This operation is sensitive and requires recent authentication. Log in again before retrying this request.") {
        return Left(
            Exception(AppConstants.sensitive_change_password_process_key));
      }
      return Left(e);
    }
  }


  EitherException<bool> sendVerifiectionEmail() async {
    final user = firebaseAuth.currentUser;

    try {
      if (user != null) {
        await firebaseAuth.currentUser!.reload();

        if (!user.emailVerified) {
          await user.sendEmailVerification();
          return const Right(false);
        }
        return const Right(true);
      }
      throw Exception(
          AppConstants.there_is_no_user_logging_in_or_sign_up_key);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  EitherException<bool> checkEmailVerifction() async {
    //Call after send email verifiction
    User? user = firebaseAuth.currentUser;
    try {
      if (user != null) {
        await firebaseAuth.currentUser!.reload();
        user = firebaseAuth.currentUser;
        if (user!.emailVerified) {
          return const Right(true);
        }
        return const Right(false);
      }
      throw Exception(
          AppConstants.there_is_no_user_logging_in_or_sign_up_key);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
// the Developer karem saad 




  //* it works
  AuthCredential getEmailCredential(
      {required String email, required String password}) {
    // Email and password sign-in
    final AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
        
    return credential;
  }

  //* it works
  Future<AuthCredential> getGooglecredential() async {
    //Trigger the authentication
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    if (googleUser == null) {
      // User did not select an account, handle the error case here
      throw Exception(AppConstants
          .Google_sign_in_was_canceled_or_no_account_was_selected_key);
    }
//Obtin the auth detailes from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
//Create New Credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return credential;
  }


  //* it works
  Future<void> convertAnonymousToGoogle({required String username}) async {
    AuthCredential credential = await getGooglecredential();
    await convertAnonymousToPermanent(
      credential: credential,
    );
  }

  //* it works
  Future<void> convertAnonymousToEmailandPassword(
      {required String email, required String password,}) async {
    final credential = getEmailCredential(email: email, password: password);
    await convertAnonymousToPermanent(
      credential: credential,
      // authFormTypeParameter: AuthFormType.email
    );
  

  }

  //* it works
  Future<void> convertAnonymousToPermanent({
    required credential,
    // required AuthFormType authFormTypeParameter
  }) async {
    try { 
     final UserCredential? firebasecredential=  await firebaseAuth.currentUser?.linkWithCredential(credential as AuthCredential);    
      firebaseAuth.currentUser!.reload();
       await _storeUserData(firebasecredential!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
              throw Exception( AppConstants
                 .The_provider_has_already_been_linked_to_the_user_key);

        case "invalid-credential":
             throw Exception('Invalid credential.');
        case "credential-already-in-use":
             throw Exception(
            AppConstants.The_account_corresponding_to_the_credential_already_exists_or_is_already_linked_to_a_Firebase_User_key
             );
        default:
           throw Exception('Unknown error.');
      }
    }
  }

  EitherException<UserCredential> signInWithGoogle() async {
    try {
      final credential = await getGooglecredential();
      UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      await _storeUserData(userCredential);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(handleFirebaseAuthException(e));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  EitherException<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(handleFirebaseAuthException(e));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

    EitherException<UserCredential> createUserWithEmailAndPassword(
      {required String email,required password,
     }) async {
    try {
      final userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
          await _storeUserData(userCredential);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
        return Left(handleFirebaseAuthException(e));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Exception handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Exception(AppConstants.please_enter_valid_email_key);
      case 'user-disabled':
        return Exception(AppConstants.user_disabled_key);
      case 'user-not-found':
        return Exception(AppConstants.user_not_found_key);
      case 'wrong-password':
        return Exception(AppConstants.wrong_password_key);
      case 'account-exists-with-different-credential':
        return Exception(AppConstants.account_exists_with_different_credential_key);
      case 'email-already-in-use':
        return Exception(AppConstants.email_already_in_use_key);
      case 'weak-password':
        return Exception(AppConstants.weak_password_key);
      default:
        return Exception('Unknown error');
    }
  }

Future<void> _storeUserData(UserCredential userCredential,[List<String>? selectedTags]) async {
  if (userCredential.user!.isAnonymous) {
    // Store data in Firestore
    // Create the UserModel object with the appropriate data
  final userModel = UserModel(
    uid: userCredential.user!.uid,
    interests: selectedTags
  );
    await userCollectionRef.doc(userCredential.user!.uid).set(userModel);

    // Store UID in local storage (no token for anonymous users)
    locator<LocalStorageService>().uid = userCredential.user!.uid;
  } else {
    locator<LocalStorageService>().token = (await userCredential.user!.getIdToken())!;
  }
}

  //* it works
  EitherException<UserCredential> anonymousSignInMethod(List<String> selectedTags) async {
    try {
      final credential = await firebaseAuth.signInAnonymously();
      await _storeUserData(credential,selectedTags);
      return Right(credential);
    } on Exception catch (e) {
      return Left(e);
    }
  }
  


  //* it works
  Future<void> logOut() async {
    await firebaseAuth.signOut();
}

}

  // ... existing methods (logOut, etc.)

