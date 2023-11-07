import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/features/home/view/pages/assignment.dart';
import 'package:scheduler/features/profile/view/pages/notification_page.dart';

import '../../bottomNavigation/bottom_pages_brrel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Good Morning',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular20.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const Gap(8),
                  Image.asset(
                    height: 20,
                    width: 20,
                    ImageAssets.bye,
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
              const Gap(8),
              //date
              Text(
                '27th Sept 2023',
                textAlign: TextAlign.left,
                style: AppTextStyles.regular12.copyWith(
                  color: Colors.black,
                ),
              ),
              const Gap(24),
              //searchbar
              TextField(
                autofocus: false,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusColor: Colors.white,
                  hintText: 'Search courses,assignment, lecturers ',
                  hintStyle: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
//
//

              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TimetablePage()),
                      );
                    },
                    title: 'TIMETABLE',
                    details: 'View all course schedule',
                    svg: SvgAssets.cal,
                    color: ColorStyles.primaryBlue,
                    borderColor: Colors.transparent,
                    // isContainer1Selected
                    //     ? ColorStyles.primaryBlue
                    //     : Colors.transparent,
                  ),
                  ContainerWidget(
                    title: 'COURSE \nMATERIALS',
                    details: 'Download all course materials',
                    svg: SvgAssets.buk,
                    color: Colors.purple,
                    borderColor: Colors.transparent,
                    // isContainer1Selected
                    //     ? Colors.transparent
                    //     : ColorStyles.primaryBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MaterialsPage()),
                      );
                    },
                  ),
                ],
              ),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AssignmentsPage()),
                      );
                    },
                    title: 'ASSIGNMENT ',
                    details: 'View all available assignments',
                    svg: SvgAssets.ass,
                    color: const Color.fromRGBO(255, 0, 92, 1),
                    borderColor: Colors.transparent,
                    // isContainer1Selected
                    //     ? ColorStyles.primaryBlue
                    //     : Colors.transparent,
                  ),
                  ContainerWidget(
                    title: 'NOTIFICATION ',
                    details: 'Get Urgent Notification',
                    svg: SvgAssets.speaker,
                    color: ColorStyles.primaryBlue,
                    borderColor: Colors.transparent,
                    // isContainer1Selected
                    //     ? Colors.transparent
                    //     : ColorStyles.primaryBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
