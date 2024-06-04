import 'package:dartz/dartz.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/data/models/location_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';

mixin CompanyRepository {
  Future<Either<DomainFailure, List<CompanyModel>>> getAllCompanies();

  Future<Either<DomainFailure, List<LocationModel>>> getCompanyLocations(
      String companyId);

  Future<Either<DomainFailure, List<AssetModel>>> getCompanyAssets(
      String companyId);
}
