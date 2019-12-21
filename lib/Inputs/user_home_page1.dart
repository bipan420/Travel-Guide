import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tourist_guide/services/auth_service.dart';
import 'package:tourist_guide/start_screen.dart';
import 'package:tourist_guide/user_model.dart';
import 'package:tourist_guide/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

String packageName;
class UserHome1 extends StatefulWidget {
  final id = 'userSetting';
  final String userId;
  UserHome1(this.userId);
  @override
  _UserHome1State createState() => _UserHome1State();
}

class _UserHome1State extends State<UserHome1> {
final _auth = FirebaseAuth.instance;
bool showSpinner = false;


String userName;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome $userName'),
        
                       
      // ),
      body: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
      //print('UserName::::${snapshot.data['name']}');
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        User user = User.fromDoc(snapshot.data);
        userName = user.name;
        packageName = user.chosenPackage;
        
        return Container(
        color: Colors.blue,
        child: SafeArea(
          
          child: SingleChildScrollView(
                      child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  
                  Text(
            'Welcome  $userName',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              
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



                  ClipRRect(
                      
            borderRadius: BorderRadius.circular(10.0),
            
        
                      child: AspectRatio(
                    aspectRatio: 485.0 / 384.0,
                    child: FittedBox(child: Image.network(user.packageImage),fit: BoxFit.fill,),
                  ),
                   ),

                   SizedBox(height: 10,),




                  Text(
            user.chosenPackage,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              
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
                    '${user.packageDays.toString()} days',
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
              ' Package Route',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
                  SizedBox(height: 5.0,),

                 Container(
                   padding: EdgeInsets.all(10),
                   
        //               shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(50.0),
        //     ),
        // ),
                      child: AspectRatio(
                    aspectRatio: 485.0 / 384.0,
                    child: FittedBox(child: Image.network(user.packageRoute),fit: BoxFit.fill,),
                  ),
                   ),


            //       Container(
            // height: 130.0,
            // child: ListView(scrollDirection: Axis.horizontal,
            // children: <Widget>[
            //   Stack(children: <Widget>[
            //     Container(
            //    height: 100,
            //    width: 110,
            //    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
            //    child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0),)),

            //  ),
            //  Positioned(
            //    bottom: 0.0,
            //    left: 5.0,
            //                   child: Container(
                   
            //        height: 30,
            //        width: 100,
            //        child: Text('Visit Pokhara',style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),),
            //      ),
            //  )
            //   ],)
            //   ,
            //   Card(
            //     color: Colors.teal,
            //     child: Column(children: <Widget>[
            //       Text('21 sept 2019'),
            //       Text('visit pokhara'),
            //     ],)
            //   ),
            //  Container(
            //    height: 100,
            //    width: 110,
            //    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
            //    child: Center(child: Text('Day 1',style: TextStyle(fontSize: 20.0),)),

            //  )
              
            // ],),
            //       )



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