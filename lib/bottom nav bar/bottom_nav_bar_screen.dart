import 'package:demo/Home/home_screen.dart';
import 'package:demo/cart/cart_screen.dart';
import 'package:demo/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  BottomBarController bottomBarController = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            body: IndexedStack(
              index: bottomBarController.tabIndex.value,
              children: [const HomeScreen(), SearchScreen(), CartScreen()],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: bottomBarController.tabIndex.value,
                onTap: bottomBarController.chnageTabIndex,
                items: const [
                  BottomNavigationBarItem(
                      label: '', icon: Icon(Icons.home_outlined)),
                  BottomNavigationBarItem(
                      label: '', icon: Icon(Icons.search_sharp)),
                  BottomNavigationBarItem(
                      label: '', icon: Icon(Icons.shopify_sharp)),
                ]),
          ),
        ));
  }
}
