// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/service/firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateTimetable extends StatefulWidget {
  const UpdateTimetable({
    super.key,
  });

  @override
  State<UpdateTimetable> createState() => _UpdateTimetableState();
}

class _UpdateTimetableState extends State<UpdateTimetable> {
  //firestore
  final TimetableService firestoreService = TimetableService();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final TextEditingController codeController = TextEditingController();
  final TextEditingController lctnController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userDept = prefs.getString('userDept') ?? '';

    return {'userDept': userDept};
  }

  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Update Timetable',
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
      body: FutureBuilder(
          future: getUserDetails(),
          builder: (context, snapshot) {
            Map<String, String> userDetails =
                snapshot.data as Map<String, String>;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(56),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Course Code',
                        style: AppTextStyles.regular12
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const Gap(6),
                    FormBuilderTextField(
                      name: 'Course Code',
                      controller: codeController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Gap(24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location',
                        style: AppTextStyles.regular12
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const Gap(6),
                    FormBuilderTextField(
                      name: 'Location',
                      controller: lctnController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Gap(24),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 65,
                            width: 163.5,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Date',
                                    style: AppTextStyles.regular12
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                const Gap(8),
                                InkWell(
                                  onTap: () async {
                                    DateTime? newDateTime =
                                        await showRoundedDatePicker(
                                      height: 260,
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                      borderRadius: 16,
                                    );

                                    if (newDateTime != null) {
                                      setState(() {
                                        selectedDate = newDateTime;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 163.50,
                                    height: 41,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 14),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.20,
                                            color: Color.fromARGB(
                                                190, 29, 28, 28)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Text(
                                      "${selectedDate.toLocal()}".split(' ')[0],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 65,
                            width: 163.5,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: Text(
                                      'Time',
                                      style: AppTextStyles.regular12
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                InkWell(
                                  onTap: () async {
                                    TimeOfDay? newTime =
                                        await showRoundedTimePicker(
                                      background: Colors.grey,
                                      context: context,
                                      initialTime: selectedTime,
                                    );

                                    if (newTime != null) {
                                      setState(() {
                                        selectedTime = newTime;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 163.50,
                                    height: 41,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 14),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.20,
                                            color: Color(0xBF212121)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        selectedTime.format(context),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    const Gap(104),
                    Center(
                      child: FullButton(
                        color: ColorStyles.primaryBlue,
                        height: 48,
                        onPressed: () {
                          String formattedDateTime =
                              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day} ${selectedTime.hour}:${selectedTime.minute}";
                          // adding new timetable
                          firestoreService.addTt(
                            userDept,
                            codeController.text,
                            lctnController.text,
                            formattedDateTime,
                          );

                          //clear the text controller
                          codeController.clear();
                          lctnController.clear();
                          //close boxx
                          Navigator.pop(context);
                        },
                        text: 'Update Timetable',
                        width: 343,
                      ),
                    ),
                    const Gap(12),
                    const Center(
                      child: Text(
                        'Note: once text clears in the fields means uploading is completed',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
