import 'package:tractian_interview/core/configuration/constants/app_env_mode.dart';

class AppDotEnv {
  AppDotEnv._internal();

  static final AppDotEnv _instance = AppDotEnv._internal();

  static AppDotEnv get instance => _instance;

  static bool _hasInit = false;

  static Future<void> initialize() async {
    if (!_hasInit) {
      _hasInit = true;
      await _instance._initialize();
    }
  }

  late AppEnvMode _envMode;
  AppEnvMode get envMode => _envMode;

  late String _baseURL;
  String get baseURL => _baseURL;

  late String _appTitle;
  String get apiKey => _appTitle;

  late int _connectTimeout;
  int get connectTimeout => _connectTimeout;

  late int _receiveTimeout;
  int get receiveTimeout => _receiveTimeout;

  Future<void> _initialize() async {
    await _loadDotEnv();
  }

  Future<void> _loadDotEnv() async {
    _envMode =
        AppEnvMode.values.byName(const String.fromEnvironment('ENV_MODE'));
    _baseURL = const String.fromEnvironment('BASE_URL');
    _appTitle = const String.fromEnvironment('APP_TITLE');
    _connectTimeout =
        const int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 30000);
    _receiveTimeout =
        const int.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: 30000);
  }
}
