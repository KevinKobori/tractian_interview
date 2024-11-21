import 'package:dartz/dartz.dart';
import 'package:tractian_interview/core/data/models/asset_model.dart';
import 'package:tractian_interview/core/data/models/company_model.dart';
import 'package:tractian_interview/core/data/models/location_model.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';

mixin CompanyUnitRepository {
  Future<Either<DomainFailure, List<CompanyUnitModel>>> getAllCompanies();

  Future<Either<DomainFailure, List<LocationModel>>> getCompanyLocations(
      String companyId);

  Future<Either<DomainFailure, List<AssetModel>>> getCompanyAssets(
      String companyId);
}
