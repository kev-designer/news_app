import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/app_url.dart';

//NEWS SERVICES
class NewsServices {
  Future<ArticleModel> getArticleApi() async {
    final response = await http.get(
      Uri.parse(AppUrl.topHeadlineUrl),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(data);
    } else {
      throw Exception("Fetching World API Error");
    }
  }
}
