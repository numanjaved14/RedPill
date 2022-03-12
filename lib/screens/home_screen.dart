import 'package:flutter/material.dart';
import 'package:red_pill/models/user.dart' as model;
import 'package:red_pill/providers/user_provider.dart';
import 'package:red_pill/resources/auth_methods.dart';
import 'package:red_pill/widgets/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Map? worldData;

  @override
  void initState() {
    initData();
    // TODO: implement initState
    super.initState();
  }

  void initData() async {
    model.User data = await AuthMethods().getUserDetails();

    debugPrint(UserProvider().usersData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              // clipper: MyClipper(),
              child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xffd70826),
                    image: DecorationImage(
                        image: AssetImage("assets/logostaffs.jpg")),
                  )),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF303030),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Newest updates",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF303030),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // if (worldData == null)
                  //   const CircularProgressIndicator()
                  // else
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 30,
                          color: Color(0xFFB7B7B7).withOpacity(.16),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '1',
                          style: TextStyle(
                            color: const Color(0xFF36C12C),
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: const Color(0xFFFF8748),
                          ),
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                            color: Color(0xFFFF4848),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Spread of Virus",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF303030),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: Color(0xFFB7B7B7).withOpacity(.16),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
