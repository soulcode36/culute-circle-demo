// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:demo/Home/home_screen.dart';
import 'package:demo/profile/profile_screen.dart';
import 'package:demo/theme/theme.dart';
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              title: Row(
                children: [
                  Spacer(),
                  Image.asset(
                    "assets/images/stockx.png",
                    height: MediaQuery.of(context).size.height * 0.050,
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    color: appTheme.buttonColor,
                  )
                ],
              ),
            ),
            body: IndexedStack(
              index: bottomBarController.tabIndex.value,
              children: [HomeScreen(), ProfileScreen()],
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: appTheme.primaryColor,
                unselectedItemColor: appTheme.buttonColor.withOpacity(0.4),
                elevation: 10,
                currentIndex: bottomBarController.tabIndex.value,
                onTap: bottomBarController.chnageTabIndex,
                items: const [
                  BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
                ]),
          ),
        ));
  }
}
