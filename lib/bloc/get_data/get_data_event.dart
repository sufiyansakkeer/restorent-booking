// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_data_bloc.dart';

abstract class GetDataEvent extends Equatable {
  const GetDataEvent();

  @override
  List<Object> get props => [];
}

class GetAllUsersData extends GetDataEvent {}

class PatchUserData extends GetDataEvent {
  final UsersModel usersModel;
  const PatchUserData({
    required this.usersModel,
  });
}
