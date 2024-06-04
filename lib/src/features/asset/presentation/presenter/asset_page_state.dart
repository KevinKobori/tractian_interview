import 'package:tractian_interview/src/core/data/models/asset_model.dart';

abstract class AssetPageState {}

class AssetPageIdle extends AssetPageState {}

class AssetPageLoading extends AssetPageState {}

class AssetPageLoadedSuccess extends AssetPageState {
  final List<AssetModel> assets;

  AssetPageLoadedSuccess(this.assets);
}

class AssetPageLoadedFailure extends AssetPageState {
  final String message;

  AssetPageLoadedFailure(this.message);
}
