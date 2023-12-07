import 'package:bharat_mandi_test/DataModel/posts_data_model.dart';
import 'package:bharat_mandi_test/Resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ListViewBloc {
  final _repository = Repository();

  final _postsDataFetcher = PublishSubject<PostsDataModel>();
  Stream<PostsDataModel> get postsData => _postsDataFetcher.stream;

  late PostsDataModel tempData;

  fetchPostsData() async {
    try {
      PostsDataModel data = await _repository.fetchPostsData();

      final ids = <int>{};

      data.posts?.retainWhere((x) => ids.add(x.id!));

      _postsDataFetcher.sink.add(data);
    } catch (e) {
      _postsDataFetcher.sink.addError(e);
    }
  }

  searchAndFilterByTitle(String searchText) {
    if (searchText.isEmpty) {
      _postsDataFetcher.sink.add(tempData);
    } else {
      late PostsDataModel searchResult;
      List<Post> resultPosts = [];
      for (Post postData in tempData.posts ?? []) {
        if (postData.title!.contains(searchText)) {
          resultPosts.add(postData);
        }
      }
      searchResult = PostsDataModel(
          posts: resultPosts,
          total: tempData.total,
          skip: tempData.skip,
          limit: tempData.limit);
      _postsDataFetcher.sink.add(searchResult);
    }
  }
}

final listViewBloc = ListViewBloc();
