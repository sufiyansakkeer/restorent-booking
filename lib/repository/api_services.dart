import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:restorant_booking/core/strings.dart';
import 'package:restorant_booking/model/response_model.dart';
import 'package:restorant_booking/model/sign_in_request.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<SignInResponseModel?> signInRequest(
      SignInRequestModel signInRequestModel) async {
    String path = baseUrl + login;
    try {
      Response response =
          await _dio.post(path, data: jsonEncode(signInRequestModel));
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final SignInResponseModel inResponseModel =
            SignInResponseModel.fromJson(response.data);
        return inResponseModel;
      }
      // if (response.data["message"] ==
      //     "The request returned an invalid status code of 401.") {
      //   showSimpleNotification(const Text("email and password doesn't match"));
      //   log(response.statusMessage.toString());
      // }
    } on DioError catch (e) {
      showSimpleNotification(const Text("email and password doesn't match"));
      log(e.message.toString(), name: "dio catch");
    }
    return null;
  }
}
