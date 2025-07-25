part of 'loginb_cubit.dart';

@immutable
abstract class LoginbState {}

class LoginbInitial extends LoginbState {}

class LoginLoading extends LoginbState {}

class LoginSuccess extends LoginbState {}

class LoginFailure extends LoginbState {
  final String error;

  LoginFailure({required this.error});
}
