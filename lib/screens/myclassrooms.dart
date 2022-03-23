import 'package:flutter/material.dart';
import 'package:red_pill/screens/details_screen.dart';
import 'package:red_pill/widgets/drawer.dart';

class MyClassRooms extends StatefulWidget {
  const MyClassRooms({Key? key}) : super(key: key);

  @override
  State<MyClassRooms> createState() => _MyClassRoomsState();
}

class _MyClassRoomsState extends State<MyClassRooms> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffd70826),
          elevation: 0,
        ),
        drawer: NavDrawer(),
        backgroundColor: Color(0xffd70826),
        body: Column(
          children: [
            Image.asset(
              'assets/redvacc.jpg',
              height: 200,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.61,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'Types of ClassRooms',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(status: 'Fully vaccinated'),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 20, left: 10),
                                width: 280,
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Color(0xffd70826),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('ClassroomS505 \nType for Vacinated \n Students',style: TextStyle(color: Colors.white,fontSize: 20),),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Image.asset('assets/class1.jpg',height: 80,),
                                               ],
                                             )
                                          ],
                                        ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(status: 'One dose'),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 280,
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Color(0xffd70826),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                        child:  Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('ClassroomS505 \nType for One Dose \n Students',style: TextStyle(color: Colors.white,fontSize: 20),),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Image.asset('assets/class2.jpg',height: 80,),
                                               ],
                                             )
                                          ],
                                        ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(status: 'Not vaccinated'),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                width: 280,
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Color(0xffd70826),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                        child:  Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('ClassroomS505 \nType for Non Vacinated \n Students',style: TextStyle(color: Colors.white,fontSize: 20),),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Image.asset('assets/class3.jpg',height: 80,),
                                               ],
                                             )
                                          ],
                                        ),
                                        
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
