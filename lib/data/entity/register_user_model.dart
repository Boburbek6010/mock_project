import 'package:json_annotation/json_annotation.dart';
part 'register_user_model.g.dart';

@JsonSerializable()
class RegisterUser{
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final String email;

  RegisterUser({required this.firstname, required this.lastname, required this.phoneNumber, required this.email});

  factory RegisterUser.fromJson(Map<String, dynamic>json) => _$RegisterUserFromJson(json);

  Map<String, dynamic>toJson() => _$RegisterUserToJson(this);


}