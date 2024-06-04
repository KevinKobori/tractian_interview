import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/presentation/failures/domain_failure_to_ui_failure_extension.dart';
import 'package:tractian_interview/src/features/menu/domain/usecases/remote_load_all_companies_usecase.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_event.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_presenter.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_state.dart';

class MenuPageBloc extends Bloc<MenuPageEvent, MenuPageState>
    implements MenuPagePresenter {
  RemoteLoadAllCompaniesUseCase remoteLoadAllCompanies;

  MenuPageBloc(this.remoteLoadAllCompanies) : super(MenuPageLoading()) {
    on<LoadAllCompanies>((event, emit) async {
      await onLoadAllCompanies(emit);
    });

    on<PushToCompanyAssetsPage>((event, emit) async {
      await onPushToCompanyAssetsPage(event);
    });
  }

  @override
  Future<void> onLoadAllCompanies(Emitter<MenuPageState> emit) async {
    emit(MenuPageLoading());

    final Either<DomainFailure, List<CompanyModel>> usecaseResult =
        await remoteLoadAllCompanies.call(null);

    usecaseResult.fold(
        (domainFailure) => emit(MenuPageLoadedFailure(domainFailure.toUI())),
        (companyModelList) => emit(MenuPageLoadedSuccess(companyModelList)));
  }

  @override
  Future<void> onPushToCompanyAssetsPage(PushToCompanyAssetsPage event) async {}
}
