import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_assets_usecase.dart';

class RemoteLoadCompanyAssetsUseCaseImpl
    implements RemoteLoadCompanyAssetsUseCase {
  final CompanyUnitRepository repository;

  RemoteLoadCompanyAssetsUseCaseImpl(this.repository);

  @override
  Future<Either<DomainFailure, List<AssetModel>>> call(String companyId) async {
    final result = await repository.getCompanyAssets(companyId);

    return result;
  }
}
