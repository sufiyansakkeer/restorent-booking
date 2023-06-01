import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:restorant_booking/controller/staff_bottom_navigation/staff_bottom_navigation_bloc.dart';
import 'package:restorant_booking/view/splash_screen.dart';

import 'controller/login/login_bloc.dart';
import 'controller/splash_screen/splash_screen_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => StaffBottomNavigationBloc(),
          ),
          BlocProvider(
            create: (context) => SplashScreenBloc(),
          ),
        ],
        child: OverlaySupport.global(
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          ),
        ));
  }
}
