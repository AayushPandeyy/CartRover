import 'package:cart_rover/common/widgets/bottom_bar.dart';
import 'package:cart_rover/features/admin/screens/add_product_screen.dart';
import 'package:cart_rover/features/auth/screens/auth_screen.dart';
import 'package:cart_rover/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
      switch (routeSettings.name) {
        case AuthScreen.routeName:
            return MaterialPageRoute(settings: routeSettings,builder: (_)=> const AuthScreen());
        case HomeScreen.routeName:
            return MaterialPageRoute(settings: routeSettings,builder: (_)=> const HomeScreen());
          
        case BottomBar.routeName:
            return MaterialPageRoute(settings: routeSettings,builder: (_)=> const BottomBar());
          
        case AddProductScreen.routeName:
            return MaterialPageRoute(settings: routeSettings,builder: (_)=> const AddProductScreen());
          
        default:
            return MaterialPageRoute(settings: routeSettings,builder: (_)=> const Scaffold(
              body: Center(
                child: Text("Page does not exist"),
              ),
            ));
         
      }
}