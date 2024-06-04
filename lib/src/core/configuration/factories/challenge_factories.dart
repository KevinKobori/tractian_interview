import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tractian_interview/src/core/configuration/constants/api.dart';
import 'package:tractian_interview/src/core/data/repositories/company_repository_impl.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/src/features/asset/data/usecases/remote_load_company_assets_usecase_impl.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_bloc.dart';
import 'package:tractian_interview/src/features/asset/presentation/ui/asset_page.dart';
import 'package:tractian_interview/src/features/home/data/usecases/remote_load_all_companies_unit_usecase_impl.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_bloc.dart';
import 'package:tractian_interview/src/features/home/presentation/ui/menu_page.dart';

class ChallengeFactories {
  static Widget getHomePage() {
    final remoteLoadAllCompaniesUnit =
        RemoteLoadAllCompaniesUnitUseCaseImpl(_getCompanyUnitRepository());

    final homePageBloc = HomePageBloc(remoteLoadAllCompaniesUnit);

    return HomePage(homePageBloc);
  }

  static Widget getAssetPage(String companyId) {
    final remoteLoadCompanyAssetsUseCase =
        RemoteLoadCompanyAssetsUseCaseImpl(_getCompanyUnitRepository());

    final assetPageBloc = AssetPageBloc(remoteLoadCompanyAssetsUseCase);

    return AssetPage(companyId, assetPageBloc);
  }

  static CompanyUnitRepository _getCompanyUnitRepository() {
    return CompanyUnitRepositoryImpl(
      apiClient: Dio(Api.instance.options),
      apiPaths: Api.instance.paths.company,
    );
  }
}
