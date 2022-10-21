import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/Dio_helper.dart';
part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  final dioHelper = DioHelper();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingStates());
    final response = await dioHelper.sendData(
        endPoint: "intial/users/login",
        data: FormData.fromMap({
          "email": emailController.text,
          "password": passwordController.text,
        }));
    if (response.isSuccess) {
      emit(LoginSuccessStates(msg: response.msg));
    } else {
      emit(LoginFailedStates(msg: response.msg));
    }
  }
}
