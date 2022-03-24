import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_pill/screens/register_confirm_screen.dart';

import '../models/user.dart' as model;
import '../providers/user_provider.dart';
import '../resources/auth_methods.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  final snap;
  const RegisterScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // String firstName = 'First Name';
  // String secondName = 'Second Name';
  // String vacStatus = 'Vacination Status';
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<UserProvider>(context).refreshUser();
  // }

  final time = [
    '00:00',
    '00:30',
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
    '24:00',
  ];
  var selectedTime;

  @override
  Widget build(BuildContext context) {
    // final model.User user = Provider.of<UserProvider>(context).getUser;

    var dateTime = DateTime.now().toString();

    TextEditingController FirstNameEditingController = TextEditingController();
    TextEditingController secondNameEditingController = TextEditingController();
    TextEditingController VacEditingController = TextEditingController();
    var DateTimeController = TextEditingController();

    return Scaffold(
      body: Container(
        // backgroundColor: Colors.grey.shade300,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                enabled: false,
                autofocus: false,
                controller: FirstNameEditingController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: (widget.snap['firstname']),
                  // FirebaseAuth.instance.currentUser!.uid == widget.snap['uid']
                  //     ? widget.snap['firstname']
                  //     : 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextFormField(
                enabled: false,
                autofocus: false,
                controller: secondNameEditingController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: (widget.snap['secondname']),
                  // FirebaseAuth.instance.currentUser!.uid == widget.snap['uid']
                  //     ? widget.snap['secondname']
                  //     : 'Second Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextFormField(
                enabled: false,
                autofocus: false,
                controller: VacEditingController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: (widget.snap['vacstatus']),
                  // FirebaseAuth.instance.currentUser!.uid == widget.snap['uid']
                  //     ? widget.snap['vacstatus']
                  //     : "Vaccination Status",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                iconSize: 0,
                autofocus: false,
                value: selectedTime,
                onChanged: (newValue) {
                  setState(() {
                    selectedTime = newValue;
                    checkTime(newValue!);
                    debugPrint(selectedTime);
                  });
                },
                items: time.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.arrow_drop_down),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Select Time:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // DateTimePicker(
              //   type: DateTimePickerType.dateTimeSeparate,
              //   dateMask: 'd MMM, yyyy',
              //   initialValue: DateTime.now().toString(),
              //   firstDate: DateTime(2000),
              //   lastDate: DateTime(2100),
              //   icon: Icon(Icons.event),
              //   dateLabelText: 'Date',
              //   timeLabelText: "Hour",
              //   selectableDayPredicate: (date) {
              //     // Disable weekend days to select from the calendar
              //     if (date == DateTime.now()) {
              //       return false;
              //     }
              //     return true;
              //   },
              //   onChanged: (val) => print(val),
              //   validator: (val) {
              //     print(val);
              //     return null;
              //   },
              //   onSaved: (val) => dateTime = val!,
              // ),
              Material(
                elevation: 5,
                color: Color(0xffd70826),
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    submit(dateTime);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const RegisterConfirmScreen(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Book",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(String datetime) async {
    String res = await AuthMethods().registerUser(
      uid: FirebaseAuth.instance.currentUser!.uid,
      firstname: widget.snap['firstname'],
      secondname: widget.snap['secondname'],
      vacstatus: widget.snap['vacstatus'],
      time: selectedTime,
    );

    if (res == 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Submitted')),
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
  }

  void checkTime(String time) async {
    // QuerySnapshot snapshot = await FirebaseFirestore.instance
    //     .collection('register')
    //     .doc()
    //     .collection(time)
    //     .get();
    // debugPrint(snapshot.docs.toString());;.
  }

  // void check() async {
  //   if (FirebaseAuth.instance.currentUser!.uid == widget.snap['uid']) {
  //     setState(() {
  //       firstName = widget.snap['firstname'];
  //       secondName = widget.snap['secondname'];
  //       vacStatus = widget.snap['vacname'];
  //     });
  //   } else {
  //     print('zeor');
  //   }
  // }
}
