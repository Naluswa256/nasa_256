import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/logging/custom_logger.dart';

class LocalStorageService {
  final log = CustomLogger(className: 'Local Storage Service');
  static final SharedPreferences _preferences = locator<SharedPreferences>();

  ///
  /// List of const keys
  ///
  static const String _isFirstTimeKey = 'isFirstTime';
  static const String _uidKey = 'uid';
  static const String _tokenKey = 'token';
  static const String _autoPlay = 'autoPlay';
  static const String _muted = "muted";

  ///
  /// Setters and getters
  ///
  bool get isFirstTime => _getFromDisk(_isFirstTimeKey) ?? true;
  bool get isMuted => _getFromDisk(_muted) ?? false;
  bool get isAutoPlay => _getFromDisk(_autoPlay) ?? true;

  String? get uid => _getFromDisk(_uidKey);
  set uid(String? uid) => _saveToDisk(_uidKey, uid);

  String? get token => _getFromDisk(_tokenKey);
  set token(String? token) => _saveToDisk(_tokenKey, token);
  set isFirstTime(bool isFirstTime) =>
      _saveToDisk(_isFirstTimeKey, isFirstTime);
  set isMuted(bool value) => _saveToDisk(_muted, value);

  set isAutoPlay(bool value) => _saveToDisk(_autoPlay, value);

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    log.d('@_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T? content) {
    log.d('@_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }

    if (content == null) {
      _preferences.remove(key);
    }
  }
}
