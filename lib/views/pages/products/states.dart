part of 'cubit.dart';

class ProductsStates {}

class ProductsInitialStates extends ProductsStates {}

class ProductsLoadingStates extends ProductsStates {}

class ProductsFailedStates extends ProductsStates {
  final String msg;

  ProductsFailedStates({required this.msg});
}

class ProductsSuccessStates extends ProductsStates {
  final String msg;

  ProductsSuccessStates({required this.msg});
}