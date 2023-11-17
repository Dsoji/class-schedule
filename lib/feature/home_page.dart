// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:scheduler/service/firestore.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //firestpre
//   final MaterialService firestoreService = MaterialService();
//   //textcontroller
//   final TextEditingController textController = TextEditingController();

//   //dialogue box to add new date
//   void openNoteBox({String? docID}) {
//     showDialog(
//       context: context,
//       builder: ((context) => AlertDialog(
//             content: TextField(
//               controller: textController,
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   if (docID == null) {
//                     //adding new note
//                     firestoreService.addNote(textController.text);
//                   } else {
//                     firestoreService.updateNote(docID, textController.text);
//                   }

//                   //clear the text controller
//                   textController.clear();
//                   //close boxx
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   'Add',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.purpleAccent,
//         title: const Text(
//           'Hello, world!',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: openNoteBox,
//         child: const Icon(Icons.add),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: firestoreService.getMaterialStream(),
//           builder: (context, snapshot) {
//             //logic t get notes
//             if (snapshot.hasData) {
//               List notesList = snapshot.data!.docs;
//               //display as list
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: notesList.length,
//                 itemBuilder: (context, index) {
//                   //get each indv doc
//                   DocumentSnapshot document = notesList[index];
//                   String docID = document.id;

//                   //get note from each doc
//                   Map<String, dynamic> data =
//                       document.data() as Map<String, dynamic>;
//                   String noteText = data['note'];

//                   //display as list tile
//                   return ListTile(
//                     tileColor: Colors.orange,
//                     title: Text(noteText,
//                         style: const TextStyle(color: Colors.white)),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                             onPressed: () => firestoreService.deletNote(docID),
//                             icon: const Icon(Icons.delete)),
//                         const Gap(8),
//                         IconButton(
//                             onPressed: () => openNoteBox(docID: docID),
//                             icon: const Icon(Icons.settings)),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//             // if there exist to be no data
//             else {
//               return const Text("no notes");
//             }
//           }),
//     );
//   }
// }
