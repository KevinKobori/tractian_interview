import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/usecases/future_usecase.dart';

mixin RemoteLoadAllCompaniesUnitUseCase
    implements FutureUseCase<DomainFailure, List<CompanyUnitModel>, void> {
  @override
  Future<Either<DomainFailure, List<CompanyUnitModel>>> call(void _);
}
