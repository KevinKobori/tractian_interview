import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian_interview/design_system/challenge_metrics.dart';

class ChallengeTextField extends StatelessWidget {
  const ChallengeTextField({
    required this.onSearchByName,
    super.key,
  });

  final void Function(String value) onSearchByName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/images/icons/search.svg',
            colorFilter: ColorFilter.mode(
              ChallegeMetrics.textFieldIconColor,
              BlendMode.srcIn,
            ),
            fit: BoxFit.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: ChallegeMetrics.textFieldFillColor,
          hintText: ChallegeMetrics.textFieldHintText,
          hintStyle: TextStyle(
            color: ChallegeMetrics.textFieldHintColor,
            fontWeight: FontWeight.w400,
            fontSize: ChallegeMetrics.textFieldHintFontSize,
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ChallegeMetrics.textFieldRadius),
            borderSide: BorderSide.none,
          ),
        ),
        onSubmitted: onSearchByName,
      ),
    );
  }
}
