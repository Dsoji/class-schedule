// import 'package:class_scheduler/features/materials/widget/course_tile.dart';

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/features/home/widget/assignment_widget.dart';

import '../../../../core/const/const_barrel.dart';
import '../../../../core/widgets/widget_barrel.dart';

// import '../model/course_material_model.dart';

class SubmitAssignments extends StatefulWidget {
  final String title;
  final String course;

  const SubmitAssignments({
    super.key,
    required this.title,
    required this.course,
  });

  @override
  State<SubmitAssignments> createState() => _SubmitAssignmentsState();
}

class _SubmitAssignmentsState extends State<SubmitAssignments> {
  final detailController = TextEditingController();

  @override
  void dispose() {
    detailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Submit Assignment',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upload assignmnet and submit before due date',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(20),
              HeaderWidget(
                text: widget.course,
              ),
              const Gap(24),
              HeaderWidget(
                text: widget.title,
              ),
              const Gap(24),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF055FE0),
                          shape: OvalBorder(),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        'Tap here and browse your file ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF7A7A7A),
                          fontSize: 12,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'details',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              ReusedField(
                height: 183,
                width: double.infinity,
                controller: detailController,
                color: Colors.black,
                autofocus: false,
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
    );
  }
}
