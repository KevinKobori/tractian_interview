import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tractian_interview/src/core/configuration/app_builder.dart';
import 'package:tractian_interview/src/core/configuration/constants/api.dart';
import 'package:tractian_interview/src/core/configuration/constants/dot_env.dart';
import 'package:tractian_interview/src/core/data/repositories/company_repository_impl.dart';
import 'package:tractian_interview/src/features/menu/data/usecases/remote_load_all_companies_usecase_impl.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_bloc.dart';
import 'package:tractian_interview/src/features/menu/presentation/ui/menu_page.dart';

Future<void> _startSingletons() async {
  await DotEnv.initialize();
  await Api.initialize();
}

void main() async {
  await _startSingletons();

  runApp(
    AppBuilder(
      appTitle: DotEnv.instance.appTitle,
      initialPage: MenuPage(
        pagePresenter: MenuPageBloc(
          RemoteLoadAllCompaniesUseCaseImpl(
            companyRepository: CompanyRepositoryImpl(
              apiClient: Dio(Api.instance.options),
              apiPaths: Api.instance.paths.company,
            ),
          ),
        ),
      ),
    ),
  );
}
