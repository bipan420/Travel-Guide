import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'admin_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static final id = 'loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  bool showSpinner = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Column(
          children: <Widget>[
            //Column for Logo and Company Name
            Column(
              children: <Widget>[
                Image.asset('images/logo.jpg'),
                Text(
                  'Plan Nepal Travel and Tours',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),

            //Column for Form
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please type an email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),

                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please type a password';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),

                  RaisedButton(
                    onPressed: signIn,
                    child: Text('Log In'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn()async{
  final formState = _formKey.currentState;
  if(formState.validate()){
    formState.save();
    setState(() {
      showSpinner = true;
    });
    try{
      // final _auth = FirebaseAuth.instance;
      // FirebaseUser user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      //Navigator.pushNamed(context, AdminPage.id);
      setState(() {
        showSpinner = false;
      });
    }catch(e){
      print(e.message);
      setState(() {
        showSpinner = false;
      });
    }

  }
  }
}
