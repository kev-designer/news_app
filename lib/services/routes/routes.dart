import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/services/routes/routes_name.dart';
import 'package:news_app/views/app_bar/all_appbar.dart';
import 'package:news_app/views/pages/apple_news/home_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final argument = settings.arguments;
    switch (settings.name) {

      //ALL APPBAR
      case RoutesName.allAppBar:
        return MaterialPageRoute(builder: (context) => const AllAppBar());

      //HOME  PAGE
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const AppleNewsPage());

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
