import 'package:tractian_interview/src/features/asset/data/models/tree_node.dart';

abstract class AssetPageState {}

class AssetPageIdle extends AssetPageState {}

class AssetPageLoading extends AssetPageState {}

class AssetPageLoadedSuccess extends AssetPageState {
  List<TreeNode> trees;

  AssetPageLoadedSuccess(this.trees);
}

class AssetPageLoadedFailure extends AssetPageState {
  final String message;

  AssetPageLoadedFailure(this.message);
}
