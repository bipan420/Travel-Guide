import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/add_package_page.dart';
import 'package:tourist_guide/choose_package_page.dart';
import 'package:tourist_guide/start_screen.dart';
import 'package:tourist_guide/user_home_page.dart';
import 'Inputs/login_page.dart';
import 'Admin/admin_page.dart';
import 'user_details_page.dart';
import 'Inputs/add_user_page.dart';
import 'user_list_page.dart';
import 'add_package_page.dart';
import 'Admin/admin.dart';


void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {

  Widget _getScreenId(){
    return StreamBuilder<FirebaseUser> (
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return UserDetailsPage(snapshot.data.uid);
        }else {
          return LoginScreen();
        }
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      //home: AddPackagePage(),
      home: _getScreenId(),
      routes: {
        LoginPage.id : (context) =>  LoginPage(),
        AdminHomePage.id : (context) => AdminHomePage(),
        //UserDetailsPage.id: (context) => UserDetailsPage(),
        AddUserPage.id: (context) => AddUserPage(),
        UserListPage.id: (context) => UserListPage(),
        AddPackagePage.id: (context) => AddPackagePage(),
        AdminPage.id: (context) => AdminPage(),
        UserHome.id: (context) => UserHome(),
        LoginScreen.id: (context) => LoginScreen(),
        ChoosePackage.id: (context) => ChoosePackage(),


      },
    );
  }
}
