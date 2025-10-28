import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/import_files.dart';

Future<Map<String, dynamic>> apiCall({
  final String methodName='POST',
  final bool isPassVisitorToken = false,
  final bool isLoaderShow = true,
  Map<String, String>? header,
  required Map<String, dynamic> body,
}) async {
  // try {
    if (isLoaderShow) {
      Loader.showLoading();
    }
    Map<String, String> headers;
    http.StreamedResponse response;
    headers = header??(isPassVisitorToken?{
      'authtoken': ApiUrl.authToken,
      'visitortoken': Storage.storage.deviceToken,
      'Content-Type': 'application/json'
    }:{
      'authtoken': ApiUrl.authToken,
      'Content-Type': 'application/json'
    });

    var request = http.Request(methodName, Uri.parse(ApiUrl.baseUrl));
    request.body = json.encode(body);
    request.headers.addAll(headers);
    response = await request.send();
    if (isLoaderShow) {
      screenNavigation();
    }
    if(response.statusCode==200||response.statusCode==201)
      {
      String resString=await response.stream.bytesToString();
      var resJson=jsonDecode(resString);
        if(resJson['status']==true)
          {
            return resJson;
          }else
            {
              throw '';
            }
      }else
        {
          throw '';
        }
  // } catch (e) {
  //   return {"status": false, "message": ApiUrl.errorMsg};
  // }
}

class ApiUrl {
  static const String baseUrl = 'https://api.mytravaly.com/public/v1/';
  static const String authToken = '71523fdd8d26f585315b4233e39d9263';
  static const String errorMsg = 'Something Went Wrong';


  ///SIGNUP API
  static const String deviceRegisterAction = 'deviceRegister';
  static const String searchAutoCompleteAction = 'searchAutoComplete';
  static const String popularStayAction = 'popularStay';
}
