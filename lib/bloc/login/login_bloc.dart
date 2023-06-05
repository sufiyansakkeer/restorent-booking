import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:restorant_booking/model/sign_in_request.dart';
import 'package:restorant_booking/repository/api_services.dart';
import 'package:restorant_booking/repository/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    ApiServices signIn = ApiServices();

    Authentication auth = Authentication();

    on<LoginStart>((event, emit) async {
      emit(LoginLoad());
      SignInRequestModel signInRequest =
          SignInRequestModel(email: event.email, password: event.password);
      await signIn.signInRequest(signInRequest).then((value) {
        if (value != null) {
          emit(LoginSuccess(accessToken: value.access));
          auth.homeNavigation(event.context);
          // emit(LoginSuccess(accessToken: value.access));
        } else {
          emit(LoginError());
          log("no value found");
        }
      });
      emit(LoginInitial());
      auth.checkUser();
    });
    on<LogOutEvent>((event, emit) async {
      await auth.logOut(event.context);
      emit(LogOut());
    });
  }
  @override
  Future<void> close() {
    LoginBloc().close();
    return super.close();
  }
}
