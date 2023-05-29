import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Authentication {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  checkUser() async {
    String? token = await storage.read(key: "access_token");
    if (token != null) {
      log(token, name: "token");

      final decodedToken = _decodeToken(token);
      log(decodedToken["user_id"].toString());
    } else {
      log("token null");
    }
  }

  Map<String, dynamic> _decodeToken(String token) {
    final decodedToken = JwtDecoder.decode(token);
    log(decodedToken.toString(), name: "decoded");
    return decodedToken;
  }
}
