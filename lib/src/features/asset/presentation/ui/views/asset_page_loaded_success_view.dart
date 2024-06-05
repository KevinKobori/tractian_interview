import 'package:flutter/material.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';

class AssetPageLoadedSuccessView extends StatelessWidget {
  final List<AssetModel> assets;
  final void Function(String value) onSearch;

  const AssetPageLoadedSuccessView({
    required this.assets,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChallengeAppBar(pageTitle: 'Asset'),
      body: Placeholder(),
    );
  }
}
