// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/service/firestore.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  //firestore
  final NotificationService firestoreService = NotificationService();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController msgController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  var _deptItemSelected = "CVE";

  var dept = "Department";

  var depts = [
    'CVE',
    'EEE',
    'MEE',
    'AGE',
    'MME',
    'MNE',
    'IPE',
  ];

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Send Message',
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
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
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
                  'Course title',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              FormBuilderTextField(
                name: 'Course Title',
                controller: titleController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Send Message',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              FormBuilderTextField(
                name: 'Send Message',
                maxLines: 5,
                controller: msgController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "What's the message?",
                  hintStyle: TextStyle(
                    color: Color(0xBF212121),
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(104),
              Center(
                child: FullButton(
                  color: ColorStyles.primaryBlue,
                  height: 48,
                  onPressed: () {
                    // adding new note
                    firestoreService.addMsg(
                      userDept,
                      codeController.text,
                      titleController.text,
                      msgController.text,
                    );

                    //clear the text controller
                    titleController.clear();
                    msgController.clear();
                    //close boxx
                    Navigator.pop(context);
                  },
                  text: 'Upload Message',
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
      ),
    );
  }
}
