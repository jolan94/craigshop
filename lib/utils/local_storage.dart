import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final GetStorage _box = GetStorage();

  static void saveString(String key, String value) {
    _box.write(key, value);
  }

  static String getString(String key) {
    return _box.read(key) as String? ?? '';
  }

  // Add other methods for different data types as per your requirement
}
