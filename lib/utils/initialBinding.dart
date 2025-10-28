import 'package:mytravaly_task/view/home/home_screen.dart';
import 'package:mytravaly_task/view/splash/splash_controller.dart';

import 'import_files.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut(() => HomeScreen());
  }
}
