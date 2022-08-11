import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/app_bar.dart';
import 'package:news_app/widgets/buttons.dart';
import 'package:news_app/widgets/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ArticlePage extends StatefulWidget {
  String title;
  String urlToImage;
  String description;
  String content;
  String publishedAt;
  String author;
  ArticlePage(
      {required this.title,
      required this.urlToImage,
      required this.description,
      required this.content,
      required this.author,
      required this.publishedAt,
      Key? key})
      : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Articles articles = Articles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.title, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //IMAGE
              Container(
                height: 205,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: ColorData.primary,
                  image: DecorationImage(
                    image: NetworkImage(widget.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              20.heightBox,

              //TITLE
              Text(
                widget.title.toString(),
                style: GoogleFonts.nunito(
                  color: ColorData.black,
                ),
              ).text.xl.semiBold.make(),
              20.heightBox,

              //DES
              Text(
                widget.description,
                style: GoogleFonts.nunito(
                  color: ColorData.black,
                  height: 1.5,
                  fontSize: 16,
                ),
              ).text.make(),
              12.heightBox,

              //DES
              Text(
                widget.content,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: ColorData.black,
                  height: 1.5,
                ),
              ).text.make(),
              20.heightBox,

              //AUTHOR
              Text(
                widget.author.toString(),
                style: GoogleFonts.nunito(
                  color: ColorData.primary,
                ),
              ).text.xl.semiBold.make(),
              8.heightBox,
              //DATE
              Text(
                widget.publishedAt.toString(),
                style: GoogleFonts.nunito(
                  color: ColorData.black,
                ),
              ).text.lg.medium.make(),

              40.heightBox,

              FilledButton(
                  textName: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonColor: ColorData.primary)
            ],
          ),
        ),
      ),
    );
  }
}
