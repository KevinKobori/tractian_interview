import 'package:dio/dio.dart';
import 'package:tractian_interview/src/core/configuration/constants/dot_env.dart';

class Api {
  Api._internal();

  static final Api _instance = Api._internal();

  static Api get instance => _instance;

  static bool _hasInit = false;

  static Future<void> initialize() async {
    if (!_hasInit) {
      _hasInit = true;
      await _instance._initialize();
    }
  }

  late BaseOptions _options;
  BaseOptions get options => _options;

  late ApiPaths _paths;
  ApiPaths get paths => _paths;

  Future<void> _initialize() async {
    await _loadApiConfig();
  }

  Future<void> _loadApiConfig() async {
    _options = BaseOptions(
      baseUrl: DotEnv.instance.baseURL,
      connectTimeout: Duration(milliseconds: DotEnv.instance.connectTimeout),
      receiveTimeout: Duration(milliseconds: DotEnv.instance.connectTimeout),
    );

    _paths = ApiPaths();
  }
}

class ApiPaths {
  ApiPaths() : _company = ApiCompanyPaths();

  final ApiCompanyPaths _company;
  ApiCompanyPaths get company => _company;
}

class ApiCompanyPaths {
  String getCompanies() => '/companies';

  String getCompanyLocations(String companyId) =>
      '/companies/$companyId/locations';

  String getCompanyAssets(String companyId) => '/companies/$companyId/assets';
}
