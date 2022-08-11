import 'package:flutter/material.dart';
import 'package:news_app/views/pages/apple_news/home_page.dart';
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
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ),
        // drawer: buildDrawer(context),
      ),
    );
  }
}
