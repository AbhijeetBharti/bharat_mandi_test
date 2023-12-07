import 'package:bharat_mandi_test/Constants/url.dart';
import 'package:bharat_mandi_test/DataModel/posts_data_model.dart';
import 'package:http/http.dart' as http;

class GetAPI {
  Future<PostsDataModel> getPostsData() async {
    late PostsDataModel data;
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        data = postsDataModelFromJson(response.body.toString());
        return data;
      } else {
        // If that call was not successful, throw an error.
        throw Exception(
            'Failed to load post. Status Code :${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
