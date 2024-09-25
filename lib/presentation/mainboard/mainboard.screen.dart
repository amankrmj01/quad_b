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
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.currentIndex.value = index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
