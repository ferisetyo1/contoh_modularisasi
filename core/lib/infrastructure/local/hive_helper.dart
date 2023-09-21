import 'package:core/dependency.dart';

class HiveHelper {
  final Box<dynamic> _box;

  HiveHelper(this._box);

  // Future<void> setUserToken(String? token) async {
  //   await _box.put(HiveBoxName.keyToken, token);
  // }

  // Future<void> setRefreshToken(String? token) async {
  //   await _box.put(HiveBoxName.keyRefreshToken, token);
  // }

  // String? getUserToken() {
  //   return _box.get(HiveBoxName.keyToken, defaultValue: null);
  // }

  // String? getRefreshToken() {
  //   return _box.get(HiveBoxName.keyRefreshToken, defaultValue: null);
  // }
}
