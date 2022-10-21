part of 'cubit.dart';

class AddProductsStates {}

class AddProductsInitialStates extends AddProductsStates {}

class AddProductsLoadingStates extends AddProductsStates {}

class AddProductsChangeImageStates extends AddProductsStates {}

class AddProductsFailedStates extends AddProductsStates {
  final String msg;

  AddProductsFailedStates({required this.msg});
}

class AddProductsSuccessStates extends AddProductsStates {
  final String msg;

  AddProductsSuccessStates({required this.msg});
}
