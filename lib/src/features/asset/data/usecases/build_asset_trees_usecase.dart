import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/features/asset/data/managers/tree_manager.dart';
import 'package:tractian_interview/src/features/asset/data/models/tree_node.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/build_asset_trees_usecase.dart';

class BuildAssetTreesUseCaseImpl implements BuildAssetTreesUseCase {
  @override
  Either<DomainFailure, List<TreeNode>> call(
      AssetTreesParams assetTreesParams) {
    try {
      final branches =
          TreeManager.findBranches(assetTreesParams.data, assetTreesParams.ids);
      return Right(TreeManager.buildTrees(branches));
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }
}
