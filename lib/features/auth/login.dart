// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/core/widgets/erro_widget.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/features/auth/register.dart';
import 'package:scheduler/features/auth/reset_password.dart';
import 'package:scheduler/features/bottomNavigation/bottom_navigation.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(72),
                      Center(
                        child: Image.asset(
                          height: 54,
                          width: 90,
                          ImageAssets.logos,
                        ),
                      ),
                      const Gap(48),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome back',
                          style: AppTextStyles.regular48
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      const Gap(32),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email Address',
                          style: AppTextStyles.regular12
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      const Gap(6),
                      FormBuilderTextField(
                        name: 'Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email address',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                      ),
                      const Gap(16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: AppTextStyles.regular12
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      const Gap(6),
                      FormBuilderTextField(
                        name: 'Password',
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure3
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure3 = !_isObscure3;
                                });
                              }),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("please enter valid password min. 6 character");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                      ),
                      const Gap(8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                      const Gap(32),
                      Center(
                        child: FullButton(
                          color: ColorStyles.primaryBlue,
                          height: 48,
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          text: 'Continue',
                          width: 343,
                        ),
                      ),
                      const Gap(8),
                      Center(
                          child: Text.rich(
                        TextSpan(
                          text: "Don't have an account?",
                          style: AppTextStyles.regular12
                              .copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: AppTextStyles.regular12.copyWith(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void route() async {
    User? user = FirebaseAuth.instance.currentUser;
    var userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        if (documentSnapshot.exists) {
          String userRole = documentSnapshot.get('rool');
          String userName = documentSnapshot.get('name');
          String userEmail = documentSnapshot.get('email');
          String userLevel = documentSnapshot.get('level');
          String userDept = documentSnapshot.get('dept');

          // Store user information in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userName', userName);
          prefs.setString('userRole', userRole);
          prefs.setString('userEmail', userEmail);
          prefs.setString('userLevel', userLevel);
          prefs.setString('userDept', userDept);

          Provider.of<UserRoleProvider>(context, listen: false).setUserDetails(
            role: userRole, // Or set the role as needed
            name: userName,
            email: userEmail,
            level: userLevel,
            dept: userDept,
            docId: userDocRef.id,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          );
        } else {}
      }
    });
  }

  void signIn(String email, String password) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: const CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );

    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          displayMessage("User not found", context);
        } else if (e.code == 'wrong-password') {
          displayMessage("Error: check details and try again", context);
        } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          displayMessage('Wrong login credentials, please try again', context);
        }
      }
    }
  }
}
