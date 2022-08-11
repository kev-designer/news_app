import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/app_url.dart';

//APPLE API SERVICES
class AppleApiServices {
  Future<ArticleModel> getAppleApi() async {
    final response = await http.get(
      Uri.parse(AppUrl.appleNewsApiUrl),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(data);
    } else {
      throw Exception("Fetching World API Error");
    }
  }
}

//TESLA API SERVICES
class TeslaApiServices {
  Future<ArticleModel> getTeslaApi() async {
    final response = await http.get(
      Uri.parse(AppUrl.teslaNewsApiUrl),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(data);
    } else {
      throw Exception("Fetching World API Error");
    }
  }
}

//TOP HEADLINE API SERVICES
class TopHeadlineApiServices {
  Future<ArticleModel> getTopHeadline() async {
    final response = await http.get(
      Uri.parse(AppUrl.topBusinessApiUrl),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(data);
    } else {
      throw Exception("Fetching World API Error");
    }
  }
}

//TECH CRUNCH API SERVICES
class TechCrunchApiServices {
  Future<ArticleModel> getTechCrunch() async {
    final response = await http.get(
      Uri.parse(AppUrl.techCrunchApiUrl),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(data);
    } else {
      throw Exception("Fetching World API Error");
    }
  }
}

//WALL STREET API SERVICES
class WallStreetApiServices {
  Future<ArticleModel> getWallStreetApi() async {
    final response = await http.get(
      Uri.parse(AppUrl.wallStreetApiUrl),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ArticleModel.fromJson(data);
    } else {
      throw Exception("Fetching World API Error");
    }
  }
}
