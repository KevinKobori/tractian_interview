import 'package:flutter/material.dart';
import 'package:tractian_interview/design_system/organisms/challenge_app_bar.dart';

class HomePageLoadingView extends StatelessWidget {
  const HomePageLoadingView({
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
