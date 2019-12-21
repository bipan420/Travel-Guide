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

class UserSettingPage extends StatefulWidget {
  final id = 'userSetting';
  final String userId;
  UserSettingPage(this.userId);
  @override
  _UserSettingPageState createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
final _auth = FirebaseAuth.instance;
bool showSpinner = false;

File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _image = image;
      print('Image path $_image');
      
    });
  }

  Future uploadPic(BuildContext context)async{
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('testImage');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    setState(() {
      print('Profile Picture uploaded');
      print('And the download url for the image is: $downloadUrl');
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully'),));
    });
  }

  signOutUser(BuildContext context)async{
      setState(() {
      showSpinner = true;
    });
    try {
    
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      setState(() {
      showSpinner = false;
    });
    }catch (e){
      print(e);
        setState(() {
      showSpinner = false;
    });
    }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        
        
      ),
      body: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
      //print('UserName::::${snapshot.data['name']}');
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        User user = User.fromDoc(snapshot.data);
        
        return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  //backgroundColor: Color(0xff476cfb),
                  child: ClipOval(
                    child: SizedBox(
                      width: 180.0,
                      height: 180.0,
                      child:
                      (_image!=null) ? Image.file(_image,fit:BoxFit.fill)
                      //  :Image.network(
                      //     'https://picsum.photos/id/1015/6000/4000',
                      //     fit: BoxFit.fill),

                      :Image.asset('images/user.png'),
                    ),
                  ),
                ),
              ),





















































              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.camera),
                  iconSize: 30.0,
                  onPressed: () {
                    //getImage();
                  },
                ),
              ),
            ],),
              SizedBox(
                height: 10.0,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                                            child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Username:',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          user.name,
                          //"${snapshot.data['name']}",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                              ),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.edit),
                        //   iconSize: 30.0,
                        //   onPressed: (){

                        //   },
                        // ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                                    child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Email:',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20,),
                  
                    Text(
                      user.email,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18.0,
                          ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.edit),
                    //   iconSize: 30.0,
                    //   onPressed: (){

                    //   },
                    // )
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // RaisedButton(
                  //   elevation: 4.0,
                  //   splashColor: Colors.pink,
                  //   child: Text('Change Password',style: TextStyle(color: Colors.red,fontSize: 20.0),),
                  //   onPressed: (){
                  //     Navigator.of(context).pop();
                  //   },
                  // ),

                  RaisedButton(
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text('Log Out',style: TextStyle(color: Colors.lightBlue,fontSize: 20.0),),
                    onPressed: (){
                      //uploadPic(context);
                      signOutUser(context);
                    },
                  )
                ],
                ),

                

               

                

        ],
          
        
      );
  },
        
      ),
      );
  }
}