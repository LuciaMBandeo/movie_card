import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/drawer/home_drawer.dart';

void main() {
  testWidgets(
    'Drawer widget test: The drawer should show two tiles when opened: "Home" and "About the app"',
    (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(),
            drawer: const HomeDrawer(),
          ),
        ),
      );
      scaffoldKey.currentState?.openDrawer();
      await tester.pump();
      final drawer = find.byType((HomeDrawer));
      expect(drawer, findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About the app'), findsOneWidget);
    },
  );
}
