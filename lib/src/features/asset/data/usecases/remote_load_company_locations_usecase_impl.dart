import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/location_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_locations_usecase.dart';

class RemoteLoadCompanyLocationsUseCaseImpl
    implements RemoteLoadCompanyLocationsUseCase {
  final CompanyUnitRepository repository;

  RemoteLoadCompanyLocationsUseCaseImpl(this.repository);

  @override
  Future<Either<DomainFailure, List<LocationModel>>> call(
      String companyId) async {
    final result = await repository.getCompanyLocations(companyId);

    return result;
  }
}
