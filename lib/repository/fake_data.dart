import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:restorant_booking/core/strings.dart';
import 'package:restorant_booking/model/user_model.dart';

class Swagger {
  final Dio _dio = Dio();
  Future<UsersModel?> getAllUsers() async {
    String path = "$baseUrl2$getUser 5";
    Response response = await _dio.get(path);
    try {
      if (response.statusCode == 200) {
        log(response.data.toString(), name: "user Data");

        UsersModel users = UsersModel.fromJson(response.data);
        log(users.data.firstName, name: "user first name");
        return users;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<UsersModel?> patchFunction(UsersModel usersModel) async {
    String path = "${baseUrl2 + getUser}5";
    try {
      Response response = await _dio.patch(path, data: jsonEncode(usersModel));
      if (response.statusCode == 200) {
        UsersModel updatedModel = UsersModel.fromJson(response.data);
        return updatedModel;
      } else {
        showSimpleNotification(const Text("something wrong"));
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
