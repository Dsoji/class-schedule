import 'package:cloud_firestore/cloud_firestore.dart';

class UploadAssignmentService {
  //get collection of notes
  final CollectionReference classDetails =
      FirebaseFirestore.instance.collection("assignment");

  //upload

  //create
  Future<void> addAssignment(
      String assignmentTitle, String description, String urlDownload) {
    return classDetails.add({
      'title': assignmentTitle,
      'details': description,
      'downloadUrl': urlDownload,
    });
  }

  //read
  Stream<QuerySnapshot> getAsignmentStream() {
    final classStream = classDetails.snapshots();
    return classStream;
  }

  //update
  // Future<void> updateNote(String docID, String newNote) {
  //   return classDetails.doc(docID).update({
  //     'note': newNote,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //delete
  Future<void> deletNote(String docID) {
    return classDetails.doc(docID).delete();
  }
}

class UpdateProfiletService {
  //get collection of notes
  final CollectionReference classDetails =
      FirebaseFirestore.instance.collection("users");

  //upload

  //create
  // Future<void> addAssignment(
  //     String assignmentTitle, String description, String urlDownload) {
  //   return classDetails.add({
  //     'title': assignmentTitle,
  //     'details': description,
  //     'downloadUrl': urlDownload,
  //   });
  // }

  //read
  // Stream<QuerySnapshot> getAsignmentStream() {
  //   final classStream = classDetails.snapshots();
  //   return classStream;
  // }

  //update
  Future<void> updateDetails(
      String docID, String level, String dept, String name) {
    return classDetails.doc(docID).update({
      'level': level,
      'dept': dept,
      'name': name,
    });
  }

  //delete
  Future<void> deletNote(String docID) {
    return classDetails.doc(docID).delete();
  }
}
