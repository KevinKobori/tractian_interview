import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/usecases/usecase.dart';

mixin RemoteLoadCompanyAssetsUseCase
    implements UseCase<DomainFailure, List<AssetModel>, String> {
  @override
  Future<Either<DomainFailure, List<AssetModel>>> call(String companyId);
}
