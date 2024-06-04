import 'dart:developer';

import 'package:flutter/widgets.dart';

class AppBlancBox extends StatelessWidget {
  final String? logMessage;
  const AppBlancBox({
    super.key,
    this.logMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (logMessage != null) {
      log(logMessage!);
    }
    return const SizedBox.shrink();
  }
}
