// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:scheduler/service/upload_assgnment.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UpdateProfiletService firestoreService = UpdateProfiletService();
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  // Initial Selected Value
  var _levelItemSelected = "100";
  var _deptItemSelected = "CVE";

  var level = "Level";
  var dept = "Department";
  // List of items in our dropdown menu
  var levels = [
    "100",
    "200",
    "300",
    "400",
    "500",
  ];
  var depts = [
    'CVE',
    'EEE',
    'MEE',
    'AGE',
    'MME',
    'MNE',
    'IPE',
  ];

  @override
  Widget build(BuildContext context) {
    String userId = Provider.of<UserRoleProvider>(context).userId;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Edit Profile',
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
                const Gap(48),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                  ),
                ),
                const Gap(32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Student name',
                    style:
                        AppTextStyles.regular12.copyWith(color: Colors.black),
                  ),
                ),
                const Gap(6),
                FormBuilderTextField(
                  name: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Name cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    nameController.text = value!;
                  },
                ),
                const Gap(12),
                const Gap(12),
                Row(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Level',
                          style: AppTextStyles.regular12
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        width: 200,
                        height: 60,
                        child: Center(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor: Colors.black,
                            focusColor: Colors.white,
                            items: levels.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValueSelected) {
                              setState(() {
                                _levelItemSelected = newValueSelected!;
                                level = newValueSelected;
                              });
                            },
                            value: _levelItemSelected,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Department',
                          style: AppTextStyles.regular12
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        width: 200,
                        height: 60,
                        child: Center(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor: Colors.black,
                            focusColor: Colors.white,
                            items: depts.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValueSelected) {
                              setState(() {
                                _deptItemSelected = newValueSelected!;
                                dept = newValueSelected;
                              });
                            },
                            value: _deptItemSelected,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
                const Gap(38),
                Center(
                  child: FullButton(
                    color: ColorStyles.primaryBlue,
                    height: 48,
                    onPressed: () {
                      firestoreService.updateDetails(
                        userId,
                        level,
                        dept,
                        nameController.text,
                      );

                      //clear the text controller
                      nameController.clear();
//                   //close boxx
                      Navigator.pop(context);
                    },
                    text: 'Save',
                    width: 343,
                  ),
                ),
                Gap(12),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Note: Changes takes place in next login',
                    style: TextStyle(fontSize: 16),
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
