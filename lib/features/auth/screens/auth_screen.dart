import 'package:cart_rover/common/widgets/custom_button.dart';
import 'package:cart_rover/common/widgets/custom_textfield.dart';
import 'package:cart_rover/constants/global_variables.dart';
import 'package:cart_rover/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  SignIn,
  SignUp
}


class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.SignUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser(){
    authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);
  }

  void signInUser(){
    authService.signInUser(context: context, email: _emailController.text, password: _passwordController.text);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),),
                ListTile(
                  tileColor: _auth == Auth.SignUp ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
                  title: const Text("Create Account",style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor,
                    value: Auth.SignUp,
                    groupValue: _auth,
                    onChanged: (Auth? val){
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if(_auth == Auth.SignUp)
                  Container(
                    padding: EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController ,
                            hintText: "Name",),
                            const SizedBox(height: 10,),
                            CustomTextField(
                            controller: _emailController ,
                            hintText: "Email",),
                            const SizedBox(height: 10,),
                            CustomTextField(
                            controller: _passwordController ,
                            hintText: "Password",),
                            const SizedBox(height: 10,),
                            CustomButton(text: "SignUp", onTap: (){
                                    if(_signUpFormKey.currentState!.validate()){
                                      signUpUser();
                                    }
                            })
                        ],
                      ) ,
                      key: _signUpFormKey,),
                  ),
                ListTile(
                  tileColor: _auth == Auth.SignIn ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
                  
                  title: const Text("Sign In",style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor,
                    value: Auth.SignIn,
                    groupValue: _auth,
                    onChanged: (Auth? val){
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if(_auth == Auth.SignIn)
                  Container(
                    padding: EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      child: Column(
                        children: [
                            CustomTextField(
                            controller: _emailController ,
                            hintText: "Email",),
                            const SizedBox(height: 10,),
                            CustomTextField(
                            controller: _passwordController ,
                            hintText: "Password",),
                            const SizedBox(height: 10,),
                            CustomButton(text: "SignIn", onTap: (){
                                  if(_signInFormKey.currentState!.validate()){
                                      signInUser();
                                    }
                            })
                        ],
                      ) ,
                      key: _signInFormKey,),
                  ),
              ],
            ),
          ) ),
    );
  }
}