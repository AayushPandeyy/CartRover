

import 'package:cart_rover/common/widgets/bottom_bar.dart';
import 'package:cart_rover/constants/global_variables.dart';
import 'package:cart_rover/features/admin/screens/admin_screen.dart';
import 'package:cart_rover/features/auth/screens/auth_screen.dart';
import 'package:cart_rover/features/auth/services/auth_service.dart';
import 'package:cart_rover/features/home/screens/home_screen.dart';
import 'package:cart_rover/providers/user_provider.dart';
import 'package:cart_rover/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context)=>UserProvider())
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home:  Provider.of<UserProvider>(context).user.token.isNotEmpty ? 
       Provider.of<UserProvider>(context).user.type == 'user' ? BottomBar() : const AdminScreen()
     : const AuthScreen()
    );
  }
}

