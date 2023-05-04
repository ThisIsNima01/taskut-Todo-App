import 'package:animate_icons/animate_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskut/app/bloc/task/task_bloc.dart';
import 'package:taskut/app/screen/add_task_screen.dart';
import 'package:taskut/app/screen/home_screen.dart';

import '../config/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
      body: HomeScreen(),
    );
  }
}
