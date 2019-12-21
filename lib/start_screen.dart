import 'package:flutter/material.dart';
import 'package:expandable_card/expandable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tourist_guide/Admin/admin.dart';
import 'package:tourist_guide/Admin/admin_home_page.dart';
import 'package:tourist_guide/user_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'choose_package_page.dart';
import 'user_details_page.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);



class LoginScreen extends StatefulWidget {
  static final id = 'loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  //final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();


  // Widget getScreenId(){
  //   return StreamBuilder<FirebaseUser>(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (BuildContext context, snapshot){
  //       if (snapshot.hasData){
  //         return null;
  //       }else {
  //         return null;
  //       }
  //     },
  //   );
  // }


validateUser(){
  if(formKey.currentState.validate()){
    formKey.currentState.save();
    signInUser();
  }
}



signInUser()async{
  if (email == 'bishnu@admin.com' && password == 'admin123'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPage()));
  } else {

     setState(() {
                          showSpinner = true;
                        });
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHome()));
                        try {
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          // if (user != null) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDetailsPage()));
                          // }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                          setState(() {
                            showSpinner = false;
                          });
                        }

  }
 
}



  @override
  Widget build(BuildContext context) {
   String packageName;
   String packageImage;
   String packageDetails;
    return Scaffold(
      body: Container(
          
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.4), BlendMode.dstATop),
        ),
        ),
        // child: PackageStream(),
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: <Widget>[
      
      
             Container(
          height: 200.0,
          child: Image.asset('images/plannepal_logo.gif'),
          ),
      
      SizedBox(
          height: 10.0,
      ),
     Form(
       key: formKey,

       child: Column(children: <Widget>[
        TextFormField(
          textAlign: TextAlign.center,
           validator: (value) => value.isEmpty? 'Please enter email':null,
          onChanged: (value) {
          //Do something with the user input.
          email = value;
          },
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your email'),
            
      ),
      SizedBox(
          height: 8.0,
      ),
      TextFormField(
          textAlign: TextAlign.center,
          validator: (value) => value.isEmpty? 'Please enter password':null,
          obscureText: true,
          onChanged: (value) {
          //Do something with the user input.
          password = value;
          },
          decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your password'),
      ),
      SizedBox(
          height: 24.0,
      ),
      ButtonTheme(
        minWidth: 400,
              child: new RaisedButton(
          
            color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: validateUser,
            child: Text('Log In',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
     ],),),

             
            SizedBox(
          height: 12.0,
      ),

      Center(child: Text('OR',style: TextStyle(fontSize: 20,color: Colors.red),)),

       SizedBox(
          height: 12.0,
      ),

            RaisedButton(
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChoosePackage()));
      },
      child: Text('Choose Package',style:TextStyle(color: Colors.white,fontSize: 20),),)
      
      
            ],
          ),
            ),
        ),
            ),

      
      
    );


   
  }
}



















// class PackageStream extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {





//     return Column(
//         children: <Widget>[
//           Expanded(
//                     child: StreamBuilder<QuerySnapshot>(
//               stream: Firestore.instance.collection('tourPackage').snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Colors.lightBlueAccent,
//                     ),
//                   );
//                 }
//                 final packages = snapshot.data.documents;
//                 List<PackageCard> packageList = [];
//                 for (var package in packages) {
//                   final packageName = package.data['name'];
//                   final packageDetails = package.data['details'];
//                   final packageImage = package.data['image'];
//                   print('Package name : $packageName');
//                   print('Package Details : $packageDetails');
//                   final tourPackage = PackageCard(
//                     packageName: packageName,
//                     packageDetails: packageDetails,
//                     packageImage: packageImage,
                    
//                   );

//                   packageList.add(tourPackage);
//                 }
//                 // return ListView(
                  
//                 //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                 //   children: packageList,
//                 // );

//                 return ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context,index){
//                   DocumentSnapshot ds = snapshot.data.documents[index];
                  
//                   return Container(child: Column(children: <Widget>[
//                     PackageCard(packageName: ds['name'], packageDetails: ds['details'],packageImage: ds['image'],)
//                   ],),);
//                 },);

                
//               },
//             ),
//           ),
//         ],
      
//     );
//   }
// }


// class PackageCard extends StatelessWidget {
//   final String packageName;
//   final String packageDetails;
//   final String packageImage;
//   PackageCard({this.packageName,this.packageImage,this.packageDetails});
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//     elevation: 2.0,
//     child: Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             child: Container(
//               height: 80,
//               width: 120,
//               child: Image.network(
//                 '$packageImage',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Container(
//           child: Text(
//             '$packageName',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
//   }
// }







































































// class PackageLista extends StatelessWidget {
//   static String packageName;
//   static String packageImage;
//   static String packageDetails;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamBuilder(
//         stream: Firestore.instance.collection('tourPackage').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text('The package field is empty'),
//             );
//           } 

//           return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot packageInfo = snapshot.data.documents[index];
//               packageName = packageInfo['name'];
//               packageImage = packageInfo['image'];
//               packageDetails = packageInfo['details'];
//               print('Package Name: $packageName');

//               return Card(
//                 elevation: 2.0,
//                 child: Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         child: Container(
//                           height: 80,
//                           width: 120,
//                           child: Image.network(
//                             packageImage,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Text(
//                         packageName,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }









// Widget packageLista(){
//    String packageName;
//    String packageImage;
//    String packageDetails;
   
//   return Container(
//       child: StreamBuilder(
//         stream: Firestore.instance.collection('tourPackage').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text('The package field is empty'),
//             );
//           }

//             return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot packageInfo = snapshot.data.documents[index];
              
//               packageName = packageInfo['name'];
//               packageImage = packageInfo['image'];
//               packageDetails = packageInfo['details'];
//               print('Package Name: $packageName');

//               return Card(
//                 elevation: 2.0,
//                 child: Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         child: Container(
//                           height: 80,
//                           width: 120,
//                           child: Image.network(
//                             packageImage,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Text(
//                         packageName,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );

          

          
//         },
//       ),
//     );

// }







// Widget package() {
  
//   return Card(
//     elevation: 2.0,
//     child: Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             child: Container(
//               height: 80,
//               width: 120,
//               color: Colors.blue,
//               child: Image.network(
//                 'll',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Container(
//           child: Text(
//             // PackageLista.packageName,
//             // style: TextStyle(
//             //   fontSize: 20,
//             //   fontWeight: FontWeight.bold,
//             // ),

//             'Hello world'
//           ),
//         ),
//       ],
//     ),
//   );
// }