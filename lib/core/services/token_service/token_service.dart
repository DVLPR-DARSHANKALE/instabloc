import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static final TokenService _instance = TokenService.internal();
  TokenService.internal();
  factory TokenService() => _instance;

  final storage = FlutterSecureStorage();

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;

  Future<String?> get refreshToken async {
    if (_refreshToken != null) return _refreshToken;
    _refreshToken = await storage.read(key: 'refreshToken');
    return _refreshToken;
  }

  storeToken({accessToken, refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    storage.write(key: "refreshToken", value: refreshToken);
  }

  deleteTokens() {
    _accessToken = null;
    _refreshToken = null;
    storage.delete(key: "refreshToken");
  }
}
