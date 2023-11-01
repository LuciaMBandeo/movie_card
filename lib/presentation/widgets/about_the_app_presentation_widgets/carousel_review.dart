import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import 'expandable_page_view.dart';

class CarouselReview extends StatelessWidget {
  const CarouselReview({
    super.key,
  });

  static const String _plexReviewText =
      "The TMDB product, service, attitude and support are truly top notch. We love how they support their community and the passion with which they have built an amazing asset that our users can enjoy!";
  static const String _plexReviewNames =
      "Scott Olechowski, Chief Product Officer & Co-founder of Plex, Inc.";
  static const String _firecoreReviewText =
      "Our experience working with TMDB has been positively fantastic! The powerful API coupled with its excellent availability and uptime is simply a great combo. I can't imagine ever using anything else!";
  static const String _firecoreReviewNames =
      "James Abeler, Founder & Director of Firecore, LLC";
  static const String _letterBoxReviewText =
      "We love it. From day one we've found the API to be pragmatic, reliable, well structured and well documented. In any engineering project, it's immensely satisfying when you can just plug and play, and that's been the case all the way along. I can't recall a single outage in over five years of use, and we also enjoy having a voice when it comes to the design of new approaches.";
  static const String _letterBoxReviewNames =
      "Matthew Buchanan, Co-founder of Letterboxd";
  static const String _taphiveReviewText =
      "The API has been amazing and of course, we love the localization of data. It's awesome to be able to add and edit movie information on our own.";
  static const String _taphiveReviewNames =
      "Hosam Hassan, Co-founder of Taphive GmbH";
  static const int _redAccentColor = 0xFFFF6A6A;
  static const double _borderWidthContainer = 5.0;
  static const double _marginContainer = 10.0;
  static const double _paddingDivider = 8.0;
  static const double _thicknessDivider = 1.0;

  @override
  Widget build(BuildContext context) {
    final List<String> reviewText = [
      _plexReviewText,
      _firecoreReviewText,
      _letterBoxReviewText,
      _taphiveReviewText,
    ];

    final List<String> reviewNames = [
      _plexReviewNames,
      _firecoreReviewNames,
      _letterBoxReviewNames,
      _taphiveReviewNames,
    ];

    return ExpandablePageView(
      itemCount: reviewText.length,
      itemBuilder: (context, pagePosition) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(
                _redAccentColor,
              ),
              width: _borderWidthContainer,
            ),
            borderRadius: BorderRadius.circular(
              Dimens.borderRadiusDecoratedBox,
            ),
          ),
          margin: const EdgeInsets.all(
            _marginContainer,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  reviewText[pagePosition],
                  style: const TextStyle(
                    fontSize: Dimens.fontSizeTitle,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(
                  _paddingDivider,
                ),
                child: Divider(
                  thickness: _thicknessDivider,
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: Text(
                  reviewNames[pagePosition],
                  style: const TextStyle(
                    fontSize: Dimens.fontSizeTitle,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
