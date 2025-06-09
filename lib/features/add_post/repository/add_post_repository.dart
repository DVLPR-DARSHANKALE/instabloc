import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:instagrambloc/core/const/host.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';

class AddPostRepository {
  uploadImages(File file) async {
    final Uri url = Uri.parse("$host/upload-images");
    final request = MultipartRequest("POST", url)
      ..headers['Authorization'] = "Bearer ${token.accessToken}";
    request.files.add(await MultipartFile.fromPath("images", file.path));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        logger.d(responseBody);
        return true;
      }
      throw "Unable upload image";
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
