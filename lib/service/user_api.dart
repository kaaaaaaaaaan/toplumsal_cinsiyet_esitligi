import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:httppssss/model/user.dart';
import 'package:httppssss/model/user_name.dart';

List<User> users = [];

class UserApi {
  Future fetchUsers() async {
    final String url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    final body = response.body;
    final jsons = json.decode(body);
    final results = jsons["results"] as List<dynamic>;
    List<User> transformed = await results.map((user) {
      final UserName name = UserName(
          title: user["name"]["title"],
          first: user["name"]["first"],
          last: user["name"]["last"]);
      return User(
          name: name,
          email: user["email"],
          phone: user["phone"],
          cell: user["cell"],
          gender: user["gender"]);
    }).toList();
    if (response.statusCode == 200) {
      users = transformed;
    } else {
      print("API'den veri alınamadı. Hata kodu: ${response.statusCode}");
    }
  }
}
