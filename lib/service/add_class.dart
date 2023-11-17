import 'package:cloud_firestore/cloud_firestore.dart';

class AddClassService {
  //collection to add class
  // final CollectionReference classDetails = FirebaseFirestore.instance
  //     .collection("${collectionId}")
  //     .doc('details')
  //     .collection('class');

  //create
  Future<void> addClass(String collectionId, String courseTitle,
      String courseCode, String theatre, String unit, String description) {
    return FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('class')
        .add({
      'title': courseTitle,
      'code': courseCode,
      'theatre': theatre,
      'unit': unit,
      'details': description,
    });
  }

  //read
  Stream<QuerySnapshot> getClassStream(String collectionId) {
    final classStream = FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('class')
        .snapshots();
    return classStream;
  }

  //update
  Future<void> updateNote(String collectionId, String docID, String newNote) {
    return FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('class')
        .doc(docID)
        .update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //delete
  Future<void> deletNote(String collectionId, String docID) {
    return FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('class')
        .doc(docID)
        .delete();
  }
}
