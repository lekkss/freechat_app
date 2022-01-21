import 'dart:convert';

import 'package:free_chat_app/data/cuber_api.dart';
import 'package:http/http.dart';

class CyberService {
  CyberService();

  Future<CyberApi> getPosts(String word) async {
    String uri = "https://cyberbullying-model-api.herokuapp.com/predict/$word";

    Response res = await get(Uri.parse(uri));

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      CyberApi post = CyberApi.fromJson(body);
      return post;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
