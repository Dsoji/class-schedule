// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/features/timetable/pages/second_semester.dart';

import '../../../core/const/const_barrel.dart';
import '../../../core/widgets/widget_barrel.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Timetable',
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContainerWidget2(
                onPressed: () {},
                title: '1st Semester',

                svg: SvgAssets.cal,

                // isContainer1Selected
                //     ? ColorStyles.primaryBlue
                //     : Colors.transparent,
              ),
              ContainerWidget2(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondSemester()),
                  );
                },
                title: '2nd Semester',

                svg: SvgAssets.cal,

                // isContainer1Selected
                //     ? ColorStyles.primaryBlue
                //     : Colors.transparent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
