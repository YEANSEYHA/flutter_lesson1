import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  final _storage = FlutterSecureStorage();
  final key;

  CacheHelper(this.key);

  write(String value) {
    _storage.write(key: key, value: value);
  }

  Future<String?> read() async {
    return await _storage.read(key: key);
  }

  Future<void> clearCache() async {
    _storage.delete(key: key);
  }

  Future<void> clearAllCache() async {
    _storage.deleteAll();
  }
}
