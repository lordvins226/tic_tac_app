import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_app/core/controllers/BottomNavigationBarProvider.dart';
import 'package:tic_tac_app/ui/views/home.dart';
import 'package:tic_tac_app/ui/views/map.dart';
import 'package:tic_tac_app/ui/views/profile.dart';

class BottomNavigation extends StatelessWidget {
  final BottomBarController bottomBarController =
      Get.put(BottomBarController());

  final List<Widget> pages = [HomePage(), MapPage(), ProfilePage()];

  BottomNavigationBarItem _bottomIcons(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => PageView(
            children: [
              Stack(
                children: [
                  pages[bottomBarController.currentIndex],
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            elevation: 5.0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Color(0xFFfd5352),
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomBarController.currentIndex,
            items: [
              _bottomIcons(Icons.home, 'Accueil'),
              _bottomIcons(Icons.location_on, 'Map'),
              _bottomIcons(Icons.person, 'Profile'),
            ],
            onTap: (index) => bottomBarController.currentIndex = index,
          ),
        ));
  }
}
