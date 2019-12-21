import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String chosenPackage;
  final int packageDays;
  final String packageRoute;
  final String packageImage;
  final Timestamp travelDate;

  User({this.id,this.name,this.email,this.gender,this.chosenPackage,this.packageDays,this.packageRoute,this.packageImage,this.travelDate});

  factory User.fromDoc(DocumentSnapshot doc){
    return User(
      id: doc.documentID,
      name: doc['name'],
      email: doc['email'],
      gender: doc['gender'],
      chosenPackage: doc['chosenPackage'],
      packageDays: doc['packageDays'],
      packageRoute: doc['packageRoute'],
      packageImage: doc['packageImage'],
      travelDate: doc['travelDate'],
    );
  }
}