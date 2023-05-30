// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bottom_navigation_bloc.dart';

abstract class StaffBottomNavigationState extends Equatable {
  const StaffBottomNavigationState();

  @override
  List<Object> get props => [];
}

class StaffBottomNavigationInitial extends StaffBottomNavigationState {}

class StaffRestorantList extends StaffBottomNavigationState {
  final List<ResortsListModal> restorant;
  const StaffRestorantList({
    required this.restorant,
  });
}

class ResortListState extends StaffBottomNavigationState {
  final List resortsName;
  final List price;
  final List imageOne;
  final List imageTwo;
  final List imageThree;
  final List imageFour;
  const ResortListState({
    required this.resortsName,
    required this.price,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.imageFour,
  });
}
