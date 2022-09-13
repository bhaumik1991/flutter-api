import 'package:flutter_api/config/url_config.dart';
import 'package:flutter_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  Future<List<Posts>?> fetchPosts() async{
    var client = http.Client();

    var response = await client.get(Uri.parse(ApiUrl.baseUrl + SubUrl.postUrl));
    if(response.statusCode == 200){
      var json = response.body;
      return postsFromJson(json);
    }
  }
}