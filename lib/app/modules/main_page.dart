import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskut/app/modules/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _bottomNavIndex,
        onTap: (value) {
          setState(() {
            _bottomNavIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/settings_unselected.svg'),
            label: 'Settings',
            activeIcon: SvgPicture.asset('assets/icons/settings_selected.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/clock_unselected.svg'),
            label: 'Clock',
            activeIcon: SvgPicture.asset('assets/icons/clock_selected.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/calender_unselected.svg'),
            label: 'Calender',
            activeIcon: SvgPicture.asset('assets/icons/calender_selected.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home_unselected.svg'),
            label: 'Home',
            activeIcon: SvgPicture.asset('assets/icons/home_selected.svg'),
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}
