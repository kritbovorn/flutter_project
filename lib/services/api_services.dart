import 'package:flutter_project/models/post.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Post>?> fetchedData(String url) async {
    var client = http.Client();
    var uri = Uri.parse(url);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}
