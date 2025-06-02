import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:instagrambloc/core/const/host.dart';
import 'package:instagrambloc/core/const/services/device_info/device_info_services.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';

class AuthRepository {
  // ___________________________________________________________________________________________________________________________________//

  Future<bool> signUp({email, password}) async {
    String? deviceId = await DeviceInfoServices.getDeviceId();
    log("device id$deviceId");
    Uri url = Uri.parse("$host/sign-up");
    var payload = {"email": password, "password": email, "deviceId": deviceId};
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
        var accessToken = body['data']['accessToken'];
        var refreshToken = body['data']['refreshToken'];
        token.storeToken(refreshToken: refreshToken, accessToken: accessToken);
        return true;
      } else if (response.statusCode == 409) {
        throw body['message'];
      }

      throw "Unble to signup";
    } catch (e) {
      rethrow;
    }
  }
  // ___________________________________________________________________________________________________________________________________//

  Future<bool> signIn({email, password}) async {
    String? deviceId = await DeviceInfoServices.getDeviceId();
    log("device id$deviceId");
    Uri url = Uri.parse("$host/sign-in");
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
        var accessToken = body['data']['accessToken'];
        var refreshToken = body['data']['refreshToken'];
        token.storeToken(refreshToken: refreshToken, accessToken: accessToken);
        return true;
      } else {
        throw body['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  // ___________________________________________________________________________________________________________________________________//

  refreshTokenService() async {
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
      token.deletToken();
      throw "Token refreshToken unsuccefull";
    } catch (e) {
      rethrow;
    }
  }

  // ___________________________________________________________________________________________________________________________________//

  signOut() async {
    String? deviceId = await DeviceInfoServices.getDeviceId();
    Uri url = Uri.parse("$host/sign-out");
    var payload = {"deviceId": deviceId};
    try {
      await post(url, body: payload);

      token.deletToken();
      log("User logout");

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
