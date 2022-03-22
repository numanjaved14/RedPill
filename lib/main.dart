import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:red_pill/providers/user_provider.dart';
import 'package:red_pill/screens/home_screen.dart';
import 'package:red_pill/screens/login_screen.dart';
import 'package:red_pill/screens/register_screen.dart';
import 'package:red_pill/widgets/stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Red Pill',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //final
        home: _auth.currentUser == null
            ? const LoginScreen()
            : const HomeScreen(),
        //test
        // home: Stream(),
      ),
    );
  }
}
