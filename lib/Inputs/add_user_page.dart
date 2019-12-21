import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourist_guide/services/auth_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tourist_guide/start_screen.dart';
import 'package:tourist_guide/user_details_page.dart';
import 'package:tourist_guide/choose_package_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourist_guide/user_model.dart';
import 'rounded_icon_button.dart';
import 'package:intl/intl.dart';

String userPrice = pkgPrice;
class AddUserPage extends StatefulWidget {
  static final id = 'addUser';
  
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  String _name;
  String _email;
  String _password;
  String _gender;
  
  
  final pakgPrice = pkgPrice;
  // final pakgName = pkgName;
  // final pakgDays = pkgDays;
  // final pakgRoute = pkgRoute;
  // final pakgImage = pkgImage;
  String _chosenPackage = pkgName;
  int _packageDays = pkgDays;
  String _packageRoute = pkgRoute;
  String _packageImage = pkgImage;

  static DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('yyy-MM-dd').format(selectedDate);
  Timestamp _travelDate = Timestamp.fromDate(selectedDate);
  //String formattedDAte = DateFormat().add_yMMMMEEEEd().format(selectedDate);
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  bool showSpinner = false;
  
  //String image;
  String radioValidate = "";
  int genderType = -1;

  final formKey = GlobalKey<FormState>();
  var dbHelper;
   void handleGender(int value) {
    setState(() {
      genderType = value;
      switch (genderType) {
        case 1:
          _gender = 'male';
          break;
        case 2:
          _gender = 'female';
          break;
        // default:
        // specifyGender();
      }
    });
  }

  validate(){
    if(formKey.currentState.validate()){
      //formKey.currentState.save();
      if(genderType==-1){
        radioValidate = "Please select Gender";
      } else {
        formKey.currentState.save();
        signUpUser(context, _name, _gender, _email, _password, _chosenPackage,_packageDays,_packageRoute,_packageImage,_travelDate);
      }
      
      
    }
  }


signUpUser(BuildContext context, String name,String gender, String email, String password,  String chosenPackage,int packageDays,String packageRoute, String packageImage,Timestamp travelDate) async {
    setState(() {
      showSpinner = true;
    });
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedInUser = user;
      if(signedInUser != null){
        _firestore.collection('users').document(signedInUser.uid).setData({
          'name':name,
          'email':email,
          'gender':gender,
          'password':password,
          'chosenPackage':chosenPackage,
          'packageDays': packageDays,
          'packageRoute': packageRoute,
          'packageImage': packageImage,
          'travelDate': travelDate,
        }
        );

      //    final snackBar = SnackBar(
      //   content: Row(
      //     children: <Widget>[
      //       Text('Account created'),
      //       SizedBox(
      //         width: 20,
      //       ),
      //       Icon(Icons.done)
      //     ],
      //   ),
      // );
      // Scaffold.of(context).showSnackBar(snackBar);


      
        
        //Navigator.pushNamed(context, UserDetailsPage.id);
        
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDetailsPage(user.uid)));

        //Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetailsPage(user.uid)));
        
        


        setState(() {
          showSpinner = false;
        });

       return showDialog(
         context: this.context,
         builder: (BuildContext context){
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
                          child: AlertDialog(
      title:Column(children: <Widget>[
        Text('Congratulations!',style: TextStyle(fontSize: 30,color: Colors.green),),
        Text('$name',style: TextStyle(fontSize: 26,color: Colors.black),),
      ],),
      content: Container(
        height: 400,
        
        child: Column(children: <Widget>[
          SizedBox(height: 20,),
          Text('Package Name: $_chosenPackage',),
          SizedBox(height: 20,),
          Text('Total duration:$_packageDays days'),
          SizedBox(height: 20,),
          Text('Total price:Rs $userPrice'),
          SizedBox(height: 20,),
          SizedBox(height: 10,),
          Text('You can pay for the package at our office by showing this receipt',style: TextStyle(color: Colors.black26),)
        ],),
      ),
      actions: <Widget>[
        FlatButton(child: Text('Save'),onPressed: (){
          
        },),
        RaisedButton(child: Text('Continue to home',style: TextStyle(color: Colors.white),),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetailsPage(user.uid)));
        },),

      ],
    ),
            );
         }
       );

      }
    }catch(e){
      print(e);
      showSpinner = false;
    }
  }

  // Widget receiptDialog(){
  //   return AlertDialog(
  //     title:Text('Congratulations!$_name'),
  //     content: Column(children: <Widget>[
  //       Text('Package Name: $_chosenPackage'),
  //       Text('Total duration:$_packageDays'),
  //       Text('Total price:$userPrice'),
  //       SizedBox(height: 10,),
  //       Text('You can pay for the package at our office by showing this receipt',style: TextStyle(color: Colors.black26),)
  //     ],),
  //     actions: <Widget>[
  //       FlatButton(child: Text('Continue to home'),
  //       onPressed: (){
  //         Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetailsPage(user.uid)));
  //       },)
  //     ],
  //   );
  // }

  Widget dialogbox(){
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 100,
        height:200,
        color: Colors.red,
        child: Column(children: <Widget>[
          Text("Hello")
        ],),
      ),
    );
  }


  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019,9),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => selectedDate = picked);
}




