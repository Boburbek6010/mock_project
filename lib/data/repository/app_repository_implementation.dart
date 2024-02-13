import 'dart:convert';

import 'package:mock_project/core/services/network_service.dart';
import 'package:mock_project/data/entity/register_user_model.dart';
import 'package:mock_project/data/repository/app_repository.dart';

class AppRepositoryImplementation implements AppRepository{
  @override
  Future<RegisterUser?> registerUser({required String firstName, required String lastName, required String phoneNumber, required String email}) async {
    String? str = await NetworkService.POST(NetworkService.apiRegisterUser, NetworkService.bodyRegisterUser(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
    ));
    if(str != null){
      RegisterUser user = RegisterUser.fromJson(jsonDecode(str));
      return user;
    }else{
      return null;
    }
  }


}