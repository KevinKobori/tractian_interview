import 'package:flutter/material.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';

class AssetPageLoadingView extends StatelessWidget {
  const AssetPageLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChallengeAppBar(pageTitle: 'Asset'),
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
