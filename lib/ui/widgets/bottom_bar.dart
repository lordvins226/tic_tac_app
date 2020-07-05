import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_app/core/providers/BottomNavigationBarProvider.dart';
import 'package:tic_tac_app/ui/views/cart.dart';
import 'package:tic_tac_app/ui/views/home.dart';
import 'package:tic_tac_app/ui/views/map.dart';
import 'package:tic_tac_app/ui/views/profile.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var currentTab = [HomePage(), MapPage(), ProfilePage()];

  BottomNavigationBarItem _bottomIcons(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), title: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    var bar = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          currentTab[bar.currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFFfd5352),
        type: BottomNavigationBarType.fixed,
        currentIndex: bar.currentIndex,
        items: [
          _bottomIcons(Icons.home, 'Accueil'),
          //_bottomIcons(Icons.shopping_cart, 'Panier'),
          _bottomIcons(Icons.location_on, 'Map'),
          _bottomIcons(Icons.person, 'Profile'),
        ],
        onTap: (int index) {
          setState(() {
            bar.currentIndex = index;
          });
        },
      ),
    );
  }
}
