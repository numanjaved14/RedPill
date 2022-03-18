// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:red_pill/screens/home_screen.dart';

// class Stream extends StatefulWidget {
//   const Stream({Key? key}) : super(key: key);

//   @override
//   State<Stream> createState() => _StreamState();
// }

// List counter(final snap) {
//   int nvac = 0, ovac = 0, fvac = 0;
//   if (snap['vacstatus'] == 'Not vaccinated') {
//     nvac++;
//   }
//   if (snap['vacstatus'] == 'One dose') {
//     ovac++;
//   }
//   if (snap['vacstatus'] == 'Fully vaccinated') {
//     fvac++;
//   }
//   return [
//     nvac,
//     ovac,
//     fvac,
//   ];
// }

// class _StreamState extends State<Stream> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       builder: (context,
//           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return ListView(children: [
//           HomeScreen(
//             snap: snapshot.data!.docs[index].data(),
//           ),
//         ]
//             // margin: EdgeInsets.symmetric(
//             //   horizontal: width > webScreenSize ? width * 0.3 : 0,
//             //   vertical: width > webScreenSize ? 15 : 0,
//             // ),

//             );
//       },
//     );
//   }
// }
