import 'package:flutter/material.dart';

class AppBuilder extends StatelessWidget {
  final String appTitle;
  final Widget initialPage;

  const AppBuilder({
    required this.appTitle,
    required this.initialPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
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
