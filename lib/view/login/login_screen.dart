import 'package:mytravaly_task/utils/import_files.dart';
import 'package:mytravaly_task/utils/spacers.dart';
import 'package:mytravaly_task/view/login/login_controller.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🏨 App Logo
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.hotel_rounded,
                    color: AppColors.themeColor,
                    size: 60,
                  ),
                ),
                Space.h20,
                Text(
                  'Welcome to Popular Stays',
                  style: textStyle(
                    fontSize: 22,
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Space.h10,
                Text(
                  'Login with your Google account to continue',
                  textAlign: TextAlign.center,
                  style: textStyle(
                    fontSize: 14,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Space.h35,

                Obx(
                  () =>
                      controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                            onTap: controller.signInWithGoogle,
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/googleIcon.png',
                                    height: 28,
                                    width: 28,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Continue with Google',
                                    style: textStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
