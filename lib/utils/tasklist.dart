// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:zarity_proj/getuserdata.dart';

// class TaskList extends StatelessWidget {
//   // List reqTask = [];

//   // List<dynamic> docIds = [];
//   // List<Map<String, dynamic>> data = [];
//   // List imm = [];
//   // List tw = [];
//   // List tm = [];

//   // Future getDocId() async {
//   //   CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
//   //   await FirebaseFirestore.instance
//   //       .collection('tasks')
//   //       .get()
//   //       .then((value) => value.docs.forEach((document) async {
//   //             log(document.reference.id.toString());
//   //             docIds.add(document.reference.id);

//   //             DocumentSnapshot<Object?> d =
//   //                 await tasks.doc(document.reference.id).get();
//   //             log(d.data().toString());
//   //             data.add(d.data() as Map<String, dynamic>);
//   //           }));

//   //   for (var element in data) {
//   //     if (element['DueDate'] == 'immediate') {
//   //       imm.add(element);
//   //     } else if (element['DueDate'] == 'This week') {
//   //       tw.add(element);
//   //     } else {
//   //       tm.add(element);
//   //     }
//   //   }
//   // }

//   TaskList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//       child: Expanded(
//           child: FutureBuilder(
//         future: getDocId(),
//         builder: (context, snapshot) {
//           log(snapshot.hasData.toString());
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: imm.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             // GetUserData(
//                             //   documentId: docIds[index],
//                             //   field: 'status',
//                             // ),
//                             Text(imm[index]['DueDate']),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8, horizontal: 8),
//                               decoration: BoxDecoration(
//                                   color: Colors.indigo.shade900,
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: ListTile(
//                                 onTap: () {},
//                                 leading: const Icon(
//                                   Icons.timelapse_rounded,
//                                   size: 30,
//                                   color: Colors.white,
//                                 ),
//                                 title: Text(
//                                   imm[index]['title'],
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Text(
//                                   imm[index]['status'],
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 contentPadding: const EdgeInsets.all(10),
//                               ),
//                             ),
//                           ],
//                         );
//                       }),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: tw.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             // GetUserData(
//                             //   documentId: docIds[index],
//                             //   field: 'status',
//                             // ),
//                             Text(tw[index]['DueDate']),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8, horizontal: 8),
//                               decoration: BoxDecoration(
//                                   color: Colors.indigo.shade900,
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: ListTile(
//                                 onTap: () {},
//                                 leading: const Icon(
//                                   Icons.timelapse_rounded,
//                                   size: 30,
//                                   color: Colors.white,
//                                 ),
//                                 title: Text(
//                                   tw[index]['title'],
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Text(
//                                   tw[index]['status'],
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 contentPadding: const EdgeInsets.all(10),
//                               ),
//                             ),
//                           ],
//                         );
//                       }),
//                 ),
//               ],
//             );
//           } else {
//             return const CircularProgressIndicator();
//           }
//         },
//       )),
//     );
//   }
// }
