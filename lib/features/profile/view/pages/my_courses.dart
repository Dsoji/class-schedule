// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/features/profile/widget/expanded_widget.dart';
import 'package:scheduler/service/add_class.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    final AddClassService firestoreService = AddClassService();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            'My Courses',
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
          child: StreamBuilder<QuerySnapshot>(
              stream: firestoreService.getClassStream(userDept),
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
                      String titleText = data['title'];
                      String codeText = data['code'];
                      String theatreText = data['theatre'];
                      String unitText = data['unit'];
                      String detText = data['details'];

                      //display as list tile
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16.0, right: 16, left: 16),
                        child: ExpandWidget(
                          title: titleText,
                          course: codeText,
                          location: theatreText,
                          unit: unitText,
                          time: detText,
                        ),
                      );
                    },
                  );
                }
                // if there exist to be no data
                else {
                  return const Text("no notifications");
                }
              }),
        ));
  }
}
