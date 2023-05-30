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

        if (response.statusCode == 200 || response.statusCode == 201) {
          // log(response.data.toString());
          log(response.data.toString(), name: "response data");
          List<dynamic> resortLists = response.data;

          List<ResortsListModal> resortList = [];

          for (var element in resortLists) {
            final resort = ResortsListModal.fromJson(element);
            resortList.add(resort);
          }
          // List resortsList = resortLists.map((e) => e).toList();
          emit(
            ResortListState(
              resortList: resortList,
            ),
          );
          // log(resortList.toString(), name: "resort length");
          // emit(StaffRestorantList(restorant: ));
        }
      } on DioError catch (e) {
        log(e.message.toString(), name: "catch error");
      }
    });
  }
}
