import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tractian_interview/src/core/configuration/constants/api.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/data/models/company_model.dart';
import 'package:tractian_interview/src/core/data/models/location_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/core/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final Dio apiClient;
  final ApiCompanyPaths apiPaths;

  CompanyRepositoryImpl({
    required this.apiClient,
    required this.apiPaths,
  });

  @override
  Future<Either<DomainFailure, List<CompanyModel>>> getAllCompanies() async {
    try {
      final response = await apiClient.get<List<dynamic>>(apiPaths.companies());
      return Right(
          response.data!.map((e) => CompanyModel.fromJson(e)).toList());
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }

  @override
  Future<Either<DomainFailure, List<LocationModel>>> getCompanyLocations(
      String companyId) async {
    try {
      final response = await apiClient
          .get<List<dynamic>>(apiPaths.companyLocations(companyId));
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
      final response =
          await apiClient.get<List<dynamic>>(apiPaths.companyAssets(companyId));
      return Right(response.data!.map((e) => AssetModel.fromJson(e)).toList());
    } catch (_) {
      return const Left(DomainFailure.unexpected());
    }
  }
}
