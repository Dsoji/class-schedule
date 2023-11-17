import 'package:cloud_firestore/cloud_firestore.dart';

class MaterialService {
  //get collection of notes
  final CollectionReference classDetails =
      FirebaseFirestore.instance.collection("course_materials");

  //create
  // Future<void> addNote(String note) {
  //   return classDetails.add({
  //     'note': note,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //read
  Stream<QuerySnapshot> getMaterialStream(String collectionId) {
    final notesStream = FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('materials')
        .snapshots();
    return notesStream;
  }

  //update
  // Future<void> updateNote(String docID, String newNote) {
  //   return classDetails.doc(docID).update({
  //     'note': newNote,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //delete
  // Future<void> deletNote(String docID) {
  //   return classDetails.doc(docID).delete();
  // }
}

class NotificationService {
  //get collection of notes
  final CollectionReference classDetails =
      FirebaseFirestore.instance.collection("messages");

  // create
  Future<void> addMsg(
      String collectionId, String code, String title, String msg) {
    return FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('notification')
        .add({
      'code': code,
      'title': title,
      'msg': msg,
      'timestamp': Timestamp.now(),
    });
  }

  //read
  Stream<QuerySnapshot> getMsgStream(String collectionId) {
    final notesStream = FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('notification')
        .snapshots();
    return notesStream;
  }

  //update
  // Future<void> updateNote(String docID, String newNote) {
  //   return classDetails.doc(docID).update({
  //     'note': newNote,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //delete
  // Future<void> deletNote(String docID) {
  //   return classDetails.doc(docID).delete();
  // }
}

class AssignmentService {
  //get collection of notes
  final CollectionReference classDetails =
      FirebaseFirestore.instance.collection("assignments");

  //create
  // Future<void> addNote(String note) {
  //   return classDetails.add({
  //     'note': note,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //read
  Stream<QuerySnapshot> getAssStream(String collectionId) {
    final notesStream = FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('ass')
        .snapshots();
    return notesStream;
  }

  //update
  // Future<void> updateNote(String docID, String newNote) {
  //   return classDetails.doc(docID).update({
  //     'note': newNote,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //delete
  // Future<void> deletNote(String docID) {
  //   return classDetails.doc(docID).delete();
  // }
}

class TimetableService {
  //create timetable
  Future<void> addTt(
    String collectionId,
    String code,
    String location,
    String formattedDateTime,
  ) {
    return FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('timetable')
        .add({
      'code': code,
      'location': location,
      'dateTime': formattedDateTime,
    });
  }

  // create
  // Future<void> addTt(String collectionId, String code, String location) {
  //   return FirebaseFirestore.instance
  //       .collection("${collectionId}")
  //       .doc('details')
  //       .collection('timetable')
  //       .add({
  //     'code': code,
  //     'location': location,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //read
  Stream<QuerySnapshot> getTtStream(String collectionId) {
    final notesStream = FirebaseFirestore.instance
        .collection("${collectionId}")
        .doc('details')
        .collection('timetable')
        .snapshots();
    return notesStream;
  }

  //update
  // Future<void> updateNote(String docID, String newNote) {
  //   return classDetails.doc(docID).update({
  //     'note': newNote,
  //     'timestamp': Timestamp.now(),
  //   });
  // }

  //delete
  // Future<void> deletNote(String docID) {
  //   return classDetails.doc(docID).delete();
  // }
}
