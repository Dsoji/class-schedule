// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/features/timetable/model/time_table.dart';
import 'package:scheduler/features/timetable/widget/number_widget.dart';
import 'package:scheduler/features/timetable/widget/time_widget.dart';

import '../../../core/const/const_barrel.dart';

class SecondSemester extends StatefulWidget {
  const SecondSemester({super.key});

  @override
  State<SecondSemester> createState() => _SecondSemesterState();
}

class _SecondSemesterState extends State<SecondSemester> {
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
                  // MaterialPageRoute(builder: (context) => const EditProfile()),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Gap(20),
            _addWeekList(),
            const Gap(20),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: timeTable.length,
                  itemBuilder: (context, index) {
                    return TimeWidget(
                      course: timeTable[index].course,
                      location: timeTable[index].location,
                      date: timeTable[index].date,
                      time: timeTable[index].time,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _addWeekList() {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      direction: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '1',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '2',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '3',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '4',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '4',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '5',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '6',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '7',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '8',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '9',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '10',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '11',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: NumberWidget(
            text: '12',
          ),
        ),
      ],
    );
  }
}
