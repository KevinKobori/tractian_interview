import 'package:flutter/material.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';
import 'package:tractian_interview/src/features/home/presentation/ui/widgets/menu_list_tile.dart';

class HomePageLoadedSuccessView extends StatelessWidget {
  final List<CompanyUnitModel> companies;
  final void Function(String companyId) onPushToAssetPage;

  const HomePageLoadedSuccessView({
    required this.companies,
    required this.onPushToAssetPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChallengeAppBar(),
      body: ListView.builder(
        itemCount: companies.length,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        itemBuilder: (context, index) {
          final company = companies[index];

          return Padding(
            padding: const EdgeInsets.only(
                bottom: ChallegeMetrics.tileHorizontalPadding),
            child: MenuListTile(
              onPushToAssetPage: onPushToAssetPage,
              company: company,
            ),
          );
        },
      ),
    );
  }
}