String _validateEmail(String value) {
  if (value.isEmpty) {
    // The form is empty
    return "Please Enter email address";
  }
  // This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return null;
  }

  // The pattern of the email didn't match the regex above.
  return 'Email is not valid';
}











form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
             Text(
                    'Package Name: $_chosenPackage',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                  ),
                  Text(
                    'Price: Rs $pkgPrice',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                  ),
            

            TextFormField(
              //controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Name",labelStyle: TextStyle(fontSize: 20)),
              validator: (value) =>
                  value.length < 1 ? 'Please enter your Name' : null,
              onChanged: (value) => _name = value,
            ),
            SizedBox(height: 20,),

            Text('Select Gender',style: TextStyle(fontSize: 20),),
            //specifyGender(),
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: genderType,
                  onChanged: handleGender,
                  activeColor: Color(0xff4158ba),
                ),
                Text('Male'),
              ],
            ),
            
            Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: genderType,
                  onChanged: handleGender,
                  activeColor: Color(0xff4158ba),
                ),
                Text('Female'),
              ],

            ),
            Text(genderType<0?"plese select gender":"",style: TextStyle(color: Colors.red),),
            SizedBox(height: 20,),
            TextFormField(
              //controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email",labelStyle: TextStyle(fontSize: 20)),
              validator: _validateEmail,
              //  (value) =>
              //     value.isEmpty ? 'Please enter your Email' : null,
              onChanged: (value) {
                _email = value.trim();
              },
            ),
            SizedBox(height: 20,),

            TextFormField(
              //controller: controller,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password",labelStyle: TextStyle(fontSize: 20)),
              onChanged: (value) => _password = value,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password ';
                }
                else {
                  if(value.length < 8) {
                  return 'Password must be minimum of 8 character';
                }
                else
                return null;
                }
              },
              
            ),

            SizedBox(height: 20,),

            TextFormField(
              //controller: controller,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(labelText: "Repeat Password",labelStyle: TextStyle(fontSize: 20)),
              onChanged: (value) => _password = value,
              
              validator: (value) {
                var pass = _password;
                if (value.isEmpty) {
                  return 'Please enter your password ';
                }
                else {
                //   if(value.length < 8) {
                //   return 'Password must be minimum of 8 character';
                // }
                // else
                 if(value != pass){
                  return 'Password  do not match';
                }
                else
                return null;
                }
              },
              
            ),

            SizedBox(height: 20,),

            Text('Select Date', style: TextStyle(fontSize: 20),),
            Text('$formattedDate',style: TextStyle(fontSize: 18),),
            OutlineButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () => _selectDate(context),
              child: Text('Choose date', style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: validate,
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: Text('Register', style: TextStyle(fontSize: 25),),
            ),
             
          ],
        ),
      ),
    );

  }































  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up here'),
      ),
      body:SingleChildScrollView(
              child: Container(child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(children: <Widget>[
            form(),
          ],),
        ),),
      ),
      
    );
  }
}
//        Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.topLeft,
//               height: 50,
//               margin: EdgeInsets.only(top: 10, left: 10),
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     'Package Name: $pakgName',
//                     style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
//                   ),
//                   Text(
//                     'Price: Rs $pkgPrice',
//                     style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 10, right: 10),
//               child: Form(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     TextFormField(
//                       onSaved: (input) => _name = input,
//                       decoration: InputDecoration(
//                         labelText: 'Name',
//                         labelStyle: TextStyle(fontSize: 25.0),
//                       ),
//                     ),
//                     TextFormField(
//                       onSaved: (input) => _email = input,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         labelStyle: TextStyle(fontSize: 25.0),
//                       ),
//                     ),
//                     TextFormField(
//                       onSaved: (input) => _password = input,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         labelStyle: TextStyle(fontSize: 25.0),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Text(
//                       'Number of Individuals',
//                       style: TextStyle(fontSize: 25.0, color: Colors.black54),
//                     ),
//                     Text(
//                       noOfIndividuals.toString(),
//                       style: TextStyle(
//                           fontSize: 50.0, fontWeight: FontWeight.w900),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         RoundIconButton(
//                             icon: FontAwesomeIcons.minus,
//                             onPressed: () {
//                               setState(() {
//                                 noOfIndividuals--;
//                                 if (noOfIndividuals < 2) {
//                                   noOfIndividuals = 1;
//                                 }
//                               });
//                             }),
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         RoundIconButton(
//                             icon: FontAwesomeIcons.plus,
//                             onPressed: () {
//                               setState(() {
//                                 noOfIndividuals++;
//                               });
//                             })
//                       ],
//                     ),
//                     Text(
//                       'Choose Date',
//                       style: TextStyle(fontSize: 25.0, color: Colors.black54),
//                     ),



// InkWell(
//         onTap: () {
//           _selectDate();   // Call Function that has showDatePicker()
//         },
//         child: IgnorePointer(
//           child: new TextFormField(
//             decoration: new InputDecoration(hintText: 'DOB'),
//             maxLength: 10,
//             // validator: validateDob,
//             onSaved: (input) => _tourDate = input,
//           ),
//         ),
//       ),





//                     RaisedButton(
//                       onPressed: signUpUser,
//                       child: Text('Sign Up'),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),


