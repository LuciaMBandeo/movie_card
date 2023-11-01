import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/about_the_app_presentation_widgets/expandable_page_view.dart';

void main() {
  testWidgets(
      'ExpandablePageView widget test: It should show each of the pages for the reviews once at a time',
      (WidgetTester tester) async {
    final ExpandablePageView expandablePageView = ExpandablePageView(
      itemCount: 3,
      itemBuilder: (context, index) => Text('Item $index'),
    );
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: expandablePageView,
        ),
      ),
    );

    expect(find.byWidget(expandablePageView), findsOneWidget);
    expect(find.text("Item 0"), findsOneWidget);
    expect(find.text("Item 1"), findsNothing);
    expect(find.text("Item 2"), findsNothing);

    await tester.pumpAndSettle();
    await tester.fling(
      find.byType(ExpandablePageView),
      const Offset(-400, 0),
      double.infinity,
      initialOffset: const Offset(50, 0),
    );
    await tester.pumpAndSettle();

    expect(find.byWidget(expandablePageView), findsOneWidget);
    expect(find.text("Item 0"), findsNothing);
    expect(find.text("Item 1"), findsOneWidget);
    expect(find.text("Item 2"), findsNothing);

    await tester.pumpAndSettle();
    await tester.fling(
      find.byType(ExpandablePageView),
      const Offset(-800, 0),
      double.infinity,
      initialOffset: const Offset(50, 0),
    );
    await tester.pumpAndSettle();

    expect(find.byWidget(expandablePageView), findsOneWidget);
    expect(find.text("Item 0"), findsNothing);
    expect(find.text("Item 1"), findsNothing);
    expect(find.text("Item 2"), findsOneWidget);
  });
}
