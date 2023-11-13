import 'package:cart_rover/constants/global_variables.dart';
import 'package:cart_rover/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    int _page = 0;
  double bottomNavBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text('Analytics Screen'),
    ),
    const Center(
      child: Text('Cart Screen'),
    )
  ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png' , width: 120 , height: 45 , color: Colors.black,),
              ),
              const Text('Admin' , style: TextStyle(
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
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
              child: Icon(Icons.analytics),
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
              child: Icon(Icons.all_inbox_outlined),
          ),
          
          ),
          

        ],) ,
    );
  }
}