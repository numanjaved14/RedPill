import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_pill/screens/home_screen.dart';
import 'package:red_pill/screens/login_screen.dart';
import 'package:red_pill/screens/myaccountspage.dart';
import 'package:red_pill/screens/myclassrooms.dart';
import '../widgets/stream.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String email = 'E-mail';
  String uName = 'Name';
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  void getData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      email = snapshot['email'];
      uName = snapshot['firstname'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    late AnimationController _animationController;
    late StreamController<bool> isSidebarOpenedStreamController;
    // late Stream<bool> isSidebarOpenedStream;
    late StreamSink<bool> isSidebarOpenedSink;
    final _animationDuration = const Duration(milliseconds: 500);
    // UserModel loggedInUser = UserModel();

    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: Color(0xffd70826),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      uName,
                      // "${loggedInUser.firstName} ${loggedInUser.secondName}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      email,
                      //    "${loggedInUser.email}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                      radius: 40,
                    ),
                  ),
                  Divider(
                    height: 64,
                    thickness: 0.5,
                    color: Colors.white.withOpacity(0.3),
                    indent: 32,
                    endIndent: 32,
                  ),
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    )),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: const Text(
                      'My Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyAccountsPage(),
                    )),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'My Bookings',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Stream(),
                    )),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.web_outlined,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Classroom Levels',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyClassRooms(),
                    )),
                  ),
                  Divider(
                    height: 64,
                    thickness: 0.5,
                    color: Colors.white,
                    indent: 32,
                    endIndent: 32,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    // onTap: () => FirebaseAuth.instance.signOut().then(
                    //       (value) => Navigator.of(context).pushReplacement(
                    //         MaterialPageRoute(
                    //           builder: (context) => const LoginScreen(),
                    //         ),
                    //       ),
                    //     ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () => FirebaseAuth.instance.signOut().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
