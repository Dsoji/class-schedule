// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/service/add_class.dart';

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  //firestore
  final AddClassService firestoreService = AddClassService();
  //text controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController theatreController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTime2 = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? newDate = await showRoundedDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  Future<void> _selecDate(BuildContext context) async {
    DateTime? newDate = await showRoundedDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? newTme = await showRoundedTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (newTme != null) {
      setState(() {
        selectedTime2 = newTme;
      });
    }
  }

  Future<void> _selecTime(BuildContext context) async {
    TimeOfDay? newTime = await showRoundedTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Add Class',
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(36),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Course Title',
                style: AppTextStyles.regular12.copyWith(color: Colors.black),
              ),
            ),
            const Gap(6),
            FormBuilderTextField(
              name: ' Title',
              controller: titleController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Course Title',
                hintStyle: TextStyle(
                  color: Color(0xBF212121),
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Course code',
                style: AppTextStyles.regular12.copyWith(color: Colors.black),
              ),
            ),
            const Gap(6),
            FormBuilderTextField(
              name: 'course',
              controller: codeController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Course Code',
                hintStyle: TextStyle(
                  color: Color(0xBF212121),
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(24),
            //date and time
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
                            'Start',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(8),
                        InkWell(
                          onTap: () {
                            _selecTime(context);
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
                                    width: 0.20, color: Color(0xBF212121)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
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
                              'Finish',
                              style: AppTextStyles.regular12
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        const Gap(8),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
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
                                    width: 0.20, color: Color(0xBF212121)),
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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 163.5,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lecture Theatre',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(6),
                        FormBuilderTextField(
                          name: 'LT',
                          controller: theatreController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Lecture Theatre',
                            hintStyle: TextStyle(
                              color: Color(0xBF212121),
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 163.5,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Course Unit',
                            style: AppTextStyles.regular12
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        const Gap(6),
                        FormBuilderTextField(
                          name: 'Unit',
                          controller: unitController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Course Unit',
                            hintStyle: TextStyle(
                              color: Color(0xBF212121),
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Descriptoin(optional)',
                style: AppTextStyles.regular12.copyWith(color: Colors.black),
              ),
            ),
            const Gap(6),
            FormBuilderTextField(
              name: 'Description',
              controller: detailsController,
              maxLines: 5,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Description...',
                hintStyle: TextStyle(
                  color: Color(0xBF212121),
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(24),
            Center(
              child: FullButton(
                color: ColorStyles.primaryBlue,
                height: 48,
                onPressed: () {
                  //adding new note
                  firestoreService.addClass(
                      titleController.text,
                      codeController.text,
                      theatreController.text,
                      unitController.text,
                      detailsController.text);

                  //clear the text controller
                  titleController.clear();
                  codeController.clear();
                  theatreController.clear();
                  unitController.clear();
                  detailsController.clear();
                  //close boxx
                  Navigator.pop(context);
                },
                text: 'Add Class',
                width: 343,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
