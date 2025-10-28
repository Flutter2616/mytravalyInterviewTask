import '../../utils/import_files.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.houseboat,color: AppColors.white,size: 50.w),
            Text(
              "Popular Stays",
              style: textStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                fontSize: 8.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
