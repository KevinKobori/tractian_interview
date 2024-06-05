import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/location_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/usecases/usecase.dart';

mixin RemoteLoadCompanyLocationsUseCase
    implements UseCase<DomainFailure, List<LocationModel>, String> {
  @override
  Future<Either<DomainFailure, List<LocationModel>>> call(String companyId);
}
