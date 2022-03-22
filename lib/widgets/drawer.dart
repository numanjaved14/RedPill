import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_pill/screens/login_screen.dart';
import '../widgets/stream.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: const Text('Book'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Stream(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Log out',
                // style: TextStyle(color: Colors.white),
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
    );
  }
}
