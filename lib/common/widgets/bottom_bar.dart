import 'package:cart_rover/constants/global_variables.dart';
import 'package:cart_rover/features/account/screens/account_screen.dart';
import 'package:cart_rover/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class BottomBar extends StatefulWidget {

  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart Screen'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar:BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
        currentIndex:_page ,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(label:'' ,icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page == 0 ? GlobalVariable.selectedNavBarColor : GlobalVariable.backgroundColor,
                  width: bottomBarBorderWidth
                ))
              ),
              child: Icon(Icons.home_outlined),
              
          ),
          
          ),
          BottomNavigationBarItem(label : '',icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page == 1 ? GlobalVariable.selectedNavBarColor : GlobalVariable.backgroundColor,
                  width: bottomBarBorderWidth
                ))
              ),
              child: Icon(Icons.person_outline_outlined),
          ),
          
          ),
          BottomNavigationBarItem(label : '',icon: Container(
              width: bottomNavBarWidth,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page == 2 ? GlobalVariable.selectedNavBarColor : GlobalVariable.backgroundColor,
                  width: bottomBarBorderWidth
                ))
              ),
              child: badge.Badge(
                  badgeContent: Text('2') ,
                  badgeStyle: badge.BadgeStyle(
                    badgeColor: Colors.white,
                    elevation: 0
                  ),
                child: Icon(
                  Icons.shopping_cart_outlined
                  ),
              ),
          ),
          
          ),

        ],) ,
    );
  }
}