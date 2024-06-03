import 'package:dio/dio.dart';
import 'package:tractian_interview/core/models/asset_model.dart';
import 'package:tractian_interview/core/models/company_model.dart';
import 'package:tractian_interview/core/models/location_model.dart';

class CompanyRepository {
  final Dio _dio;

  CompanyRepository(this._dio);

  Future<List<CompanyModel>> getAllCompanies() async {
    try {
      final response = await _dio.get<List<dynamic>>('/companies');
      return response.data!.map((e) => CompanyModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load companies: $e');
    }
  }

  Future<List<LocationModel>> getCompanyLocations(String companyId) async {
    try {
      final response =
          await _dio.get<List<dynamic>>('/companies/$companyId/locations');
      return response.data!.map((e) => LocationModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load locations for company $companyId: $e');
    }
  }

  Future<List<AssetModel>> getCompanyAssets(String companyId) async {
    try {
      final response =
          await _dio.get<List<dynamic>>('/companies/$companyId/assets');
      return response.data!.map((e) => AssetModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load assets for company $companyId: $e');
    }
  }
}
