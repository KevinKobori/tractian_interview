import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/src/features/home/domain/usecases/remote_load_all_companies_unit_usecase.dart';

class RemoteLoadAllCompaniesUnitUseCaseImpl
    implements RemoteLoadAllCompaniesUnitUseCase {
  final CompanyUnitRepository companyUnitRepository;

  RemoteLoadAllCompaniesUnitUseCaseImpl(this.companyUnitRepository);

  @override
  Future<Either<DomainFailure, List<CompanyUnitModel>>> call(void _) async {
    final repositoryResult = await companyUnitRepository.getAllCompanies();

    return repositoryResult;
  }
}
