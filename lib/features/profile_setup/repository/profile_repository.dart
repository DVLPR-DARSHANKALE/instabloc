import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:instagrambloc/core/consts/host.dart';
import 'package:instagrambloc/core/services/token_service/token_service.dart';
import 'package:logger/logger.dart';

class ProfileRepository {
  TokenService token;

  Logger logger = Logger();

  ProfileRepository(this.token);

  checkUsername(username) async {
    Uri url = Uri.parse("$host/check-username/$username");
    var headers = {'Authorization': 'Bearer ${token.accessToken}'};

    try {
      Response response = await get(url, headers: headers);
      var body = jsonDecode(response.body);
      logger.d(body);

      if (response.statusCode == 200) {
        return true;
      }

      throw "username alredy exists";
    } catch (e) {
      rethrow;
    }
  }

  uploadProfilePic(File file) async {
    Uri url = Uri.parse("$host/uploadProfilePic");
    final request = MultipartRequest("POST", url)
      ..headers['Authorization'] = "Bearer ${token.accessToken!}";
    request.files.add(await MultipartFile.fromPath("image", file.path));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      logger.d(responseBody);
      if (response.statusCode == 201) {
        return true;
      }

      throw "Unable to upload an image";
    } catch (e) {
      rethrow;
    }
  }

  registerProfile({name, username, bio}) async {
    Uri url = Uri.parse("$host/registration");
    var payload = {"name": name, "userName": username, "bio": bio};

    logger.d(payload);
    var headers = {
      'Authorization': 'Bearer ${token.accessToken}',
      "Content-Type": "application/json",
    };

    try {
      final Response response = await patch(
        url,
        body: jsonEncode(payload),
        headers: headers,
      );

      var body = jsonDecode(response.body);

      logger.d(body);

      if (response.statusCode == 200) {
        return true;
      }

      throw body['message'] ?? "unable to register";
    } catch (e) {
      rethrow;
    }
  }
}
