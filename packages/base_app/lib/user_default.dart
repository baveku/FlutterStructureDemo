import 'package:shared_preferences/shared_preferences.dart';

class SaveKeys {
  static KeyData token = KeyData("token");
}

class KeyData {
  String rawValue;
  KeyData(this.rawValue);
}

class UserDefault {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<String> getItem(KeyData key) async {
    SharedPreferences instance = await getInstance();
    return instance.get(key.rawValue);
  }

  static setItem(KeyData key, String value) async {
    SharedPreferences instance = await getInstance();
    return await instance.setString(key.rawValue, value);
  }

  static clean() async {
    SharedPreferences instance =await getInstance();
    List<KeyData> keys = [SaveKeys.token];
    keys.forEach((key) async {
      await instance.remove(key.rawValue);
    });
  }
}
