import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_pill/providers/user_provider.dart';
import '../models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // StorageMethods _storageMethods = StorageMethods();
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    // DocumentSnapshot snap =
    //     await _firebaseFirestore.collection('users').doc().get();

    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        model.User user = model.User(
          email: doc["email"],
          uid: _auth.currentUser!.uid,
          password: doc["password"],
          firstname: doc["firstname"],
          secondname: doc["secondname"],
          vacstatus: doc["vacstatus"],
        );
        UserProvider().users.addAll(user.toJson());
        // print(user.email);
        // print(doc["email"]);
      });
      print(UserProvider().users);
    });

    // UserProvider().users = model.User.fromSnap(snap) as dynamic;
    // print(snap["email"]);
    DocumentSnapshot? snap;
    return model.User.fromSnap(snap!);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String firstname,
    required String secondname,
    required vacstatus,
  }) async {
    String res = 'Some error occured.';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          firstname.isNotEmpty ||
          secondname.isNotEmpty ||
          vacstatus.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // String photoUrl = await StorageMethods()
        //     .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          email: email,
          uid: _auth.currentUser!.uid,
          password: password,
          firstname: firstname,
          secondname: secondname,
          vacstatus: vacstatus,
        );

        _firebaseFirestore.collection('users').doc(_auth.currentUser!.uid).set(
              user.toJson(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Success';
      } else {
        res = 'Please enter all the Fields';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
