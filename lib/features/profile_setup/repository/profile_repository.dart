import 'package:http/http.dart';
import 'package:instagrambloc/core/consts/host.dart';
import 'package:instagrambloc/core/services/token_service/token_service.dart';

class ProfileRepository {
  TokenService token;

  ProfileRepository(this.token);

  checkUsername(username) async {
    Uri url = Uri.parse("$host/check-username/$username");
    var headers = {'Authorization': 'Bearer ${token.accessToken}'};

    try {
      Response response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        return true;
      }

      throw "username alredy exists";
    } catch (e) {
      rethrow;
    }
  }
}
