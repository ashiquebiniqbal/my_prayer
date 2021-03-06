import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static SharedPreferences _sharedPreferences;

  static MySharedPreferences _mySharedPreferences;

  MySharedPreferences._internal();

  Future<SharedPreferences> createPref() async {
    if (_sharedPreferences == null)
      _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  static MySharedPreferences getInstance() {
    if (_mySharedPreferences == null) {
      _mySharedPreferences = MySharedPreferences._internal();
    }
    return _mySharedPreferences;
  }

  Future<bool> setLatitude(double lat) async {
    return await _sharedPreferences.setDouble("lat", lat);
  }

  Future<double> getLatitude() async {
    return _sharedPreferences.getDouble("lat");
  }

  Future<bool> setMethod(int method) async {
    return await _sharedPreferences.setInt("method", method);
  }

  Future<int> getMethod() async {
    return _sharedPreferences.getInt("method") ?? 2;
  }

  Future<bool> setLongitude(double lon) async {
    return await _sharedPreferences.setDouble("ln", lon);
  }

  Future<double> getLongitude() async {
    return _sharedPreferences.getDouble("ln");
  }

  Future<bool> setPreviousMonth(int month) async {
    return await _sharedPreferences.setInt("month", month);
  }

  Future<int> getPreviousMonth() async {
    return _sharedPreferences.getInt("month") ?? -1;
  }

  Future<bool> setAddress(String address) async {
    return await _sharedPreferences.setString("address", address);
  }

  Future<String> getAddress() async {
    return _sharedPreferences.getString("address") ?? "No name";
  }

  Future<bool> setIsAP(bool ap) async {
    return await _sharedPreferences.setBool("ap", ap);
  }

  Future<bool> getIsAP() async {
    return _sharedPreferences.getBool("ap") ?? false;
  }

  Future<bool> setIsDark(bool theme) async {
    return await _sharedPreferences.setBool("theme", theme);
  }

  Future<bool> getIsDark() async {
    return _sharedPreferences.getBool("theme") ?? false;
  }

  Future<bool> setLastTasbih(int tasbih) async {
    return await _sharedPreferences.setInt("tasbih", tasbih);
  }

  Future<int> getLatsTasbih() async {
    return _sharedPreferences.getInt("tasbih")??-1;
  }

  Future<bool> setIsCustomLocation(bool location) async {
    return await _sharedPreferences.setBool("custom_location", location);
  }

  Future<bool> getIsCustomLocation() async {
    return _sharedPreferences.getBool("custom_location")??false;
  }

  Future<bool> setIsFirstBoot(bool boot) async {
    return await _sharedPreferences.setBool("boot", boot);
  }

  Future<bool> getIsFirstBoot() async {
    return _sharedPreferences.getBool("boot")??true;
  }



}
