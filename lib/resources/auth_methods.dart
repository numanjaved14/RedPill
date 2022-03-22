import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_pill/providers/user_provider.dart';
import '../models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List counted = [0, 0, 1];
  int nvac = 0, ovac = 0, fvac = 0;

  Future<model.User> getSingleDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // StorageMethods _storageMethods = StorageMethods();
  Future<List> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    // DocumentSnapshot snap =
    //     await _firebaseFirestore.collection('users').doc().get();

    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // model.User user = model.User(
        //   email: (doc.data() as Map<String, dynamic>)["email"],
        //   uid: _auth.currentUser!.uid,
        //   password: (doc.data() as Map<String, dynamic>)["password"],
        //   firstname: (doc.data() as Map<String, dynamic>)["firstname"],
        //   secondname: (doc.data() as Map<String, dynamic>)["secondname"],
        //   vacstatus: (doc.data() as Map<String, dynamic>)["vacstatus"],
        // );
        // UserProvider()
        //     .users
        //     .addAll(model.User.fromSnap(doc) as Map<String, dynamic>);
        // print(doc.data());
        // print(doc["email"]);
        counted = counter(doc.data());
      });
      // print(UserProvider().users);
    });

    // UserProvider().users = model.User.fromSnap(snap) as dynamic;
    // print(snap["email"]);
    // DocumentSnapshot? snap;
    // return model.User.fromSnap(snap!);
    print(counted.toString());
    return counted;
  }

  List counter(final snap) {
    if (snap['vacstatus'] == 'Not vaccinated') {
      nvac++;
    }
    if (snap['vacstatus'] == 'One dose') {
      ovac++;
    }
    if (snap['vacstatus'] == 'Fully vaccinated') {
      fvac++;
    }
    print([
      nvac,
      ovac,
      fvac,
    ]);
    return [
      nvac,
      ovac,
      fvac,
    ];
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

  Future<String> registerUser({
    required String firstname,
    required String secondname,
    required String vacstatus,
    required String time,
    required String uid,
  }) async {
    String res = 'Some error occured.';
    try {
      if (time.isNotEmpty ||
          firstname.isNotEmpty ||
          secondname.isNotEmpty ||
          vacstatus.isNotEmpty) {
        model.RegisterUser user = model.RegisterUser(
          firstname: firstname,
          secondname: secondname,
          vacstatus: vacstatus,
          time: time,
          uid: uid,
        );

        _firebaseFirestore.collection('register').doc(time).set(
              user.toJson(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
