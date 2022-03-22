// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class RegisterConfirmScreen extends StatefulWidget {
//   const RegisterConfirmScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterConfirmScreen> createState() => _RegisterConfirmScreenState();
// }

// class _RegisterConfirmScreenState extends State<RegisterConfirmScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 17, 0),
//         title: const Text('Register'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('register').doc('').snapshots(),
//         builder: (context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (ctx, index) =>
//                 // margin: EdgeInsets.symmetric(
//                 //   horizontal: width > webScreenSize ? width * 0.3 : 0,
//                 //   vertical: width > webScreenSize ? 15 : 0,
//                 // ),
                
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
