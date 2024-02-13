import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:mock_project/data/entity/register_user_model.dart';
import 'package:mock_project/data/repository/app_repository_implementation.dart';
import 'package:mock_project/feature/main/base_vm.dart';

class AuthVM extends BaseController{

  AppRepositoryImplementation appRepositoryImplementation = AppRepositoryImplementation();
  RegisterUser? user;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isRegistered = false;


  @override
  FutureOr<void> init() {

  }

  Future<void>registerUser()async{
    isRegistered = false;
    String firstName = firstNameController.text.trim().toString();
    String lastName = lastNameController.text.trim().toString();
    String phoneNumber = phoneNumberController.text.trim().toString();
    String email = emailController.text.trim().toString();
    if(firstName.isNotEmpty && lastName.isNotEmpty && phoneNumber.isNotEmpty && email.isNotEmpty){
      user = await appRepositoryImplementation.registerUser(firstName: firstName, lastName: lastName, phoneNumber: "998$phoneNumber", email: email);
      if(user != null){
        isRegistered = true;
        log("Registered");
      }else{
        isRegistered = false;
        log("Error");
      }
    }else{
      isRegistered = false;
      log("Empty");
    }
    notifyListeners();
  }




}