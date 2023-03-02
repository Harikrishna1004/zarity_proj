import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/tasks_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Tasks>> retrieveTasks() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("tasks").get();
    return snapshot.docs
        .map((docSnapshot) => Tasks.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
