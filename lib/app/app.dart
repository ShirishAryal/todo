import 'package:flutter/material.dart';

import 'themes/app_theme.dart';
import 'router/router.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  static final AppRouter _appRouter = AppRouter();
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: "/",
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}
