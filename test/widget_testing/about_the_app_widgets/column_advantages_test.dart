import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/about_the_app_presentation_widgets/column_advantages.dart';
import 'package:movie_card/presentation/widgets/about_the_app_presentation_widgets/row_advantages.dart';

void main() {
  testWidgets(
    'Column advantages widget test: It must show the column with 5 advantages rows',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SingleChildScrollView(
            child: ColumnAdvantages(),
          ),
        ),
      );
      expect(find.byType(RowAdvantages), findsNWidgets(5));
    },
  );
}
