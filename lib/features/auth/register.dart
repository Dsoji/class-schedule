// ignore_for_file: library_private_types_in_public_api, prefer_is_empty

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/widgets/erro_widget.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/features/auth/login.dart';

// import 'model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Student',
    'Teacher',
  ];
  var levels = [
    "100",
    "200",
    "300",
    "400",
    "500",
  ];
  var depts = [
    'CVE',
    'EEE',
    'MEE',
    'AGE',
    'MME',
    'MNE',
    'IPE',
  ];
  var _currentItemSelected = "Student";
  var _levelItemSelected = "100";
  var _deptItemSelected = "CVE";
  var rool = "Student";
  var level = "Level";
  var dept = "Department";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Create a class \nscheduler account',
                            style: AppTextStyles.regular48
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(32),
                        //name field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Full Name',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(6),
                        FormBuilderTextField(
                          name: 'Name',
                          controller: nameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Full name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Name cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const Gap(16),
                        // TextFormField(
                        //   controller: nameController,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     hintText: 'Full Name',
                        //     enabled: true,
                        //     contentPadding: const EdgeInsets.only(
                        //         left: 14.0, bottom: 8.0, top: 8.0),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     if (value!.length == 0) {
                        //       return "Name cannot be empty";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   onChanged: (value) {},
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
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
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const Gap(16),
                        // TextFormField(
                        //   controller: emailController,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     hintText: 'Email',
                        //     enabled: true,
                        //     contentPadding: const EdgeInsets.only(
                        //         left: 14.0, bottom: 8.0, top: 8.0),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     if (value!.length == 0) {
                        //       return "Email cannot be empty";
                        //     }
                        //     if (!RegExp(
                        //             "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        //         .hasMatch(value)) {
                        //       return ("Please enter a valid email");
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   onChanged: (value) {},
                        //   keyboardType: TextInputType.emailAddress,
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
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
                          obscureText: _isObscure,
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
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
                          onChanged: (value) {},
                        ),
                        const Gap(16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Details',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(8),
                        //detaisls
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                ),
                                width: 200,
                                height: 60,
                                child: Center(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    isDense: true,
                                    isExpanded: false,
                                    iconEnabledColor: Colors.black,
                                    focusColor: Colors.white,
                                    items:
                                        depts.map((String dropDownStringItem) {
                                      return DropdownMenuItem<String>(
                                        value: dropDownStringItem,
                                        child: Text(
                                          dropDownStringItem,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValueSelected) {
                                      setState(() {
                                        _deptItemSelected = newValueSelected!;
                                        dept = newValueSelected;
                                      });
                                    },
                                    value: _deptItemSelected,
                                  ),
                                ),
                              ),
                              const Gap(16),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                ),
                                width: 200,
                                height: 60,
                                child: Center(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    isDense: true,
                                    isExpanded: false,
                                    iconEnabledColor: Colors.black,
                                    focusColor: Colors.white,
                                    items:
                                        levels.map((String dropDownStringItem) {
                                      return DropdownMenuItem<String>(
                                        value: dropDownStringItem,
                                        child: Text(
                                          dropDownStringItem,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValueSelected) {
                                      setState(() {
                                        _levelItemSelected = newValueSelected!;
                                        level = newValueSelected;
                                      });
                                    },
                                    value: _levelItemSelected,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(16),
                        // TextFormField(
                        //   obscureText: _isObscure,
                        //   controller: passwordController,
                        //   decoration: InputDecoration(
                        //     suffixIcon: IconButton(
                        //         icon: Icon(_isObscure
                        //             ? Icons.visibility_off
                        //             : Icons.visibility),
                        //         onPressed: () {
                        //           setState(() {
                        //             _isObscure = !_isObscure;
                        //           });
                        //         }),
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     hintText: 'Password',
                        //     enabled: true,
                        //     contentPadding: const EdgeInsets.only(
                        //         left: 14.0, bottom: 8.0, top: 15.0),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     RegExp regex = RegExp(r'^.{6,}$');
                        //     if (value!.isEmpty) {
                        //       return "Password cannot be empty";
                        //     }
                        //     if (!regex.hasMatch(value)) {
                        //       return ("please enter valid password min. 6 character");
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   onChanged: (value) {},
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm password',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(6),
                        FormBuilderTextField(
                          name: 'Confirm Password',
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const Gap(16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Role : ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                              ),
                              width: 200,
                              height: 60,
                              child: Center(
                                child: DropdownButton<String>(
                                  dropdownColor: Colors.white,
                                  isDense: true,
                                  isExpanded: false,
                                  iconEnabledColor: Colors.black,
                                  focusColor: Colors.white,
                                  items:
                                      options.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValueSelected) {
                                    setState(() {
                                      _currentItemSelected = newValueSelected!;
                                      rool = newValueSelected;
                                    });
                                  },
                                  value: _currentItemSelected,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account?",
                              style: AppTextStyles.regular12
                                  .copyWith(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' Log in',
                                  style: AppTextStyles.regular12.copyWith(
                                    color: Colors.red,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      const CircularProgressIndicator();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(62),
                        Center(
                          child: FullButton(
                            color: ColorStyles.primaryBlue,
                            height: 48,
                            onPressed: () {
                              setState(() {
                                showProgress = true;
                              });
                              signUp(
                                  emailController.text,
                                  passwordController.text,
                                  rool,
                                  level,
                                  dept,
                                  nameController.text);
                            },
                            text: 'Continue',
                            width: 343,
                          ),
                        ),
                        const Gap(8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, String rool, String level,
      String dept, String name) async {
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
        Set userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) =>
                {postDetailsToFirestore(email, rool, level, dept, name)});
      } on FirebaseAuthException catch (e) {
        displayMessage(e.code, context);
      }
    }
  }

  postDetailsToFirestore(
      String email, String rool, String level, String dept, String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'rool': rool,
      'level': level,
      'dept': dept,
      'name': nameController.text,
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
