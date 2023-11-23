// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/features/timetable/model/time_table.dart';
import 'package:scheduler/features/timetable/widget/number_widget.dart';
import 'package:scheduler/features/timetable/widget/time_widget.dart';
import 'package:scheduler/service/firestore.dart';

import '../../../core/const/const_barrel.dart';

class SecondSemester extends StatefulWidget {
  const SecondSemester({super.key});

  @override
  State<SecondSemester> createState() => _SecondSemesterState();
}

class _SecondSemesterState extends State<SecondSemester> {
  final TimetableService firestoreService = TimetableService();
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> dataList = [];

  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
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
            DatePicker(
              DateTime.now(),
              width: 60,
              height: 80,
              controller: DatePickerController(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  // _selectedDate = date;
                });
                // fetchDataFromFirebase(date);
              },
            ),
            const Gap(20),
            SizedBox(
              height: 550,
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getTtStream(userDept),
                builder: (context, snapshot) {
                  //logic t get notes
                  if (snapshot.hasData) {
                    List notesList = snapshot.data!.docs;
                    //display as list
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: notesList.length,
                      itemBuilder: (context, index) {
                        //get each indv doc
                        DocumentSnapshot document = notesList[index];
                        String docID = document.id;

                        //get note from each doc
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String titleText = data['code'];
                        String dateTime = data['dateTime'];
                        String location = data['location'];
                        // String unitText = data['unit'];
                        // String detText = data['details'];

                        //display as list tile
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TimeWidget(
                            course: titleText,
                            location: location,
                            time: dateTime,
                            date: dateTime,
                          ),
                        );
                      },
                    );
                  }
                  // if there exist to be no data
                  else {
                    return const Text("nothing to show here");
                  }
                },
              ),
            ),

            // Expanded(
            //   child: ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       itemCount: timeTable.length,
            //       itemBuilder: (context, index) {
            //         return TimeWidget(
            //           course: timeTable[index].course,
            //           location: timeTable[index].location,
            //           date: timeTable[index].date,
            //           time: timeTable[index].time,
            //         );
            //       }),
            // ),
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
