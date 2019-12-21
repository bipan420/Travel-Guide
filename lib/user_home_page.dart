import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tourist_guide/choose_package_page.dart';
import 'package:tourist_guide/package_model.dart';
import 'package:tourist_guide/services/auth_service.dart';
import 'package:tourist_guide/user_model.dart';
import 'package:tourist_guide/utilities/constants.dart';
import 'package:tourist_guide/Inputs/add_user_page.dart';
import 'user_list_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

String package = pkgPrice;
final _firestore = Firestore.instance;
class UserHome extends StatefulWidget {
  static final id = 'userHome';
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String username = UserList.userName;
  String userImage = UserList.userImage;
  String name;
  String image;
  String details;
  String duration;



// Future<List<MyPackage>> getPackage() async {
//   CollectionReference ref = Firestore.instance.collection('tourPackage');
//   QuerySnapshot packageQuery = await ref.where("name",isEqualTo:packageName).getDocuments();
//   HashMap<String, dynamic> packageHashMap = new HashMap<String, dynamic>();
//   packageQuery.documents.forEach((document){
//     packageHashMap.putIfAbsent(document['id'], () => new MyPackage(
//       name: document['name'],
//       details: document['details'],

//     ));
//   });
//   return packageHashMap.values.toList();
    
// }

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('tourPackage').where("price", isEqualTo:package)
        .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final packages = snapshot.data.documents;
        for(var package in packages){
          name = package.data['name'];
          image = package.data['image'];
          details = package.data['details'];
          duration = package.data['duration'];
          

        }
        
        print('PackageName::::$package');
        
        //print(snapshot.data['name']);
        return Container(
        color: Colors.blue,
        child: SafeArea(
          
          child: SingleChildScrollView(
                      child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  
                  Text(
            '',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              color: Colors.white,
            ),
                  ),
                  SizedBox(
            height: 20.0,
                  ),
            //       CircleAvatar(
            // radius: 50.0,
            // backgroundImage: NetworkImage('$image'),
            //       ),



                  Card(
                      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
        ),
                      child: AspectRatio(
                    aspectRatio: 485.0 / 384.0,
                    child: FittedBox(child: Image.network("$image"),fit: BoxFit.fill,),
                  ),
                   ),




                  Text(
            '$name',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              color: Colors.white,
            ),
                  ),
                  Text(
            'Sub name for the package',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
                  ),
                  SizedBox(
            width: 400.0,
            height: 20.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
                  ),
                  SizedBox(
            height: 30.0,
                  ),
                 
                  
                  Column(
              children: <Widget>[
                Text(
                  'Total package days',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                CircularPercentIndicator(
                  radius: 180.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 15.0,
                  percent: 1.0,
                  center: new Text(
                    '$duration',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.white),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.blueGrey,
                  progressColor: Colors.greenAccent,
                )
              ],
            ),
                  SizedBox(
            width: 400.0,
            height: 20.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
                  ),

//Schedules starts here
                  Text(
              ' Package Schedule',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
                  SizedBox(height: 5.0,),



                  Container(
            height: 130.0,
            child: ListView(scrollDirection: Axis.horizontal,
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
               height: 100,
               width: 110,
               decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
               child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0),)),

             ),
             Positioned(
               bottom: 0.0,
               left: 5.0,
                              child: Container(
                   
                   height: 30,
                   width: 100,
                   child: Text('Visit Pokhara',style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),),
                 ),
             )
              ],)
              ,
              Card(
                color: Colors.teal,
                child: Column(children: <Widget>[
                  Text('21 sept 2019'),
                  Text('visit pokhara'),
                ],)
              ),
             Container(
               height: 100,
               width: 110,
               decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
               child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0),)),

             )
              
            ],),
                  )



                ],
              ),
          ),
        ),
      );
         
      },
    ),
      );
  }
}






















class MyPackage extends StatelessWidget {
  final String name;
  final String details;
  MyPackage({this.name,this.details});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: SafeArea(
          
          child: SingleChildScrollView(
                  child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  radius: 50.0,
                  //backgroundImage: NetworkImage('$userImage'),
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Sub name for the package',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
               
                
                Column(
                    children: <Widget>[
                      Text(
                        'Total package days',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      CircularPercentIndicator(
                        radius: 180.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 15.0,
                        percent: 1.0,
                        center: new Text(
                          "10 Days",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                              color: Colors.white),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.blueGrey,
                        progressColor: Colors.greenAccent,
                      )
                    ],
                  ),
                SizedBox(
                  width: 400.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),

//Schedules starts here
                Text(
                    ' Package Schedule',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                SizedBox(height: 5.0,),



                Container(
                  height: 130.0,
                  child: ListView(scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                     height: 100,
                     width: 110,
                     decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                     child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0),)),

                   ),
                   Positioned(
                     bottom: 0.0,
                     left: 5.0,
                                    child: Container(
                         
                         height: 30,
                         width: 100,
                         child: Text('Visit Pokhara',style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),),
                       ),
                   )
                    ],)
                    ,
                    Card(
                      color: Colors.teal,
                      child: Column(children: <Widget>[
                        Text('21 sept 2019'),
                        Text('visit pokhara'),
                      ],)
                    ),
                   Container(
                     height: 100,
                     width: 110,
                     decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                     child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0),)),

                   )
                    
                  ],),
                )



              ],
            ),
          ),
        ),
      );
  }
}