import 'package:flutter/material.dart';
import 'package:tractian_interview/src/core/configuration/app_builder.dart';
import 'package:tractian_interview/src/core/configuration/constants/api.dart';
import 'package:tractian_interview/src/core/configuration/constants/dot_env.dart';
import 'package:tractian_interview/src/core/configuration/factories/app_factories.dart';

void main() async {
  await _startSingletons();

  runApp(
    AppBuilder(initialPage: AppFactories.getHomePage()),
  );
}

Future<void> _startSingletons() async {
  await DotEnv.initialize();
  await Api.initialize();
}
