
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restorant_booking/controller/login/login_bloc.dart';
import 'package:restorant_booking/core/constants.dart';

import 'bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            height20,
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            height20,
            FilledButton(
              onPressed: () async {
                BlocProvider.of<LoginBloc>(context).add(LoginStart(
                    email: _emailController.text,
                    password: _passwordController.text));
                if (BlocProvider.of<LoginBloc>(context).state is LoginSuccess) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => StaffBottomNavigation(),
                  ));
                }
              },
              child: const Text(
                "Sign In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
