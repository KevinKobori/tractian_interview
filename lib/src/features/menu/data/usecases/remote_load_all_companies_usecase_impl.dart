import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/src/features/menu/domain/usecases/remote_load_all_companies_usecase.dart';

class RemoteLoadAllCompaniesUseCaseImpl
    implements RemoteLoadAllCompaniesUseCase {
  final CompanyRepository conmpanyRepository;

  RemoteLoadAllCompaniesUseCaseImpl({
    required this.conmpanyRepository,
  });

  @override
  Future<Either<DomainFailure, List<CompanyModel>>> call(void _) async {
    final repositoryResult = await conmpanyRepository.getAllCompanies();

    return repositoryResult;
  }
}
