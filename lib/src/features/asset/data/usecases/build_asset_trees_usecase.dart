import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/features/asset/data/managers/tree_manager.dart';
import 'package:tractian_interview/src/features/asset/data/models/asset_tree_node.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/build_asset_trees_usecase.dart';

class BuildAssetTreesUseCaseImpl implements BuildAssetTreesUseCase {
  @override
  Either<DomainFailure, List<AssetTreeNode>> call(
      AssetTreesParams assetTreesParams) {
    try {
      final branches =
          TreeManager.findBranches(assetTreesParams.data, assetTreesParams.ids);
      final trees = TreeManager.buildTrees(branches);
      // trees.sort((a, b) {
      //   final int idA = int.tryParse(a.object.id) ?? 0;
      //   final int idB = int.tryParse(b.object.id) ?? 0;
      //   return idA.compareTo(idB);
      // });
      return Right(trees);
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }
}
