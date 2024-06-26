import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/usecases/future_usecase.dart';

mixin RemoteLoadCompanyAssetsUseCase
    implements FutureUseCase<DomainFailure, List<AssetModel>, String> {
  @override
  Future<Either<DomainFailure, List<AssetModel>>> call(String companyId);
}
