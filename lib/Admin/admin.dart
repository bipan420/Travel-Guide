import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'admin_home_page.dart';
import 'admin_setting_page.dart';
import 'users_list_page.dart';

class AdminPage extends StatefulWidget {
  static final id = 'adminPage';
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _currentIndex = 0;

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AdminHomePage();

      case 1:
        return UsersListPage();

      case 2:
        return AdminSettingPage();

      default:
        return AdminHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Admin: Bishnu'),
        // ),
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          //index: _currentIndex,
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          currentIndex: _currentIndex,
          onTap: (value){
            _currentIndex = value;
            setState(() {
              
            });
          },
          items: 
          // <Widget>[
          //   Icon(Icons.home, size: 30),
          //   Icon(Icons.person, size: 30),
          //   Icon(Icons.settings, size: 30),
          // ],
          [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text("Users")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Setting")
            )
          ]
        ),
      ),
    );
  }
}


