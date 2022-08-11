import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ArticlePage extends StatefulWidget {
  String title;
  String urlToImage;
  String description;
  String content;
  ArticlePage(
      {required this.title,
      required this.urlToImage,
      required this.description,
      required this.content,
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
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: ColorData.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorData.primary,
          ),
        ),
        title: Text(widget.title,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                ))
            .text
            .xl2
            .semiBold
            .maxLines(1)
            .softWrap(true)
            .overflow(TextOverflow.ellipsis)
            .make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
              12.heightBox,
              Text(
                widget.title.toString(),
                style: GoogleFonts.nunito(
                  color: Colors.black,
                ),
              ).text.xl.semiBold.make(),
              20.heightBox,
              Text(
                widget.description,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  height: 1.5,
                  fontSize: 16,
                ),
              ).text.make(),
              12.heightBox,
              Text(
                widget.content,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.5,
                ),
              ).text.make(),
            ],
          ),
        ),
      ),
    );
  }
}
