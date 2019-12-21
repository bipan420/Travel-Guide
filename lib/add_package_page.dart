import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AddPackagePage extends StatefulWidget {
  static final id = 'addPackage';
  @override
  _AddPackagePageState createState() => _AddPackagePageState();
}

class _AddPackagePageState extends State<AddPackagePage> {

  String packageName;
  String packageDetails;
  String packageDuration;
  String packagePrice;
  final formKey = GlobalKey<FormState>();

  getPackageName(packageName){
    this.packageName = packageName;
  }

  getPackageDetails(packageDetails){
    this.packageDetails = packageDetails;
  }

  getPackageDuration(packageDuration){
    this.packageDuration = packageDuration;
  }

  getPackagePrice(packagePrice){
    this.packagePrice = packagePrice;
  }

saveData(){

  if(formKey.currentState.validate()){
    formKey.currentState.save();

    Firestore.instance.collection('tourPackage').add({
       'name':packageName,
      'details':packageDetails,
      'duration':packageDuration,
      'price':packagePrice
     });
      Navigator.pop(context);
  }
    // DocumentReference ds =Firestore.instance.collection('tourPackage').document(packageName);
    // Map <String,dynamic> packages = {
    //   'name':packageName,
    //   'details':packageDetails,
    //   'duration':packageDuration,
    //   'price':packagePrice

    // };
    // ds.setData(packages).whenComplete((){
    //   print('Data added');
    // });


     
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Package'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
                  child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  onChanged: (String name) {
                    getPackageName(name);
                  },
                  validator: (value) => value.isEmpty ? 'Please enter name':null,
                  decoration: InputDecoration(labelText: "Name: "),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  maxLines: 10,
                  validator: (value) => value.isEmpty ? 'Please enter Details':null,
                  onChanged: (String details) {
                    getPackageDetails(details);
                  },
                  decoration: InputDecoration(labelText: "Details: "),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'Please enter durations':null,
                  onChanged: (String duration) {
                    getPackageDuration(duration);
                  },
                  decoration: InputDecoration(labelText: "Durations: "),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'Please enter price':null,
                  onChanged: (String price) {
                    getPackagePrice(price);
                  },
                  decoration: InputDecoration(labelText: "Price: "),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.grey,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel',style: TextStyle(color: Colors.red,),),
                        ),

                        RaisedButton(
                          color: Colors.lightBlue,
                          onPressed: (){
                            saveData();
                           
                          },
                          child: Text('Submit',style: TextStyle(color: Colors.white,),),
                        ),
                    ],)
                ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}