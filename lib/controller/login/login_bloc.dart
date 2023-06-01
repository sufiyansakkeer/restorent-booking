import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:restorant_booking/model/sign_in_request.dart';
import 'package:restorant_booking/repository/api_services.dart';
import 'package:restorant_booking/repository/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    ApiServices signIn = ApiServices();
    FlutterSecureStorage storage = const FlutterSecureStorage();
    Authentication auth = Authentication();

    on<LoginStart>((event, emit) async {
      SignInRequestModel signInRequest =
          SignInRequestModel(email: event.email, password: event.password);
      await signIn.signInRequest(signInRequest).then((value) {
        if (value != null) {
          storage.write(key: "access_token", value: value.access);
          emit(LoginSuccess(accessToken: value.access));
          auth.homeNavigation(event.context);
          // emit(LoginSuccess(accessToken: value.access));
        } else {
          emit(LoginLoad());
          log("no value found");
        }
      });
      auth.checkUser();
    });
    on<LogOutEvent>((event, emit) async {
      await auth.logOut(event.context);
      emit(LogOut());
    });
  }
  @override
  Future<void> close() {
    return super.close();
  }
}
