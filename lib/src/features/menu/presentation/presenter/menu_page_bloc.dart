import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_event.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_presenter.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_state.dart';

class MenuPageBloc extends Bloc<MenuPageEvent, MenuPageState>
    implements MenuPagePresenter {
  MenuPageBloc() : super(MenuPageLoading()) {
    on<LoadAllCompanies>((event, emit) async {
      await onLoadAllCompanies(emit);
    });

    on<GoToCompanyAssetsPage>((event, emit) async {
      await onGoToCompanyAssetsPage(event);
    });
  }

  @override
  Future<void> onLoadAllCompanies(Emitter<MenuPageState> emit) async {
    emit(MenuPageLoading());
  }

  @override
  Future<void> onGoToCompanyAssetsPage(GoToCompanyAssetsPage event) async {}
}
