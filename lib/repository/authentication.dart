import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:restorant_booking/view/bottom_navigation.dart';
import 'package:restorant_booking/view/login_screen.dart';

class Authentication {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<Map<String, dynamic>?> checkUser() async {
    String? token = await storage.read(key: "access_token");
    if (token != null) {
      log(token, name: "token");

      final decodedToken = _decodeToken(token);
      log(decodedToken["user_id"].toString());
      return decodedToken;
    } else {
      log("token null");
    }
    return null;
  }

  Map<String, dynamic> _decodeToken(String token) {
    final decodedToken = JwtDecoder.decode(token);
    log(decodedToken.toString(), name: "decoded");
    return decodedToken;
  }

  Future<int> userId() async {
    final data = await checkUser();

    int userId = data!["user_id"];
    return userId;
  }

  Future checkAlreadySignIn(BuildContext context) async {
    String? token = await storage.read(key: "access_token");
    if (token == null) {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      }
    } else {
      if (context.mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => StaffBottomNavigation(),
        ));
      }
    }
  }
}
