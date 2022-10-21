import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/core/cache_Helper.dart';
import 'package:products/core/helper_methods.dart';
import 'package:products/core/text.dart';
import 'package:products/shared_widgets/textform.dart';
import 'package:products/views/login_view/cubit.dart';
import 'package:products/views/pages/view.dart';
import '../register/view.dart';

class LoginView extends StatefulWidget {
   LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
  String token = CacheHelper.getToken();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    'assets/images/login.png',
                    width: 200.w,
                    height: 200.h,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: Text(
                        'Welcome Back To Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextForm(
                    prefixIcon: const Icon(Icons.email),
                    label: "Enter Your Email",
                    controller: cubit.emailController,
                    validator: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextForm(
                    prefixIcon: const Icon(Icons.lock),
                    label: "Enter Your Password",
                    controller: cubit.passwordController,
                    validator: passwordValidator,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    isLastInput: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: BlocConsumer<LoginCubit, LoginStates>(
                        listener: (context, state) {
                      if (state is LoginFailedStates) {
                        showMessage(msg: state.msg);
                      }
                      if (state is LoginSuccessStates) {
                        showMessage(msg: state.msg);
                        navigatorTo(
                            context: context,
                            page: const HomeView(),
                            withHistory: false);
                      }
                    }, builder: (context, state) {
                      if (state is LoginLoadingStates) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: cubit.login,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          fixedSize: const Size(350, 56),
                          primary: Colors.purpleAccent,
                        ),
                        child: const Text(
                          'Login',
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an Account? ",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigatorTo(
                              context: context,
                              page: const RegisterView(),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.purpleAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
