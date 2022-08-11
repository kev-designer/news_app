import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/colors.dart';
import 'package:news_app/widgets/const.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:velocity_x/velocity_x.dart';

//BACK ARROW ICON
AppBar buildAppBar(String appbarTitle, BuildContext context) {
  return AppBar(
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
    title: Text(
      appbarTitle,
      style: GoogleFonts.nunito(
        color: ColorData.black,
      ),
    )
        .text
        .xl2
        .semiBold
        .maxLines(1)
        .softWrap(true)
        .overflow(TextOverflow.ellipsis)
        .make(),
  );
}

//MAIN APP BAR
AppBar buildMainAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorData.white,
    title: HStack(
      [
        Text(
          "News",
          style: GoogleFonts.nunito(color: ColorData.primary),
        ).text.xl2.semiBold.make(),
        Text(
          "App",
          style: GoogleFonts.nunito(color: ColorData.secondary),
        ).text.xl2.semiBold.make(),
      ],
    ),
  );
}

//ALL APP BAR PAGES
AppBar buildAllNewsAppBar(BuildContext context) {
  return AppBar(
    title: HStack(
      [
        Text(
          "News",
          style: GoogleFonts.nunito(color: ColorData.primary),
        ).text.xl2.semiBold.make(),
        Text(
          "App",
          style: GoogleFonts.nunito(color: ColorData.secondary),
        ).text.xl2.semiBold.make(),
      ],
    ),
    elevation: 0,
    backgroundColor: ColorData.white,
    bottom: TabBar(
      isScrollable: true,
      labelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
      ),
      labelColor: ColorData.primary,
      unselectedLabelColor: ColorData.grey,
      indicator: MaterialIndicator(
        horizontalPadding: 16,
        topLeftRadius: 10,
        topRightRadius: 10,
        color: ColorData.primary,
      ),
      tabs: [
        Tab(
          child: Text(
            "Apple News",
            style: GoogleFonts.nunito(),
          ).text.lg.make(),
        ),
        Tab(
          child: Text(
            "Tesla News",
            style: GoogleFonts.nunito(),
          ).text.lg.make(),
        ),
        Tab(
          child: Text(
            "Top Headlines",
            style: GoogleFonts.nunito(),
          ).text.lg.make(),
        ),
        Tab(
          child: Text(
            "TechCrunch",
            style: GoogleFonts.nunito(),
          ).text.lg.make(),
        ),
        Tab(
          child: Text(
            "Wall Street Journal",
            style: GoogleFonts.nunito(),
          ).text.lg.make(),
        ),
      ],
    ),
  );
}
