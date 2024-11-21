import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tractian_interview/core/configuration/constants/api.dart';
import 'package:tractian_interview/core/data/repositories/company_repository_impl.dart';
import 'package:tractian_interview/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/features/asset/data/usecases/build_asset_trees_usecase.dart';
import 'package:tractian_interview/features/asset/data/usecases/remote_load_company_assets_usecase_impl.dart';
import 'package:tractian_interview/features/asset/data/usecases/remote_load_company_locations_usecase_impl.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_bloc.dart';
import 'package:tractian_interview/features/asset/presentation/ui/asset_page.dart';
import 'package:tractian_interview/features/home/data/usecases/remote_load_all_companies_unit_usecase_impl.dart';
import 'package:tractian_interview/features/home/presentation/presenter/home_page_bloc.dart';
import 'package:tractian_interview/features/home/presentation/ui/menu_page.dart';

class AppFactories {
  static Widget getHomePage() {
    final loadAllCompaniesUnit =
        RemoteLoadAllCompaniesUnitUseCaseImpl(_getCompanyUnitRepository());

    final homePageBloc = HomePageBloc(loadAllCompaniesUnit);

    return HomePage(homePageBloc);
  }

  static Widget getAssetPage(String companyId) {
    final loadCompanyLocationsUseCase =
        RemoteLoadCompanyLocationsUseCaseImpl(_getCompanyUnitRepository());

    final loadCompanyAssetsUseCase =
        RemoteLoadCompanyAssetsUseCaseImpl(_getCompanyUnitRepository());

    final buildAssetTrees = BuildAssetTreesUseCaseImpl();

    final assetPageBloc = AssetPageBloc(
      loadCompanyLocationsUseCase,
      loadCompanyAssetsUseCase,
      buildAssetTrees,
    );

    return AssetPage(companyId, assetPageBloc);
  }

  static CompanyUnitRepository _getCompanyUnitRepository() {
    return CompanyUnitRepositoryImpl(
      apiClient: Dio(Api.instance.options),
      apiPaths: Api.instance.paths.company,
    );
  }
}
