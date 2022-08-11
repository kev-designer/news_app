import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/views/pages/apple_news/article_page.dart';
import 'package:news_app/widgets/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class TechCrunchNewsPage extends StatefulWidget {
  const TechCrunchNewsPage({Key? key}) : super(key: key);

  @override
  State<TechCrunchNewsPage> createState() => _TechCrunchNewsPageState();
}

class _TechCrunchNewsPageState extends State<TechCrunchNewsPage>
    with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  TechCrunchApiServices techCrunchApiServices = TechCrunchApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ArticleModel>(
              future: techCrunchApiServices.getTechCrunch(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(20.0),
                    itemCount: snapshot.data?.articles?.length,
                    itemBuilder: (context, index) {
                      Articles? articles = snapshot.data?.articles?[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //IMAGE
                                      Container(
                                        height: 185,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          // color: ColorData.primary,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              articles?.urlToImage.toString() ??
                                                  "",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      12.heightBox,

                                      //HEADLINE
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //TITLE
                                          Expanded(
                                            child: Text(
                                              articles?.title?.toString() ?? "",
                                              style: GoogleFonts.nunito(
                                                color: Colors.black,
                                              ),
                                            )
                                                .text
                                                .xl
                                                .semiBold
                                                .overflow(TextOverflow.ellipsis)
                                                .softWrap(true)
                                                .maxLines(1)
                                                .make(),
                                          ),
                                        ],
                                      ),
                                      12.heightBox,

                                      //DES
                                      Text(
                                        articles?.description?.toString() ?? "",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          height: 1.5,
                                        ),
                                      )
                                          .text
                                          .sm
                                          .overflow(TextOverflow.ellipsis)
                                          .softWrap(true)
                                          .maxLines(5)
                                          .make(),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //AUTHOR
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorData.primary),
                                          color: ColorData.primary
                                              .withOpacity(.06),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          "By : ${articles?.author?.toString() ?? ""} ",
                                          style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            color: ColorData.primary,
                                            height: 1.5,
                                          ),
                                        )
                                            .text
                                            .overflow(TextOverflow.ellipsis)
                                            .maxLines(1)
                                            .sm
                                            .semiBold
                                            .make(),
                                      ),
                                    ),
                                    80.widthBox,
                                    //READ MORE
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ArticlePage(
                                                title: snapshot.data!
                                                    .articles![index].title
                                                    .toString(),
                                                urlToImage: snapshot.data!
                                                    .articles![index].urlToImage
                                                    .toString(),
                                                description: snapshot
                                                    .data!
                                                    .articles![index]
                                                    .description
                                                    .toString(),
                                                content: snapshot.data!
                                                    .articles![index].content
                                                    .toString(),
                                                publishedAt: snapshot
                                                    .data!
                                                    .articles![index]
                                                    .publishedAt
                                                    .toString(),
                                                author: snapshot.data!
                                                    .articles![index].author
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 32,
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          decoration: const BoxDecoration(
                                            color: ColorData.primary,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12),
                                              topLeft: Radius.circular(12),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Read More",
                                              style: GoogleFonts.nunito(
                                                fontSize: 16,
                                                color: ColorData.white,
                                                height: 1.5,
                                              ),
                                            ).text.sm.semiBold.make(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  );
                } else {
                  return SpinKitFadingCircle(
                    color: ColorData.primary,
                    controller: animationController,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
