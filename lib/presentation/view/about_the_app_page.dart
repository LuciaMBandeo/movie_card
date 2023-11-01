import 'package:flutter/material.dart';

import '../../core/utils/constants/strings.dart';
import '../widgets/about_the_app_presentation_widgets/carousel_review.dart';
import '../widgets/about_the_app_presentation_widgets/column_advantages.dart';
import '../widgets/common_widgets/text_info.dart';
import '../widgets/common_widgets/text_title.dart';
import '../widgets/drawer/home_drawer.dart';

class AboutTheAppPage extends StatelessWidget {
  const AboutTheAppPage({
    super.key,
  });

  static const String _appTitle = "Let's talk about TMDB";
  static const String _appDescription =
      "The Movie Database (TMDB) is a community built movie and TV database. Every piece of data has been added by their amazing community dating back to 2008. TMDB's strong international focus and breadth of data is largely unmatched and something they're incredibly proud of. Put simply, they live and breathe community and that's precisely what makes them different.";
  static const String _appSubtitle = "The TMDB advantage";
  static const String _scrollText =
      "Scroll to see some of The MovieDB's incredible reviews!";
  static const double _paddingTitle = 15.0;
  static const double _paddingInfo = 10.0;
  static const _fontSizeSubtitle = 22.0;
  static const _fontSizeIntroScrollable = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          Strings.appTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const HomeDrawer(),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: const Padding(
              padding: EdgeInsets.all(
                _paddingTitle,
              ),
              child: Center(
                child: TextTitle(
                  _appTitle,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(
              _paddingInfo,
            ),
            child: TextInfo(
              _appDescription,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(
              _paddingInfo,
            ),
            child: Text(
              _appSubtitle,
              style: TextStyle(
                fontSize: _fontSizeSubtitle,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ColumnAdvantages(),
          const Padding(
            padding: EdgeInsets.only(
              top: _paddingInfo,
            ),
            child: Text(
              _scrollText,
              style: TextStyle(
                fontSize: _fontSizeIntroScrollable,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CarouselReview(),
        ],
      ),
    );
  }
}
