import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/data/models/company_model.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/core/domain/usecases/future_usecase.dart';

abstract interface class RemoteLoadAllCompaniesUnitUseCase
    implements FutureUseCase<DomainFailure, List<CompanyUnitModel>, void> {
  @override
  Future<Either<DomainFailure, List<CompanyUnitModel>>> call(void _);
}
