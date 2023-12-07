import 'dart:async';

import 'package:bharat_mandi_test/DataModel/posts_data_model.dart';
import 'package:bharat_mandi_test/NetworkService/get_api_provider.dart';

class Repository {
  final postsDataApiProvider = GetAPI();

  Future<PostsDataModel> fetchPostsData() =>
      postsDataApiProvider.getPostsData();
}
