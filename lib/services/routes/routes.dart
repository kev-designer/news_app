import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/services/routes/routes_name.dart';
import 'package:news_app/views/article_page.dart';
import 'package:news_app/views/home_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final argument = settings.arguments;
    switch (settings.name) {

      //HOME  PAGE
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());

  // //ARTICLE DETAILS  PAGE
  //     case RoutesName.article:
  //       return MaterialPageRoute(builder: (context) =>  ArticlePage(articles: articles));

      //DEFAULT
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text(
                  "No Route Present",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
    }
  }
}
