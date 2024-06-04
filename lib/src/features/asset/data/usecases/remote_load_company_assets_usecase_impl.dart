import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_assets_usecase.dart';

class RemoteLoadCompanyAssetsUseCaseImpl
    implements RemoteLoadCompanyAssetsUseCase {
  final CompanyUnitRepository companyUnitRepository;

  RemoteLoadCompanyAssetsUseCaseImpl(this.companyUnitRepository);

  @override
  Future<Either<DomainFailure, List<AssetModel>>> call(String companyId) async {
    final repositoryResult =
        await companyUnitRepository.getCompanyAssets(companyId);

    return repositoryResult;
  }
}
