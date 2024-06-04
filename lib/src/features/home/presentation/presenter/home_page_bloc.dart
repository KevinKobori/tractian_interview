import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/core/configuration/factories/challenge_factories.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/presentation/failures/domain_failure_to_ui_failure_extension.dart';
import 'package:tractian_interview/src/features/home/domain/usecases/remote_load_all_companies_unit_usecase.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_event.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_presenter.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState>
    implements HomePagePresenter {
  RemoteLoadAllCompaniesUnitUseCase remoteLoadAllCompaniesUnit;

  HomePageBloc(this.remoteLoadAllCompaniesUnit) : super(HomePageLoading()) {
    on<LoadAllCompaniesUnit>((event, emit) async {
      await onLoadAllCompaniesUnit(emit);
    });

    on<PushToCompanyAssetPage>((event, emit) async {
      await onPushToCompanyAssetPage(event);
    });
  }

  @override
  Future<void> onLoadAllCompaniesUnit(Emitter<HomePageState> emit) async {
    emit(HomePageLoading());

    final Either<DomainFailure, List<CompanyUnitModel>> usecaseResult =
        await remoteLoadAllCompaniesUnit.call(null);

    usecaseResult.fold(
        (domainFailure) => emit(HomePageLoadedFailure(domainFailure.toUI())),
        (companyUnitModelList) =>
            emit(HomePageLoadedSuccess(companyUnitModelList)));
  }

  @override
  Future<void> onPushToCompanyAssetPage(PushToCompanyAssetPage event) async {
    await Navigator.push(
      event.context,
      MaterialPageRoute(
          builder: (context) =>
              ChallengeFactories.getAssetPage(event.companyId)),
    );
  }
}
