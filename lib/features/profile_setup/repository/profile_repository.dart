import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:instagrambloc/core/const/host.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';

class ProfileRepository {
  cheackUserName(username) async {
    Uri url = Uri.parse("$host/check-username/$username");
    var headers = {'Authorization': 'Bearer ${token.accessToken}'};

    try {
      Response response = await get(url, headers: headers);
      var body = jsonDecode(response.body);
      logger.d(body);

      if (response.statusCode == 200) {
        return true;
      }
      throw "Username Available";
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  proccedButton({name, username, bio}) async {
    Uri url = Uri.parse("$host/registration");
    var payload = {"name": name, "userName": username, "bio": bio};
    var headers = {
      'Authorization': 'Bearer ${token.accessToken}',
      'Content-Type': 'application/json',
    };
    try {
      Response response = await patch(
        url,
        body: jsonEncode(payload),
        headers: headers,
      );

      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        logger.d(body);
        return true;
      }
      logger.d(body);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  uploadProfilePic(File file) async {
    final Uri url = Uri.parse("$host/uploadProfilePic");
    final request = MultipartRequest("POST", url)
      ..headers['Authorization'] = "Bearer ${token.accessToken}";
    request.files.add(await MultipartFile.fromPath("image", file.path));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        logger.d(responseBody);
        return true;
      }
      logger.d(responseBody);
      throw "Unable to upload image";
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
