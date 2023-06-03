part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStart extends LoginEvent {
  final String email, password;
  final BuildContext context;

  const LoginStart(
      {required this.email, required this.password, required this.context});
}

class LogOutEvent extends LoginEvent {
  final BuildContext context;

  const LogOutEvent({required this.context});
}
