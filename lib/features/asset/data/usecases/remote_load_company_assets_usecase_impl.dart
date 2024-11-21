import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/data/models/asset_model.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/features/asset/domain/usecases/remote_load_company_assets_usecase.dart';

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
