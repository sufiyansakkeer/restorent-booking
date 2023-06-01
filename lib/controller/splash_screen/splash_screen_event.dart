part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];
}

class SplashCheck extends SplashScreenEvent {
  final BuildContext context;

  const SplashCheck({required this.context});
}
