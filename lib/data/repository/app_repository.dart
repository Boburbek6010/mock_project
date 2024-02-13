import '../entity/register_user_model.dart';

abstract class AppRepository{

  Future<RegisterUser?>registerUser({required String firstName, required String lastName, required String phoneNumber, required String email});

}