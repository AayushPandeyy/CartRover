import 'package:cart_rover/constants/global_variables.dart';
import 'package:cart_rover/features/auth/screens/auth_screen.dart';
import 'package:cart_rover/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariable.secondaryColor
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)
          ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) =>  generateRoute(settings),
      home:  AuthScreen()
    );
  }
}

