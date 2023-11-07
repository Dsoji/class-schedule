import 'package:cloud_firestore/cloud_firestore.dart';

class AddClassService {
  //get collection of notes
  final CollectionReference classDetails =
      FirebaseFirestore.instance.collection("class");

  //create
  Future<void> addClass(String courseTitle, String courseCode, String theatre,
      String unit, String description) {
    return classDetails.add({
      'title': courseTitle,
      'code': courseCode,
      'theatre': theatre,
      'unit': unit,
      'details': description,
    });
  }

  //read
  Stream<QuerySnapshot> getClassStream() {
    final classStream = classDetails.snapshots();
    return classStream;
  }

  //update
  Future<void> updateNote(String docID, String newNote) {
    return classDetails.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //delete
  Future<void> deletNote(String docID) {
    return classDetails.doc(docID).delete();
  }
}
