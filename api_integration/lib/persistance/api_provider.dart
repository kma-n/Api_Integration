import 'dart:convert' as convert;

import 'package:api_integration/model/posts_model.dart';
import 'package:api_integration/model/title_post_model.dart';
import 'package:http/http.dart' show Client;
import 'package:rxdart/rxdart.dart';

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

  Future<Title> postPosts(_title) async {
    final response = await http.post(Uri.parse(_baseUrl), body: {
      "userId": "1",
      "id": "1",
      "title": _title,
      "body": "hi! Just checking"
    });
    if (response.statusCode == 201) {
      Title posts;
      dynamic data;
      print(response.body);
      data = convert.jsonDecode(response.body);
      posts = Title.fromJson(data);
      //posts = data.map((e) => Posts.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception(response.body);
    }
  }
}
