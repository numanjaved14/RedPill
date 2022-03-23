import 'package:flutter/material.dart';
import 'package:red_pill/widgets/drawer.dart';

class MyClassRooms extends StatefulWidget {
  const MyClassRooms({ Key? key }) : super(key: key);

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
        body:  Column(
            children: [
              Image.asset('assets/redvacc.jpg',height: 200,),
             
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.61,
                     
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text('Types of ClassRooms',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20,left: 10),
                                      width: 280,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color:  Color(0xffd70826),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                     Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: 280,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color:  Color(0xffd70826),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                     Container(
                                       
                                      margin: EdgeInsets.only(top: 20,right: 10),
                                      width: 280,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color:  Color(0xffd70826),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)
                                        )
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