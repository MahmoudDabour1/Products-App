import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products/core/helper_methods.dart';
import 'package:products/views/Login_View/view.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color(0xffFAFAFA),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 30.w, top: 100.h),
                        child: const Text(
                          "Mahmoud Dabour",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Text(
                        "50k",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff212121),
                        ),
                      ),
                      const Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff212121),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
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
                        children: [
                          Image.asset(
                            "assets/images/IMG_٢٠٢٢٠٦٢٩_١٤٤٠٥٣.jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Container(
                  color: Colors.grey.shade200,
                  height: 80.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: const Icon(Icons.light_mode,color: Colors.purpleAccent,),
                      ),
                      SizedBox(
                        width: 62.1.w,
                      ),
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontSize: 29.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Container(
                  color: Colors.grey.shade200,
                  height: 80.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: const Icon(Icons.settings,color: Colors.purpleAccent,),
                      ),
                      SizedBox(
                        width: 62.1.w,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 29.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Container(
                  color: Colors.grey.shade200,
                  height: 80.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: const Icon(Icons.info_outline,color: Colors.purpleAccent,),
                      ),
                      SizedBox(
                        width: 62.1.w,
                      ),
                      Text(
                        "Info",
                        style: TextStyle(
                          fontSize: 29.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()
                {
                  navigatorTo(page: LoginView(),context: context);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Container(
                    color: Colors.grey.shade200,
                    height: 80.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: const Icon(Icons.logout,
                          color: Colors.purpleAccent,
                          ),
                        ),
                        SizedBox(
                          width: 62.1.w,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 29.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
