part of 'cubit.dart';

class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginFailedStates extends LoginStates {
  final String msg;

  LoginFailedStates({required this.msg});
}

class LoginSuccessStates extends LoginStates {
  final String msg;

  LoginSuccessStates({required this.msg});
}