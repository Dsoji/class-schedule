import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';

import '../../../../core/widgets/widget_barrel.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool obscureText = true;
  final pswrdController = TextEditingController();
  final nwpswrdController = TextEditingController();

  @override
  void dispose() {
    nwpswrdController.dispose();
    pswrdController.dispose();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(10),
                Text(
                  'Enter your new password',
                  style: AppTextStyles.regular16.copyWith(color: Colors.grey),
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Current Password',
                    style:
                        AppTextStyles.regular12.copyWith(color: Colors.black),
                  ),
                ),
                const Gap(6),
                ReusedField3(
                  // onPressed: () {
                  //   setState(() {
                  //     obscureText = !obscureText;
                  //   });
                  // },
                  height: 38,
                  width: double.infinity,
                  controller: pswrdController,
                  color: Colors.black,
                  // icon: obscureText
                  //     ? Icons.visibility
                  //     : Icons.visibility_off_rounded,
                  autofocus: true,
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Password',
                    style:
                        AppTextStyles.regular12.copyWith(color: Colors.black),
                  ),
                ),
                const Gap(6),
                ReusedField3(
                  // onPressed: () {
                  //   setState(() {
                  //     obscureText = !obscureText;
                  //   });
                  // },
                  height: 38,
                  width: double.infinity,
                  controller: pswrdController,
                  color: Colors.black,
                  // icon: obscureText
                  //     ? Icons.visibility
                  //     : Icons.visibility_off_rounded,
                  autofocus: true,
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style:
                        AppTextStyles.regular12.copyWith(color: Colors.black),
                  ),
                ),
                const Gap(6),
                ReusedField(
                  // onPressed: () {
                  //   setState(() {
                  //     obscureText = !obscureText;
                  //   });
                  // },
                  height: 38,
                  width: double.infinity,
                  controller: pswrdController,
                  color: Colors.black,
                  // icon: obscureText
                  //     ? Icons.visibility
                  //     : Icons.visibility_off_rounded,
                  autofocus: true,
                ),
                const Gap(32),
                Center(
                  child: FullButton(
                    color: ColorStyles.primaryBlue,
                    height: 48,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const BottomNavBar(),
                      //   ),
                      // );
                    },
                    text: 'Continue',
                    width: 343,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
