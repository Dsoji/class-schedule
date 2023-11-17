// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/const/const_barrel.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/service/firestore.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    final NotificationService firestoreService = NotificationService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Notification',
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
      body: SizedBox(
        height: 700,
        child: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getMsgStream(userDept),
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
                    // String codeText = data['code'];
                    // String theatreText = data['theatre'];
                    // String unitText = data['unit'];
                    String detText = data['msg'];

                    //display as list tile
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16.0, right: 16, left: 16),
                      child: NotifyContainer(
                        title: titleText,
                        type: detText,
                        image: ImageAssets.book,
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
      ),
    );
  }
}

class NotifyContainer extends StatelessWidget {
  final String type;
  final String image;
  final String title;

  const NotifyContainer(
      {super.key,
      required this.type,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 159,
      height: 65,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: 159,
            height: 65,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                    // width: 149,
                    height: 25,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(width: 15, height: 15, image),
                        const Gap(8),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 25,
                  child: Text(
                    type,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 12,
                  top: 45,
                  child: Text(
                    '26 Aug 2023 at 7:30 am',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
