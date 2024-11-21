import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/data/models/company_model.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/home/domain/usecases/remote_load_all_companies_unit_usecase.dart';

class RemoteLoadAllCompaniesUnitUseCaseImpl
    implements RemoteLoadAllCompaniesUnitUseCase {
  final CompanyUnitRepository repository;

  RemoteLoadAllCompaniesUnitUseCaseImpl(this.repository);

  @override
  Future<Either<DomainFailure, List<CompanyUnitModel>>> call(void _) async {
    final result = await repository.getAllCompanies();

    return result;
  }
}
