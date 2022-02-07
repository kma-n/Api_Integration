import 'dart:convert' as convert;

import 'package:api_integration/model/posts_model.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client http = Client();

  final _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Posts>> fetchPosts() async {
    List<Posts> posts = [];
    List data;
    final response = await http.get(Uri.parse(_baseUrl));
    print(response.body);
    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
      posts = data.map((e) => Posts.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Error');
    }
  }
}
