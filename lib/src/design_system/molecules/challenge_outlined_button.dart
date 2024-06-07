import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian_interview/src/design_system/challenge_metrics.dart';

class ChallengeOutlinedButton extends StatelessWidget {
  final void Function() onPressed;
  final String iconName;
  final String label;

  const ChallengeOutlinedButton({
    required this.onPressed,
    required this.iconName,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: ChallegeMetrics.buttonFillColor,
          side: BorderSide(color: ChallegeMetrics.buttonBorderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ChallegeMetrics.buttonRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'images/icons/$iconName.svg',
              colorFilter: ColorFilter.mode(
                ChallegeMetrics.buttonTextColor,
                BlendMode.srcIn,
              ),
              height: ChallegeMetrics.nodeTileIndicatorSize,
              width: ChallegeMetrics.nodeTileIndicatorSize,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: ChallegeMetrics.buttonTextColor,
                fontWeight: FontWeight.w400,
                fontSize: ChallegeMetrics.buttonTextFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
