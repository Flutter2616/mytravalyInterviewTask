

import 'package:firebase_core/firebase_core.dart';
import 'package:mytravaly_task/utils/initialBinding.dart';

import '../../utils/import_files.dart';
import 'package:mytravaly_task/view/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Storage.storage.getStorageObject();
  Storage.storage.getAllStorageValue();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialBinding: InitialBinding(),
      home: SplashScreen(),
    );
  }
}
