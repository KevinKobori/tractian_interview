import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';

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
      appBar: AppBar(title: const Text('TRACTIAN')),
      body: ListView(),
    );
  }
}
