import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:restorant_booking/repository/authentication.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    Authentication auth = Authentication();
    on<SplashCheck>((event, emit) {
      auth.checkAlreadySignIn(event.context);
    });
  }
}
