import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseController with ChangeNotifier{
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitDone = false;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitDone => _isInitDone;


  FutureOr<void> _initState;

  FutureOr<void> init();

  void _init()async{
    isLoading = true;
    _initState = init();
    await _initState;
    _isInitDone = true;
    isLoading = false;
  }

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  BaseController(){
    _init();
  }

  set isLoading(bool value){
    _isLoading = value;
    scheduleMicrotask(() {
      if(!_isDisposed) notifyListeners();
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

}