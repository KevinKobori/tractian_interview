import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';
import 'package:tractian_interview/src/design_system/organisms/challenge_app_bar.dart';

class MenuPageLoadedSuccessView extends StatelessWidget {
  final List<CompanyModel> companies;
  final void Function(String id) onPushToCompanyAssetsPage;

  const MenuPageLoadedSuccessView({
    required this.companies,
    required this.onPushToCompanyAssetsPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log(companies.toString());
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
              onPushToCompanyAssetsPage: onPushToCompanyAssetsPage,
              company: company,
            ),
          );
        },
      ),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    required this.onPushToCompanyAssetsPage,
    required this.company,
    super.key,
  });

  final void Function(String id) onPushToCompanyAssetsPage;
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPushToCompanyAssetsPage(company.id),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: ChallegeMetrics.tileHorizontalPadding,
            vertical: ChallegeMetrics.tileVerticalPadding),
        decoration: BoxDecoration(
          color: const Color(0xFF2188FF),
          borderRadius: BorderRadius.circular(ChallegeMetrics.tileRadius),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              height: ChallegeMetrics.tileIconSize,
              width: ChallegeMetrics.tileIconSize,
              'assets/icons/unit.svg',
            ),
            const Gap(16),
            Text(
              '${company.name} Unit',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
