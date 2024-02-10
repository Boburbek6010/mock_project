import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mock_project/feature/main/base_vm.dart';

class CounterVM extends ChangeNotifier{

  CounterVM(){
    log("CounterVM");
  }

  String countryCode = "uz";

  int counter = 0;

  void increment(){
    counter++;
    notifyListeners();
  }

  //
  // @override
  // FutureOr<void> init() {
  //
  // }

  void changeLanguage(BuildContext context, String lanCode){
    if(lanCode == "uz"){
      context.setLocale(Locale(lanCode, "UZ"));
      countryCode = "uz";
    }else if(lanCode == "ru"){
      context.setLocale(Locale(lanCode, "RU"));
      countryCode = "ru";
    }else{
      context.setLocale(Locale(lanCode, "US"));
      countryCode = "en";
    }
  }

}