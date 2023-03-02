import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks {
  final String? id;
  final String title;
  final String dueDate;
  final String status;

  Tasks({
    this.id,
    required this.title,
    required this.dueDate,
    required this.status,
  });

  Tasks.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!["title"],
        dueDate = doc.data()!["DueDate"],
        status = doc.data()!["status"];
}
