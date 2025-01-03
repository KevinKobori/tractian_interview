import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/features/home/presentation/presenter/home_page_event.dart';
import 'package:tractian_interview/features/home/presentation/presenter/home_page_state.dart';

abstract class HomePagePresenter {
  Future<void> onLoadAllCompaniesUnit(Emitter<HomePageState> emit);
  void onPushToAssetPage(PushToAssetPage event);
}
