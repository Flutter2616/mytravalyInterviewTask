

import 'package:shared_preferences/shared_preferences.dart';

class Storage extends StorageValue
{
  static final Storage storage=Storage._();
  Storage._();


  ///storage key
  String isLoginKey='isLogin';
  String deviceTokenKey='deviceToken';
  String userNameKey='profileName';
  String userEmailKey='profileEmail';
  String userPhotoKey='profileImg';
  SharedPreferences? sharedPreferences;
  Future<void> getStorageObject()
  async {
    sharedPreferences=await SharedPreferences.getInstance();
  }

  Future<void> setString(String key,String value)
  async {
    await sharedPreferences!.setString(key, value);
    getAllStorageValue();
  }

  Future<void> setBool(String key,bool value)
  async {
    await sharedPreferences!.setBool(key, value);
    getAllStorageValue();
  }

  String getString(String key)
  {
    return sharedPreferences!.getString(key)??'';
  }

  bool getBool(String key)
  {
    return sharedPreferences!.getBool(key)??false;
  }

  void getAllStorageValue()
  {
    isLoginValue=getBool(isLoginKey);
    deviceToken=getString(deviceTokenKey);
    userName=getString(userNameKey);
    userEmail=getString(userEmailKey);
    userPhoto=getString(userPhotoKey);
  }
  void clearStorage()
  {
    setBool(isLoginKey, false);
    setString(deviceTokenKey, '');
    setString(userNameKey, '');
    setString(userEmailKey, '');
    setString(userPhotoKey, '');
  }
}

class StorageValue
{
  bool isLoginValue=false;
  String deviceToken='';
  String userName='';
  String userEmail='';
  String userPhoto='';
}