import 'dart:convert';

import 'package:api_integration/model/posts_model.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client http = Client();

  final _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<Posts> fetchPosts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    print(response.body);
    if (response.statusCode == 200) {
      return Posts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
