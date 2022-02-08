import 'package:api_integration/model/posts_model.dart';
import 'package:api_integration/persistance/api_provider.dart';

class PostBloc {
  Stream<List<Posts>> get posts async* {
    yield await ApiProvider().fetchPosts();
  }
}
