// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) => RegisterUser(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
