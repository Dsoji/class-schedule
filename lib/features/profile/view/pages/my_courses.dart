// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/features/profile/widget/expanded_widget.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'My Courses',
          style: AppTextStyles.regular24.copyWith(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: SvgPicture.asset(
                SvgAssets.x,
                width: 25.17,
                height: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Text(
                  'Level: 300',
                  style: AppTextStyles.regular16.copyWith(color: Colors.black),
                ),
                Text(
                  'Semeseter: 2nd',
                  style: AppTextStyles.regular16.copyWith(color: Colors.black),
                ),
                const Gap(16),
                const ExpandWidget(
                  course: 'MEE 309',
                ),
                const Gap(16),
                const ExpandWidget(
                  course: 'MEE 309',
                ),
                const Gap(16),
                const ExpandWidget(
                  course: 'MEE 309',
                ),
                const Gap(16),
                const ExpandWidget(
                  course: 'MEE 309',
                ),
                const Gap(16),
                const ExpandWidget(
                  course: 'MEE 309',
                ),
                const Gap(16),
                const ExpandWidget(
                  course: 'MEE 309',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
