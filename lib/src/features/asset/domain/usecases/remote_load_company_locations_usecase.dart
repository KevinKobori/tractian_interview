import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/data/models/location_model.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/core/domain/usecases/future_usecase.dart';

mixin RemoteLoadCompanyLocationsUseCase
    implements FutureUseCase<DomainFailure, List<LocationModel>, String> {
  @override
  Future<Either<DomainFailure, List<LocationModel>>> call(String companyId);
}
