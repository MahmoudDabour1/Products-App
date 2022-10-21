part of 'cubit.dart';

class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterChangeImageStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterFailedStates extends RegisterStates {
  final String msg;

  RegisterFailedStates({required this.msg});
}

class RegisterSuccessStates extends RegisterStates {
  final String msg;

  RegisterSuccessStates({required this.msg});
}