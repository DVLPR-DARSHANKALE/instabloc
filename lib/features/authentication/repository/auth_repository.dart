import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagrambloc/core/consts/host.dart';
import 'package:instagrambloc/core/services/token_service/token_service.dart';
import 'package:logger/logger.dart';

class AuthRepository {
  final TokenService token;

  final Logger logger = Logger();

  AuthRepository(this.token);

  Future<bool> signUp({email, password}) async {
    Uri url = Uri.parse("$host/sign-up");
    var payload = {"email": email, "password": password, "deviceId": "2412311"};
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
    var payload = {
      "email": email,
      "password": password,
      "deviceId": "987654321",
    };
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
      throw e;
    }
  }
}
