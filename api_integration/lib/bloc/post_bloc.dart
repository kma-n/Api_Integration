import 'package:api_integration/model/posts_model.dart';
import 'package:api_integration/persistance/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class PostBloc {
  Repository repo = Repository();
  final _posts = PublishSubject<Posts>();
  fetchPosts() async {
    Posts posts = await repo.fetchPosts();
    _posts.sink.add(posts);
  }

  dispose() {
    _posts.close();
  }
}

final postBloc = PostBloc();
