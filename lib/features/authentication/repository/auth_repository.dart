import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:instagrambloc/core/consts/host.dart';
import 'package:instagrambloc/core/services/device_info/device_info_service.dart';
import 'package:instagrambloc/core/services/token_service/token_service.dart';
import 'package:logger/logger.dart';

class AuthRepository {
  final TokenService token;

  final Logger logger = Logger();

  AuthRepository(this.token);

  Future<bool> signUp({email, password}) async {
    Uri url = Uri.parse("$host/sign-up");
    String? deviceId = await DeviceInfoService.getDeviceId();
    log("DEVICE ID $deviceId");
    var payload = {"email": email, "password": password, "deviceId": deviceId};
    var headers = {"Content-Type": "application/json"};

    try {
      Response response = await post(
        url,
        body: jsonEncode(payload),
        headers: headers,
      );
      var body = jsonDecode(response.body);
      logger.d(body);

      if (response.statusCode == 201) {
        final String accessToken = body['data']['accessToken'];
        final String refreshToken = body['data']['refreshToken'];
        token.storeToken(accessToken: accessToken, refreshToken: refreshToken);
        return true;
      } else if (response.statusCode == 409) {
        throw "Email alredy exist";
      }
      throw Exception("Unable to sign up");
    } catch (e) {
      throw e;
    }
  }

  Future<bool> signIn({required email, required password}) async {
    Uri url = Uri.parse("$host/sign-in");
    String? deviceId = await DeviceInfoService.getDeviceId();
    log("DEVICE ID $deviceId");
    var payload = {"email": email, "password": password, "deviceId": deviceId};
    var headers = {"Content-Type": "application/json"};

    try {
      Response response = await post(
        url,
        body: jsonEncode(payload),
        headers: headers,
      );

      var body = jsonDecode(response.body);
      logger.d(body);

      if (response.statusCode == 200) {
        final String accessToken = body['data']['accessToken'];
        final String refreshToken = body['data']['refreshToken'];
        token.storeToken(accessToken: accessToken, refreshToken: refreshToken);
        return true;
      } else {
        throw body['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  refreshToken() async {
    Uri url = Uri.parse("$host/refresh-token");
    var payload = {"token": await token.refreshToken};
    var headers = {"Content-Type": "application/json"};

    try {
      Response response = await post(
        url,
        body: jsonEncode(payload),
        headers: headers,
      );

      var body = jsonDecode(response.body);
      logger.d(body);

      if (response.statusCode == 200) {
        final String refreshToken = body['data']['refreshToken'];
        final String accessToken = body['data']['accessToken'];
        token.storeToken(accessToken: accessToken, refreshToken: refreshToken);
        return true;
      }

      token.deleteTokens();

      throw "Token refresh unsuccesfull";
    } catch (e) {
      rethrow;
    }
  }

  signOut() async {
    String? deviceId = await DeviceInfoService.getDeviceId();

    Uri url = Uri.parse("$host/sign-out");
    var payload = {"deviceId": deviceId};
    var headers = {"Content-Type": "application/json"};

    try {
      Response response = await post(
        url,
        body: jsonEncode(payload),
        headers: headers,
      );
      token.deleteTokens();
      var body = jsonDecode(response.body);
      logger.d(body);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
