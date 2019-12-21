import 'package:flutter/material.dart';
import 'package:tourist_guide/Inputs/user_home_page1.dart';
import 'package:tourist_guide/user_list_page.dart';
import 'user_home_page.dart';
import 'place_desc_page.dart';
import 'place_route_page.dart';
import 'user_setting_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class UserDetailsPage extends StatefulWidget {
  static final id = 'userDetails';
  final String userId;
  UserDetailsPage(this.userId);
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  // String username = UserList.userName;
  // String userImage = UserList.userImage;
  int _currentIndex = 0;

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        //return UserHome();
        return UserHome1(widget.userId);
        
        

      case 1:
        return UserPackageDetailsPage();

      case 2:
        return PlaceSchedule();
        
      case 3:
        return UserSettingPage(widget.userId);

      default:
        return UserHome1(widget.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
          home: Scaffold(
            backgroundColor: Colors.blue,
        // appBar: AppBar(
        //   title: Text('$username'),
        // ),
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          currentIndex: _currentIndex,
          //index: _currentIndex,

          
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              
              icon: Icon(Icons.home),
              title: Text('Home',),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('Details',),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.navigation),
              title: Text('Route'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Setting'),
            )

            // Icon(Icons.home, size: 30),
            // Icon(Icons.info, size: 30),
            // Icon(Icons.navigation, size: 30),
            // Icon(Icons.settings, size: 30),
            

          ],
        ),
      ),
    );
  }
}
