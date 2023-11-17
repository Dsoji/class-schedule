// import 'package:class_scheduler/features/materials/widget/course_tile.dart';
// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/features/home/model/assignment_model.dart';
import 'package:scheduler/features/home/view/pages/assignment_view.dart';
import 'package:scheduler/features/home/widget/assignment_widget.dart';
import 'package:scheduler/service/firestore.dart';

import '../../../../core/const/const_barrel.dart';

// import '../model/course_material_model.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  final AssignmentService firestoreService = AssignmentService();
  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Assignment',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'View all assignment for courses',
                  style: AppTextStyles.regular12.copyWith(color: Colors.black),
                ),
              ),
              const Gap(10),
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
              const Gap(10),
              SizedBox(
                height: 550,
                child: StreamBuilder<QuerySnapshot>(
                    stream: firestoreService.getAssStream(
                      userDept,
                    ),
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
                            String titleText = data['name'];
                            String courseText = data['course_code'];
                            // String theatreText = data['theatre'];
                            // String unitText = data['unit'];
                            String detText = data['details'];

                            //display as list tile
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: AssignmentPreview(
                                  title: titleText,
                                  course: courseText,
                                  date: assignmentDets[index].date,
                                  details: detText,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AssignmentsView(
                                                title: titleText,
                                                course: assignmentDets[index]
                                                    .course,
                                                date:
                                                    assignmentDets[index].date,
                                                details: detText,
                                              )),
                                    );
                                  }),
                            );
                          },
                        );
                      }
                      // if there exist to be no data
                      else {
                        return const Text("no classes");
                      }
                    }),
              ),

              // SizedBox(
              //   child: ListView.builder(
              //     itemCount: assignmentDets.length,
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return AssignmentPreview(
              //         course: assignmentDets[index].course,
              //         title: assignmentDets[index].title,
              //         date: assignmentDets[index].date,
              //         details: assignmentDets[index].details,
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => AssignmentsView(
              //                       title: assignmentDets[index].title,
              //                       course: assignmentDets[index].course,
              //                       date: assignmentDets[index].date,
              //                       details: assignmentDets[index].details,
              //                     )),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),

              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
