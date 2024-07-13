import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../constants/app_constants.dart';
import 'login_credentials_model.dart';
import 'login_credentials_box.dart';

class AppHiveConfig {
  AppHiveConfig._();

  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(LoginCredentialsModelAdapter());
    await Hive.openBox<LoginCredentialsModel>(AppConstants.hiveBoxKey);
    await LoginCredentialsBox.init();
  }
}
