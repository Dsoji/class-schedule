import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';

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
                'Enter your phone number and we will send you instructions to reset your password.',
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
            ReusedField(
              height: 38,
              width: double.infinity,
              controller: emailController,
              color: Colors.black,
              autofocus: true,
            ),
            const Gap(42),
            Center(
              child: FullButton(
                color: ColorStyles.primaryBlue,
                height: 48,
                onPressed: () {},
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
                          // MaterialPageRoute(
                          //   builder: (context) => const SignUpScreen(),
                          // ),
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
}
