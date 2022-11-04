import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:makit_test_task/data/models/users_model_list.dart';

class UsersProvider {
  Future<UsersModelList> getCharactersList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return UsersModelList.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
