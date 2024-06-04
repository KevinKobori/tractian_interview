import 'package:tractian_interview/src/core/configuration/constants/env_mode.dart';

class DotEnv {
  DotEnv._internal();

  static final DotEnv _instance = DotEnv._internal();

  static DotEnv get instance => _instance;

  static bool _hasInit = false;

  static Future<void> initialize() async {
    if (!_hasInit) {
      _hasInit = true;
      await _instance._initialize();
    }
  }

  late EnvMode _envMode;
  EnvMode get envMode => _envMode;

  late String _baseURL;
  String get baseURL => _baseURL;

  late String _appTitle;
  String get appTitle => _appTitle;

  late int _connectTimeout;
  int get connectTimeout => _connectTimeout;

  late int _receiveTimeout;
  int get receiveTimeout => _receiveTimeout;

  Future<void> _initialize() async {
    await _loadDotEnv();
  }

  Future<void> _loadDotEnv() async {
    _envMode = EnvMode.values.byName(const String.fromEnvironment('ENV_MODE'));
    _baseURL = const String.fromEnvironment('BASE_URL');
    _appTitle = const String.fromEnvironment('APP_TITLE');
    _connectTimeout =
        const int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 30000);
    _receiveTimeout =
        const int.fromEnvironment('RECEIVE_TIMEOUT', defaultValue: 30000);
  }
}
