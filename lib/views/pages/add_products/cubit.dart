import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products/core/Dio_helper.dart';

import '../../../core/helper_methods.dart';


part 'states.dart';

class AddProductsCubit extends Cubit<AddProductsStates> {
  AddProductsCubit() : super(AddProductsInitialStates());

  static AddProductsCubit get(context) => BlocProvider.of(context);

  final dioHelper = DioHelper();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? myImage;
  final formKey = GlobalKey<FormState>();

  void selectImage({ImageSource? source}) {
    ImagePicker.platform
        .getImage(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        myImage = File(value.path);
        print(value.path);
        Navigator.pop(navigatorKey.currentContext!);
        emit(AddProductsChangeImageStates());
      }
    });
  }

  void addProducts() async {
    emit(AddProductsLoadingStates());
    final response = await dioHelper.sendData(
      endPoint: "products",
      data: FormData.fromMap({
        "title": titleController.text,
        "price": priceController.text,
        "description": descriptionController.text,
        "image[]": myImage != null
            ? MultipartFile.fromFileSync(myImage!.path,
                filename: myImage!.path.split("/").last)
            : null,
        "category_id": 3,
        "active": 1,
      }),
    );
    if (response.isSuccess) {
      emit(AddProductsSuccessStates(msg: response.msg));
    } else {
      emit(AddProductsFailedStates(msg: response.msg));
    }
  }
}
