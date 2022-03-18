import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:red_pill/widgets/details_widget.dart';

class DetailsScreen extends StatefulWidget {
  String status;
  DetailsScreen({Key? key, required this.status}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 17, 0),
        title: Text(widget.status),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) =>
                // margin: EdgeInsets.symmetric(
                //   horizontal: width > webScreenSize ? width * 0.3 : 0,
                //   vertical: width > webScreenSize ? 15 : 0,
                // ),
                DetailsWidget(
              snap: snapshot.data!.docs[index].data(),
              status: widget.status,
            ),
          );
        },
      ),
    );
  }
}
