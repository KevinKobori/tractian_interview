import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';

class ChallengeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? pageTitle;
  const ChallengeAppBar({
    this.pageTitle,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: pageTitle != null
          ? Text(pageTitle!)
          : SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                ChallegeMetrics.logoColor,
                BlendMode.srcIn,
              ),
              height: ChallegeMetrics.tileIconSize,
              width: ChallegeMetrics.tileIconSize,
              'assets/images/logo.svg',
            ),
      centerTitle: true,
    );
  }
}
