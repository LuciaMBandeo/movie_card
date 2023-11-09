import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/dependency_handler.dart';
import 'config/router/movie_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyHandler dependencyHandler = DependencyHandler();
  await dependencyHandler.initialize();

  runApp(
    Provider(
      create: (BuildContext context) => dependencyHandler,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MovieRouter.routes(),
    );
  }
}
