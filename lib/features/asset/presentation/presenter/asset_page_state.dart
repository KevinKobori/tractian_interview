import 'package:tractian_interview/features/asset/data/models/asset_tree_node.dart';

abstract class AssetPageState {}

class AssetPageIdle extends AssetPageState {}

class AssetPageLoading extends AssetPageState {}

class AssetPageLoadedSuccess extends AssetPageState {
  List<AssetTreeNode> trees;

  AssetPageLoadedSuccess(this.trees);
}

class AssetPageLoadedFailure extends AssetPageState {
  final String message;

  AssetPageLoadedFailure(this.message);
}
