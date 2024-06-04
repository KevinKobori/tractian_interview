import 'package:flutter/material.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';

class MenuPageLoadingView extends StatelessWidget {
  const MenuPageLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChallengeAppBar(),
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
