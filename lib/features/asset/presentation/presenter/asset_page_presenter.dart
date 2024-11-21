import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_event.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_state.dart';

abstract class AssetPagePresenter {
  Future<void> onLoadTree(LoadTree event, Emitter<AssetPageState> emit);
  void onSearchByName(SearchByName event, Emitter<AssetPageState> emit);
  void onSearchByEnergySensor(Emitter<AssetPageState> emit);
  void onSearchByAlertStatus(Emitter<AssetPageState> emit);
}
