import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormkey = GlobalKey<FormState>();
  final _signinFormkey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signupUser(){
    authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);
  }

  void signInUser(){
    authService.signInUser(context: context, email: _emailController.text, password: _passwordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10,),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signupFormkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(text: 'Sign up', onTap: () {
                        if(_signupFormkey.currentState!.validate()){
                          signupUser();
                        }
                      })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Sign in',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            if(_auth == Auth.signin)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signinFormkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(text: 'Sign In', onTap: () {
                        if(_signinFormkey.currentState!.validate()){
                          signInUser();
                        }
                      })
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}