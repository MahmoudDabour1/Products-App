import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/core/helper_methods.dart';

import '../Login_View/view.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigatorTo(
        context: context,
        page:  LoginView(),
        withHistory: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/—Pngtree—mobile shopping mall online shopping_4986602.png',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                height: 500.h,
                width:500.w ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
