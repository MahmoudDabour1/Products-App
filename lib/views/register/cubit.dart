// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:products/core/dio_helper.dart';
// import 'package:products/core/helper_methods.dart';
// part 'states.dart';
//
// class RegisterCubit extends Cubit<RegisterStates> {
//   RegisterCubit() : super(RegisterInitialStates());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//
//   final nameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   final dioHelper = DioHelper();
//   File? myImage;
//
//   void selectImage({ImageSource? source}) {
//     ImagePicker.platform
//         .getImage(
//       source: source!,
//     )
//         .then((value) {
//       if (value != null) {
//         myImage = File(value.path);
//         print(value.path);
//         Navigator.pop(navigatorKey.currentContext!);
//         emit(RegisterChangeImageStates());
//       }
//     });
//   }
//
//
//   void register() async {
//     emit(RegisterLoadingStates());
//
//     final response = await dioHelper
//         .sendData(
//         endPoint: "intial/users/register",
//         data: FormData.fromMap({
//           "email": emailController.text,
//           "password": passwordController.text,
//           "phone": phoneController.text,
//           "image": myImage!=null?
//           MultipartFile.fromFileSync(myImage!.path,
//               filename: myImage!.path.split("/").last):null,
//           "name": nameController.text,
//         }));
//     if (response.isSuccess) {
//       emit(RegisterSuccessStates(msg: response.msg));
//     } else {
//       emit(RegisterFailedStates(msg: response.msg));
//     }
//   }
//   // void register() async {
//   //   emit(RegisterLoadingStates());
//   //   final response = await diohelper.sendData(
//   //     endPoint: "intial/users/register",
//   //     data: FormData.fromMap({
//   //       "email": emailController.text,
//   //       "password": passwordController.text,
//   //       "phone": phoneController.text,
//   //       "image": MultipartFile.fromFileSync(myImage!.path),
//   //       MultipartFile.fromFileSync(myImage!.path,
//   //           filename: myImage!.path.split("/").last):null,
//   //       "name": nameController.text,
//   //     }),
//   //   );
//   //   if (response.isSuccess) {
//   //     emit(RegisterSuccessStates(msg: response.msg));
//   //   } else {
//   //     emit(RegisterFailedStates(msg: response.msg));
//   //   }
//   // }
// }
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/dio_helper.dart';
import '../../core/helper_methods.dart';

part 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();

  File? myImage;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();



  void chooseMyImage({ImageSource? source}) {
    ImagePicker.platform
        .getImage(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        myImage = File(value.path);
        print(value.path);
        Navigator.pop(navigatorKey.currentContext!);
        emit(RegisterChangeImageStates());
      }
    });
  }


  void register() async {
    emit(RegisterLoadingStates());

    final response = await dioHelper.sendDataRegister(
        endPoint: "intial/users/register",
        data: FormData.fromMap({
          "email": emailController.text,
          "password": passwordController.text,
          "phone": phoneController.text,
          "image": myImage != null
              ? MultipartFile.fromFileSync(myImage!.path,
                  filename: myImage!.path.split("/").last)
              : null,
          "name": nameController.text,
        }));
    if (response.isSuccess) {
      emit(RegisterSuccessStates(msg: response.msg));
    } else {
      emit(RegisterFailedStates(msg: response.msg));
    }
  }
}
