import 'package:flutter/material.dart';
import 'package:tractian_interview/core/configuration/constants/dot_env.dart';
import 'package:tractian_interview/main.dart';

class AppBuilder extends StatelessWidget {
  final String appTitle;
  const AppBuilder({
    required this.appTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: DotEnv.instance.appTitle),
    );
  }
}
