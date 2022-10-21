import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/core/helper_methods.dart';
import 'package:products/shared_widgets/textform.dart';
import 'package:products/views/pages/view.dart';
import 'package:products/views/register/cubit.dart';
import '../../core/bottom_model.dart';
import '../../core/text.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool loding = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        final cubit = RegisterCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/tasklist-03.png",
                        width: 300.w,
                        height: 200.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25.h,
                              left: 15.w,
                              right: 80.w,
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          BlocBuilder<RegisterCubit, RegisterStates>(
                              builder: (context, state) {
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
                                  margin: EdgeInsets.only(top: 30.h),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purpleAccent.withOpacity(0.3),
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
                        label: "Enter Your Name",
                        controller: cubit.nameController,
                        keyboardType: TextInputType.name,
                        validator: nameValidator,
                        prefixIcon: const Icon(Icons.person),
                      ),
                      TextForm(
                        label: "Enter Your Phone",
                        controller: cubit.phoneController,
                        keyboardType: TextInputType.number,
                        validator: phoneValidator,
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      TextForm(
                        label: "Enter Your Email",
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                        prefixIcon: const Icon(Icons.alternate_email_outlined),
                      ),
                      TextForm(
                        label: "Enter Your Password",
                        controller: cubit.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        validator: passwordValidator,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      TextForm(
                        label: "Enter Your Confirm Password",
                        controller: cubit.confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        isLastInput: true,
                        isPassword: true,
                        validator: confirmPasswordValidator,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      BlocConsumer<RegisterCubit, RegisterStates>(
                          listener: (context, state) {
                        if (state is RegisterFailedStates) {
                          showMessage(msg: state.msg);
                        }
                        if (state is RegisterSuccessStates) {
                          showMessage(msg: state.msg);
                          navigatorTo(
                            page: const HomeView(),
                            context: context,
                          );
                        }
                      }, builder: (context, state) {
                        if (state is RegisterLoadingStates) {
                          return const CircularProgressIndicator();
                        }
                        return ElevatedButton(
                          onPressed: cubit.register,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            fixedSize: const Size(350, 56),
                            primary: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Register',
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
