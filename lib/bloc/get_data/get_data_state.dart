// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_data_bloc.dart';

abstract class GetDataState extends Equatable {
  const GetDataState();

  @override
  List<Object> get props => [];
}

class GetDataInitial extends GetDataState {}

class GetLoadState extends GetDataState {}

class GetLoadedState extends GetDataState {
  final UsersModel usersModel;
  const GetLoadedState({
    required this.usersModel,
  });
}

class GetNoData extends GetDataState {}
