import 'package:dio/dio.dart';
import 'package:tractian_interview/core/configuration/constants/dot_env.dart';

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

  String companies() => '/companies';

  String locations(String companyId) => '/companies/$companyId/locations';

  String assets(String companyId) => '/companies/$companyId/assets';

  Future<void> _initialize() async {
    await _loadApiConfig();
  }

  Future<void> _loadApiConfig() async {
    _options = BaseOptions(
      baseUrl: DotEnv.instance.baseURL,
      connectTimeout: Duration(milliseconds: DotEnv.instance.connectTimeout),
      receiveTimeout: Duration(milliseconds: DotEnv.instance.connectTimeout),
    );
  }
}
