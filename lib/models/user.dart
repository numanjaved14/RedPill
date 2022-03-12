import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String firstname;
  final String secondname;
  final String email;
  final String password;
  final vacstatus;
  final String uid;

  const User({
    required this.firstname,
    required this.secondname,
    required this.email,
    required this.password,
    required this.vacstatus,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'secondname': secondname,
        'email': email,
        'password': password,
        'vacstatus': vacstatus,
        'uid': uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return User(
      firstname: snapShot['firstname'],
      secondname: snapShot['secondname'],
      email: snapShot['email'],
      password: snapShot['password'],
      vacstatus: snapShot['vacstatus'],
      uid: snapShot['uid'],
    );
  }
}
