import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();
  writeStroage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readStorage(String key) async {
    await storage.read(key: key);
  }

  deleteStorage(String key) async {
    await storage.delete(key: key);
  }
}
