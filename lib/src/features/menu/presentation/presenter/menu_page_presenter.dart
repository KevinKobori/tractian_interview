import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_event.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_state.dart';

abstract class MenuPagePresenter {
  Future<void> onLoadAllCompanies(Emitter<MenuPageState> emit);
  void onPushToCompanyAssetsPage(PushToCompanyAssetsPage event);
}
