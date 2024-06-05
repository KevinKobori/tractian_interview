import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    required this.company,
    required this.onPushToAssetPage,
    super.key,
  });

  final CompanyUnitModel company;
  final void Function(String companyId) onPushToAssetPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPushToAssetPage(company.id),
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
              'images/icons/unit.svg',
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
