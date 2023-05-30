import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:restorant_booking/core/strings.dart';
import 'package:restorant_booking/model/resorts_list_model.dart';
import 'package:restorant_booking/repository/authentication.dart';

part 'staff_bottom_navigation_event.dart';
part 'staff_bottom_navigation_state.dart';

class StaffBottomNavigationBloc
    extends Bloc<StaffBottomNavigationEvent, StaffBottomNavigationState> {
  StaffBottomNavigationBloc() : super(StaffBottomNavigationInitial()) {
    Dio dio = Dio();
    Authentication auth = Authentication();
    on<GetAllStaffRestorant>((event, emit) async {
      final userId = await auth.userId();
      String resortListPath = "$baseUrl$staffRestorant$userId";

      try {
        Response response = await dio.get(resortListPath);
        // ResortsListModal.fromJson(response.data.)
        if (response.statusCode == 200 || response.statusCode == 201) {
          // log(response.data.toString());
          log(response.data.toString(), name: "response data");
          List<dynamic> resortLists = response.data;
          List resortList =
              resortLists.map((resort) => resort["resort_name"]).toList();
          List price = resortLists.map((e) => e["price"]).toList();
          List imageOne = resortLists.map((e) => e["image_one"]).toList();
          List imageTwo = resortLists.map((e) => e["image_two"]).toList();
          List imageThree = resortLists.map((e) => e["image_three"]).toList();
          List imageFour = resortLists.map((e) => e["image_four"]).toList();
          emit(
            ResortListState(
              resortsName: resortList,
              price: price,
              imageFour: imageFour,
              imageOne: imageOne,
              imageThree: imageThree,
              imageTwo: imageTwo,
            ),
          );
          log(resortList.toString(), name: "resort length");
          // emit(StaffRestorantList(restorant: ));
        }
      } on DioError catch (e) {
        log(e.message.toString(), name: "catch error");
      }
    });
  }
}
