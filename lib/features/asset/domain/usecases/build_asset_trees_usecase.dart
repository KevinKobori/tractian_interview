import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/core/domain/usecases/usecase.dart';
import 'package:tractian_interview/features/asset/data/models/asset_tree_node.dart';

abstract interface class BuildAssetTreesUseCase
    implements UseCase<DomainFailure, List<AssetTreeNode>, AssetTreesParams> {
  @override
  Either<DomainFailure, List<AssetTreeNode>> call(
      AssetTreesParams assetTreesParams);
}

class AssetTreesParams {
  final List<dynamic> data;
  final List<String> ids;

  const AssetTreesParams({
    required this.data,
    required this.ids,
  });
}
