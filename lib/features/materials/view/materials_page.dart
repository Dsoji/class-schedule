// import 'package:class_scheduler/features/materials/widget/course_tile.dart';
// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/core/model/usermodel.dart';
import 'package:scheduler/service/firestore.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const/const_barrel.dart';
// import '../model/course_material_model.dart';

class MaterialsPage extends StatefulWidget {
  const MaterialsPage({super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  final MaterialService firestoreService = MaterialService();
  @override
  Widget build(BuildContext context) {
    String userDept = Provider.of<UserRoleProvider>(context).userDept;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Course Materials',
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
        height: 550,
        child: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getMaterialStream(userDept),
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
                    // String codeText = data['code'];
                    // String theatreText = data['theatre'];
                    // String unitText = data['unit'];
                    // String detText = data['details'];

                    //display as list tile
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ListTile(
                        leading: Image.asset(
                          ImageAssets.pdf,
                          width: 25.17,
                          height: 20,
                        ),
                        title: Text(titleText),
                        trailing: Icon(Icons.download, color: Colors.grey),
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
    );
  }
}
