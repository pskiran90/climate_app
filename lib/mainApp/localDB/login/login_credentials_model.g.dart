// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credentials_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginCredentialsModelAdapter extends TypeAdapter<LoginCredentialsModel> {
  @override
  final int typeId = 0;

  @override
  LoginCredentialsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginCredentialsModel(
      email: fields[0] as String?,
      password: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginCredentialsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginCredentialsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
