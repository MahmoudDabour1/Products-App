import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/Dio_helper.dart';
import 'cubit.dart';

class ProductsView extends StatelessWidget {
  ProductsView({Key? key}) : super(key: key);

  final dioHelper = DioHelper();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: Builder(builder: (context) {
        final cubit = ProductsCubit.get(context);
        cubit.getProducts();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<ProductsCubit, ProductsStates>(
                      builder: (context, state) {
                    if (state is ProductsLoadingStates) {
                      return const CircularProgressIndicator();
                    }
                    if (state is ProductsFailedStates) {
                      return Text(state.msg);
                    } else {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await Future.delayed(const Duration(seconds: 2));
                            cubit.getProducts();
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 80.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Title : ",
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                  ),
                                                ),
                                                Text(
                                                  cubit.model!.data
                                                      .records[index].title,
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 50.w,
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                "Whatch out!!!",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              content:
                                                                  const Text(
                                                                "Are you sure you want to delete this?",
                                                              ),
                                                              actions: [
                                                                FlatButton(
                                                                  onPressed:
                                                                      () {
                                                                    Dio().delete(
                                                                        "http://store.webautobazaar.com/api/products/${cubit.model!.data.records[index].id}");
                                                                    cubit
                                                                        .getProducts();
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    "Yes",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ),
                                                                ),
                                                                FlatButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          "No"),
                                                                ),
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      size: 30,
                                                      color:
                                                          Colors.purpleAccent,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Id : ",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  cubit.model!.data
                                                      .records[index].id
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Price : ",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  cubit.model!.data
                                                      .records[index].price,
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            itemCount: cubit.model!.data.records.length,
                          ),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
