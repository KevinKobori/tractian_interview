import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/usecases/usecase.dart';

mixin RemoteLoadAllCompaniesUseCase
    implements UseCase<DomainFailure, List<CompanyModel>, void> {
  @override
  Future<Either<DomainFailure, List<CompanyModel>>> call(void _);
}
