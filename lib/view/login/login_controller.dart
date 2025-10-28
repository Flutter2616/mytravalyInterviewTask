import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mytravaly_task/utils/import_files.dart';
import 'package:mytravaly_task/view/home/home_screen.dart';
import 'package:mytravaly_task/view/login/login_screen.dart';

class AuthController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    googleSignIn = GoogleSignIn();
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        showMassage('Failed to login');
        return;
      }
      Storage.storage.setBool(Storage.storage.isLoginKey, true);
      Storage.storage.setString(
        Storage.storage.userNameKey,
        googleUser.displayName ?? 'User',
      );
      Storage.storage.setString(
        Storage.storage.userEmailKey,
        googleUser.email ?? "",
      );
      Storage.storage.setString(
        Storage.storage.userPhotoKey,
        googleUser.photoUrl ?? '',
      );

      showMassage('Hello ${googleUser.displayName ?? ""}!');
      screenNavigation(
        screen: HomeScreen(),
        navigationType: NavigationType.PushReplecement,
      );
    } catch (e) {
      showMassage('Failed to login');
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> logout() async {
    await googleSignIn.signOut();
    Storage.storage.clearStorage();
    screenNavigation(screen: LoginScreen(),navigationType: NavigationType.RemoveAllPush);
  }
}
