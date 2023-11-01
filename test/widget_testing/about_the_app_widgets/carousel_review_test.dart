import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/about_the_app_presentation_widgets/carousel_review.dart';
import 'package:movie_card/presentation/widgets/about_the_app_presentation_widgets/expandable_page_view.dart';

void main() {
  testWidgets(
    'Carousel review test: It must show the number and the body of each advantage',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CarouselReview(),
        ),
      );

      expect(find.byType(ExpandablePageView), findsOneWidget);

      final Container carouselContainer =
          tester.firstWidget(find.byType(Container));

      const double borderWidthContainer = 5.0;
      final boxDecoration = BoxDecoration(
        border: Border.all(
          color: const Color(0xFFFF6A6A),
          width: borderWidthContainer,
        ),
        borderRadius: BorderRadius.circular(borderWidthContainer),
      );

      expect(carouselContainer.decoration,boxDecoration);
    },
  );
}
