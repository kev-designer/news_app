import 'package:flutter/material.dart';
import 'package:news_app/views/pages/apple_news/home_page.dart';
import 'package:news_app/views/pages/tech_crunch/home_page.dart';
import 'package:news_app/views/pages/tesla_news/home_page.dart';
import 'package:news_app/views/pages/top_headline/home_page.dart';
import 'package:news_app/views/pages/wall_street/home_page.dart';
import 'package:news_app/widgets/app_bar.dart';

class AllAppBar extends StatefulWidget {
  const AllAppBar({Key? key}) : super(key: key);

  @override
  _AllAppBarState createState() => _AllAppBarState();
}

class _AllAppBarState extends State<AllAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: buildAllNewsAppBar(context),
        body: const TabBarView(
          children: [
            AppleNewsPage(),
            TeslaNewsPage(),
            TopHeadlineNewsPage(),
            TechCrunchNewsPage(),
            WallStreetNewsPage(),
          ],
        ),
        // drawer: buildDrawer(context),
      ),
    );
  }
}
