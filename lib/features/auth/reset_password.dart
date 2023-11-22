import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/widgets/erro_widget.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/features/auth/login.dart';

class ReetPassword extends StatefulWidget {
  const ReetPassword({super.key});

  @override
  State<ReetPassword> createState() => _ReetPasswordState();
}

class _ReetPasswordState extends State<ReetPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: AppTextStyles.regular24.copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            const SizedBox(
              width: 296,
              child: Text(
                'Enter your email and we will send you instructions to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1A171B),
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            const Gap(32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email Address',
                style: AppTextStyles.regular12.copyWith(color: Colors.black),
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
            const Gap(42),
            Center(
              child: FullButton(
                color: ColorStyles.primaryBlue,
                height: 48,
                onPressed: rstPswrd,
                text: 'Continue',
                width: 343,
              ),
            ),
            const Gap(8),
            Center(
                child: Text.rich(
              TextSpan(
                text: "Do you remember your password?",
                style: AppTextStyles.regular12.copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: ' Login',
                    style: AppTextStyles.regular12.copyWith(
                      color: ColorStyles.primaryBlue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future rstPswrd() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      // displayMessage(
      //     "Password reset email sent successfully!, check your mail", context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Password reset email sent successfully!, check your mail'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors if the password reset email cannot be sent
      print('Error sending password reset email: $e');
      displayMessage("Reset link not sent, please try again", context);
    }
  }
}
