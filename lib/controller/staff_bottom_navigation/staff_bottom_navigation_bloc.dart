import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'staff_bottom_navigation_event.dart';
part 'staff_bottom_navigation_state.dart';

class StaffBottomNavigationBloc extends Bloc<StaffBottomNavigationEvent, StaffBottomNavigationState> {
  StaffBottomNavigationBloc() : super(StaffBottomNavigationInitial()) {
    on<StaffBottomNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
