import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenServices {
  static final TokenServices _instance = TokenServices.internal();
  TokenServices.internal();
  factory TokenServices() => _instance;

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;

  final storage = FlutterSecureStorage();

  get refreshToken async {
    if (_refreshToken != null) return _refreshToken;
    _refreshToken = await storage.read(key: 'refreshToken');
    return _refreshToken;
  }

  storeToken({accessToken, refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    storage.write(key: "refreshToken", value: refreshToken);
  }

  deletToken() {
    _accessToken = null;
    _refreshToken = null;
    storage.delete(key: 'refreshToken');
  }
}
