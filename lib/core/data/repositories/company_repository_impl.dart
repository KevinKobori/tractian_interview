import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tractian_interview/core/configuration/constants/api.dart';
import 'package:tractian_interview/core/data/models/asset_model.dart';
import 'package:tractian_interview/core/data/models/company_model.dart';
import 'package:tractian_interview/core/data/models/location_model.dart';
import 'package:tractian_interview/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/core/domain/repositories/company_repository.dart';

class CompanyUnitRepositoryImpl implements CompanyUnitRepository {
  final Dio apiClient;
  final ApiCompanyPaths apiPaths;

  CompanyUnitRepositoryImpl({
    required this.apiClient,
    required this.apiPaths,
  });

  @override
  Future<Either<DomainFailure, List<CompanyUnitModel>>>
      getAllCompanies() async {
    try {
      final response =
          await apiClient.get<List<dynamic>>(apiPaths.getCompanies());
      return Right(
          response.data!.map((e) => CompanyUnitModel.fromJson(e)).toList());
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }

  @override
  Future<Either<DomainFailure, List<LocationModel>>> getCompanyLocations(
      String companyId) async {
    try {
      final response = await apiClient
          .get<List<dynamic>>(apiPaths.getCompanyLocations(companyId));
      return Right(
          response.data!.map((e) => LocationModel.fromJson(e)).toList());
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }

  @override
  Future<Either<DomainFailure, List<AssetModel>>> getCompanyAssets(
      String companyId) async {
    try {
      final response = await apiClient
          .get<List<dynamic>>(apiPaths.getCompanyAssets(companyId));
      return Right(response.data!.map((e) => AssetModel.fromJson(e)).toList());
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }
}
