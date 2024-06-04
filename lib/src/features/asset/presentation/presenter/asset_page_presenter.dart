import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_event.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_state.dart';

abstract class AssetPagePresenter {
  Future<void> onLoadTree(LoadTree event, Emitter<AssetPageState> emit);
  void onSearchItem(SearchItem event, Emitter<AssetPageState> emit);
}
