
import 'package:flutter/material.dart';
import 'package:products/views/pages/add_products/view.dart';
import 'package:products/views/pages/products/view.dart';
import 'package:products/views/pages/profile/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pages = [
    ProductsView(),
    const AddProductsView(),
    const ProfileView(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        fixedColor: const Color(0xffFF6EA1),
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        currentIndex: currentPage,
        onTap: (int index) {
          currentPage = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Products ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile ",
          ),
        ],
      ),
    );
  }
}
