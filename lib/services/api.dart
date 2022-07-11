import 'package:http/http.dart' as http;
import 'package:pragma_demos_gitinfouser/utils/constants.dart';

class Api {
  Future<String> getUsers(http.Client client, String username) async {
    final response =
        await client.get(Uri.parse('$urlApi{$endPointUsers}?q=$username'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load Users');
    }
  }

  Future<String> getUser(http.Client client, String username) async {
    final response =
        await client.get(Uri.parse('$urlApi{$endPointUser}/$username'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load User');
    }
  }
}
