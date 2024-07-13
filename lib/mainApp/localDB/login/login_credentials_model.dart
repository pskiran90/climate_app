import 'package:hive/hive.dart';


part 'login_credentials_model.g.dart';

@HiveType(typeId: 0)
class LoginCredentialsModel {
  LoginCredentialsModel({
    this.email,
    this.password,  });

  @HiveField(0)
  String? email;

  @HiveField(1)
  String? password;

  factory LoginCredentialsModel.fromMap(Map<String, dynamic> data) {
    return LoginCredentialsModel(
      email: data['email'],
      password: data['password'],
    );
  }
}
