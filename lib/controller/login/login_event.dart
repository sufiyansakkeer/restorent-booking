part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStart extends LoginEvent {
  final String email, password;

  const LoginStart({required this.email, required this.password});
}
