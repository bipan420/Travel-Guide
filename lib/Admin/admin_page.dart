import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourist_guide/user_list_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tourist_guide/add_package_page.dart';

final _firestore = Firestore.instance;

class AdminHomePage extends StatefulWidget {
  static final id = 'adminPage';
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  bool showSpinner = false;
  void adminSignOut() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Details'),
        leading: null,
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          FlatButton(
            onPressed: adminSignOut,
            child: Text('Sign Out'),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:
                //  Container(
                //   margin: EdgeInsets.all(15.0),
                //   decoration: BoxDecoration(
                //       color: Colors.lightBlue,
                //       borderRadius: BorderRadius.circular(10.0)),
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                //   child: Column(
                //     children: <Widget>[
                //       Text('Name: Stainly Stewart'),
                //       Text('About Me: I am an American Gangster'),
                //     ],
                //   ),
                // ),

               StreamBuilder(
                  stream: _firestore.collection('admin').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text('Sorry the database is empty'),
                      );
                    } else {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          setState(() {
                            showSpinner = true;
                          });
                          break;

                        default:
                          return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot adminInfo =
                                  snapshot.data.documents[index];
                              return Container(
                                margin: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(10.0)),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Material(
                                  elevation: 14.0,
                                  shadowColor: Color(0x802196F3),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        //admin Image
                                        width:MediaQuery.of(context).size.width,
                                        child: CircleAvatar(
                                            radius: 100.0,
                                            backgroundImage: NetworkImage(
                                              '${adminInfo['image']}',
                                            ),
                                            child: Text('Me')),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),

                                      //admin Name
                                      Text('${adminInfo['name']}'),

                                      SizedBox(
                                        height: 10.0,
                                      ),

                                      //admin Details
                                      Container(
                                          //admin Image
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            '${adminInfo['details']}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                      }
                    }
                  }),
            
          ),
 Container(
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, UserListPage.id);
                      },
                      child: Container(
                        padding:EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                        height: 200,
                        
                        child: Text(
                          'Users',
                          style: TextStyle(fontSize: 22.0),
                        ),
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AddPackagePage.id);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                        height: 200.0,
                        
                        child: Text(
                          'Add Package',
                          style: TextStyle(fontSize: 22.0),
                        ),
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
