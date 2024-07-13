import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../constants/app_constants.dart';
import 'login_credentials_model.dart';

class LoginCredentialsBox {
  static const String hiveBoxKey = AppConstants.hiveBoxKey;
  static const String loginCredentialsBoxKey = AppConstants.credentialsBoxKey;
  static late Box<LoginCredentialsModel> _loginCredentialsBox;

  // Ensure box is opened only once
  static Future<void> init() async {
    _loginCredentialsBox = await Hive.openBox<LoginCredentialsModel>(hiveBoxKey);
  }

  // Private constructor
  LoginCredentialsBox._();

  static final LoginCredentialsBox _singleton = LoginCredentialsBox._();

  factory LoginCredentialsBox() => _singleton;

  static LoginCredentialsBox get loginCredentialsBox => _singleton;

  set saveLoginCredentials(LoginCredentialsModel value) {
    _loginCredentialsBox.put(loginCredentialsBoxKey, value).catchError(
      (error, stack) {
        if (kDebugMode) debugPrint("Hive credentials saving error >>, $error  $stack");
      },
    );
  }

  LoginCredentialsModel? get fetchLoginCredentials {
    try {
      return _loginCredentialsBox.get(loginCredentialsBoxKey);
    } catch (e) {
      if (kDebugMode) debugPrint("Hive credentials fetching error >> >>, $e");
      return null;
    }
  }
}
