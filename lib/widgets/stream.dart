import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:red_pill/screens/home_screen.dart';
import 'package:red_pill/screens/register_screen.dart';

class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 17, 0),
        title: Text('Booking Screen'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // return ListView.builder(
          //   itemCount: snapshot.data!.docs.length,
          //   itemBuilder: (ctx, index) =>
          //       // margin: EdgeInsets.symmetric(
          //       //   horizontal: width > webScreenSize ? width * 0.3 : 0,
          //       //   vertical: width > webScreenSize ? 15 : 0,
          //       // ),
          //       DetailsWidget(
          //     snap: snapshot.data!.docs[index].data(),
          //     status: widget.status,
          //   ),
          // );
          return RegisterScreen(snap: snapshot.data!.data());
        },
      ),
    );
  }
}
