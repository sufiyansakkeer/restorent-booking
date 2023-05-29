part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoad extends LoginState {}

class LoginSuccess extends LoginState {
  final String accessToken;

  const LoginSuccess({required this.accessToken});
}
