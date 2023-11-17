// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/core/widgets/widget_barrel.dart';
import 'package:scheduler/features/teacher/class/add_class.dart';
import 'package:scheduler/features/teacher/class/edit_class.dart';
import 'package:scheduler/service/add_class.dart';

class ViewClass extends StatefulWidget {
  const ViewClass({super.key});

  @override
  State<ViewClass> createState() => _ViewClassState();
}

class _ViewClassState extends State<ViewClass> {
  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    final AddClassService firestoreService = AddClassService();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            'View Class',
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
              const Gap(12),
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
                  hintText: 'Search for class ',
                  hintStyle: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
              const Gap(32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'My courses ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '(2nd semester)',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.75),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(12),
              SizedBox(
                height: 550,
                child: StreamBuilder<QuerySnapshot>(
                    stream: firestoreService.getClassStream(
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
                            String titleText = data['title'];
                            String codeText = data['code'];
                            String theatreText = data['theatre'];
                            String unitText = data['unit'];
                            String detText = data['details'];

                            //display as list tile
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ClassDetails(
                                title: titleText,
                                code: codeText,
                                unit: unitText,
                                venue: theatreText,
                              ),
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

              const Gap(32),

              Center(
                child: OutlinButton(
                  text: 'Continue',
                  width: double.infinity,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddClass()),
                    );
                  },
                  height: 48,
                  color: const Color.fromRGBO(55, 127, 230, 1),
                ),
              ),
            ],
          ),
        ));
  }
}

class ClassDetails extends StatelessWidget {
  final String title;
  final String code;
  final String venue;
  final String unit;

  const ClassDetails(
      {super.key,
      required this.title,
      required this.code,
      required this.venue,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Text(
              code,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditClass()),
                );
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Color(0xFF055FE0),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFF005B),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 4),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Venue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: ': ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: venue,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFC00CC),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 4),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Course title',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: ' :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFF055FE0),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 4),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Date and Time',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ': ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '8AM - 10AM, Monday',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const ShapeDecoration(
                  color: Color(0xFF055FE0),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 4),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Unit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: ': ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '${unit} units',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
