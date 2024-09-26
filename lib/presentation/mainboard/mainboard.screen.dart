import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quad_b/presentation/home/home.screen.dart';
import 'package:quad_b/presentation/screens.dart';

import 'controllers/mainboard.controller.dart';

class MainboardScreen extends GetView<MainboardController> {
  const MainboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const <Widget>[
            HomeScreen(),
            SearchhScreen(),
            UserScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index) => controller.currentIndex.value = index,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            iconSize: 28,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: inactiveIcon(const Icon(Icons.home)),
                activeIcon: activeIcon(const Icon(Icons.home), 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: inactiveIcon(const Icon(Icons.search)),
                activeIcon: activeIcon(const Icon(Icons.search), 1),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: inactiveIcon(const Icon(Icons.person_outline)),
                activeIcon: activeIcon(const Icon(Icons.person), 2),
                label: 'User',
              ),
            ],
          ),
        ),
      ),
    );
  }

  inactiveIcon(Icon icon) {
    return AnimatedContainer(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: icon,
    );
  }

  activeIcon(Icon icon, index) {
    return AnimatedContainer(
      height: 30,
      width: 40,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        color: controller.currentIndex.value == index
            ? Colors.red
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: icon,
    );
  }
}
