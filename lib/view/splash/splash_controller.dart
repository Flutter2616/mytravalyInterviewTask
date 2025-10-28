import 'package:mytravaly_task/utils/import_files.dart';
import 'package:mytravaly_task/view/home/home_screen.dart';
import 'package:mytravaly_task/view/login/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    splashLogic();
  }

  void splashLogic() {
    try {
      registerDeviceInfo().then((value) {
        if (value) {
          Future.delayed(Duration(seconds: 2), () {
            screenNavigation(
              screen:
                  Storage.storage.isLoginValue ? HomeScreen() : LoginScreen(),
              navigationType: NavigationType.PushReplecement,
            );
          });
        }
      });
    } catch (e) {
      showMassage(ApiUrl.errorMsg);
    }
  }

  Future<bool> registerDeviceInfo() async {
    try {
      if (Storage.storage.deviceToken.isNotEmpty) {
        return true;
      } else {
        final deviceInfoPlugin = DeviceInfoPlugin();
        final androidInfo = await deviceInfoPlugin.androidInfo;
        var body = {
          "action": ApiUrl.deviceRegisterAction,
          "deviceRegister": {
            "deviceModel": androidInfo.model,
            "deviceFingerprint": androidInfo.fingerprint,
            "deviceBrand": androidInfo.brand,
            "deviceId": androidInfo.device,
            "deviceName": androidInfo.display,
            "deviceManufacturer": androidInfo.manufacturer,
            "deviceProduct": androidInfo.product,
            "deviceSerialNumber": "unknown",
          },
        };
        var jsonRes = await apiCall(body: body);
        if (jsonRes['status'] == true) {
          Storage.storage.setString(
            Storage.storage.deviceTokenKey,
            jsonRes['data']['visitorToken'].toString(),
          );
          return true;
        } else {
          throw '';
        }
      }
    } catch (e) {
      return false;
    }
  }
}
