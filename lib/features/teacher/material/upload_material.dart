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

class UploadMaterial extends StatefulWidget {
  const UploadMaterial({super.key});

  @override
  State<UploadMaterial> createState() => _UploadMaterialState();
}

class _UploadMaterialState extends State<UploadMaterial> {
  //text controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detController = TextEditingController();

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future<void> uploadDocument() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: const CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
    try {
      if (titleController.text.isEmpty ||
          detController.text.isEmpty ||
          pickedFile == null) {
        return;
      }

      String userDept =
          Provider.of<UserRoleProvider>(context, listen: false).userDept;

      final storage = FirebaseStorage.instance;
      final firestore = FirebaseFirestore.instance;

      final file = File(pickedFile!.path!);
      final fileName = pickedFile!.name;

      // Check if the file is a document
      if (!file.path.endsWith('.pdf')) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Invalid file type'),
            content: Text('Please select a PDF file to upload.'),
          ),
        );
        return;
      }

      // Upload the document to Firebase Storage
      final storageRef = storage.ref().child('assignments/$fileName');
      final uploadTask = storageRef.putFile(file);

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL of the uploaded document
      final downloadUrl = await storageRef.getDownloadURL();

      // Add the name, details, and download URL to Firestore
      await FirebaseFirestore.instance
          .collection(userDept)
          .doc('details')
          .collection('materials')
          .add({
        'name': titleController.text,
        'details': detController.text,
        'document_url': downloadUrl,
      });

      // Clear text controllers and file selection
      titleController.clear();
      detController.clear();

      setState(() {
        pickedFile = null;
      });

      // Close the progress dialog
      Navigator.pop(context);
    } catch (error) {
      print(error.toString());
      // Handle errors that could occur when uploading the file or adding the record to Firestore
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error uploading document'),
          content: Text(error.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Upload Materials',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name of materials',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              FormBuilderTextField(
                name: 'Materials',
                controller: titleController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Name of materials',
                  hintStyle: TextStyle(
                    color: Color(0xBF212121),
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(24),
              GestureDetector(
                onTap: selectFile,
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
              const Gap(20),
              if (pickedFile != null)
                ListTile(
                  leading: Image.asset(
                    ImageAssets.doc,
                    width: 25.17,
                    height: 20,
                  ),
                  title: Text(pickedFile!.name),
                ),
              const Gap(4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(6),
              FormBuilderTextField(
                name: 'Materials',
                maxLines: 5,
                controller: detController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Details(optional)',
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
                  onPressed: uploadDocument,
                  text: 'Upload Materials',
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
