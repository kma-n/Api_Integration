import 'package:api_integration/model/posts_model.dart';
import 'package:api_integration/persistance/api_provider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<Posts>> fetchPosts() => apiProvider.fetchPosts();
}
