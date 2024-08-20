import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box box;

  static init() {
    box = Hive.box('user');
  }

  static cacheData(key, value) {
    box.put(key, value);
  }

  static getCacheData(key) {
    return box.get(key);
  }

  static removeData(key) {
    box.delete(key);
  }
}
