import 'package:flutter/material.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';

class MenuPageLoadedFailureView extends StatelessWidget {
  final String failureMessage;
  final void Function() onReload;

  const MenuPageLoadedFailureView({
    required this.failureMessage,
    required this.onReload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChallengeAppBar(),
      body: Center(child: Text(failureMessage)),
    );
  }
}
