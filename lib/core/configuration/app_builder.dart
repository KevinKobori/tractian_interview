import 'package:flutter/material.dart';
import 'package:tractian_interview/core/configuration/constants/dot_env.dart';

class AppBuilder extends StatelessWidget {
  final Widget initialPage;

  const AppBuilder({
    required this.initialPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DotEnv.instance.appTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF17192D),
          foregroundColor: Colors.white,
        ),
      ),
      home: initialPage,
    );
  }
}
