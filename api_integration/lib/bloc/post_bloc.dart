import 'dart:async';

import 'package:api_integration/model/posts_model.dart';
import 'package:api_integration/persistance/api_provider.dart';
import 'package:api_integration/persistance/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class PostBloc {
  Stream<List<Posts>> get posts async* {
    yield await ApiProvider().fetchPosts();
  }
}
