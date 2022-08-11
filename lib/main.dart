import 'package:flutter/material.dart';
import 'package:news_app/services/routes/routes.dart';
import 'package:news_app/views/home_page.dart';
import 'package:news_app/widgets/colors.dart';

import 'services/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New App',
      theme: ThemeData(
        primaryColor: ColorData.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
      home: const HomePage(),
    );
  }
}
