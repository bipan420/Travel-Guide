import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'user_details_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UsersListPage extends StatefulWidget {
  static final id = 'userList';

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'User List',
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: new UserList(),
        ));
  }
}

class UserList extends StatelessWidget {
  static String userName;
  static String userImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Container(
        //     child: Text(
        //   'Users List',
        //   style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
        // )),
        Expanded(
          child: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('The users field is empty '),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot userInfo =
                          snapshot.data.documents[index];

                      return Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 10.0),
                                child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                '${userInfo['image']}'),
                                          ),
                                          title: Text(
                                            '${userInfo['name']}',
                                            style: TextStyle(
                                                fontFamily: 'Sourse Sans Pro',
                                                fontSize: 20.0,
                                                color: Colors.teal[900]),
                                          ),
                                          subtitle: Text('I am a user'),
                                          trailing:
                                              Icon(Icons.keyboard_arrow_right),
                                          onTap: () {
                                            userName = '${userInfo['name']}';
                                            userImage = '${userInfo['image']}';
                                            print(userName);
                                            //Navigator.pushNamed(context, UserDetailsPage.id);
                                          },
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      ],
    );
  }
}
