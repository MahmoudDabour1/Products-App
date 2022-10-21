import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/shared_widgets/textform.dart';
import 'package:products/views/pages/add_products/bottom_model.dart';
import '../../../core/helper_methods.dart';
import '../view.dart';
import 'cubit.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductsCubit(),
      child: Builder(builder: (context) {
        final cubit = AddProductsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Products"),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pngtree-add-shopping-cart-icon-image_1144331-removebg-preview.png",
                      width: 300.w,
                      height: 150.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 75.w, top: 30.h),
                          child: Text(
                            'Add Products',
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        BlocBuilder<AddProductsCubit, AddProductsStates>(
                            builder: (context, states) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      topRight: Radius.circular(18),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 150,
                                      child: BottomModel(cubit: cubit),
                                    );
                                  });
                            },
                            child: Container(
                                height: 100.h,
                                width: 100.h,
                                margin: const EdgeInsets.only(top: 30),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.purpleAccent.withOpacity(0.5),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    if (cubit.myImage != null)
                                      Image.file(
                                        cubit.myImage!,
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: cubit.myImage != null
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ],
                                )),
                          );
                        }),
                      ],
                    ),
                    TextForm(
                      label: "Enter Products title",
                      controller: cubit.titleController,
                      keyboardType: TextInputType.name,
                    ),
                    TextForm(
                      label: "Enter Products Price",
                      controller: cubit.priceController,
                      keyboardType: TextInputType.number,
                    ),
                    TextForm(
                      label: "Enter Products Description",
                      controller: cubit.descriptionController,
                      keyboardType: TextInputType.emailAddress,
                      isLastInput: true,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    BlocConsumer<AddProductsCubit, AddProductsStates>(
                        listener: (context, state) {
                      if (state is AddProductsFailedStates) {
                        showMessage(msg: state.msg);
                      }
                      if (state is AddProductsSuccessStates) {
                        showMessage(msg: state.msg);
                        navigatorTo(page: const HomeView(), context: context);
                      }
                    }, builder: (context, state) {
                      if (state is AddProductsLoadingStates) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: cubit.addProducts,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          fixedSize: const Size(350, 56),
                          primary: Colors.purpleAccent,
                        ),
                        child: const Text(
                          'AddProducts',
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
