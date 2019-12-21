import 'package:cloud_firestore/cloud_firestore.dart';
class Package {
  final String id;
  final String name;
  final String duration;
  final String details;
  final String price;
  final String image;
  

  Package({this.id,this.name,this.details,this.duration,this.price,this.image});

  factory Package.fromDoc(DocumentSnapshot doc){
    return Package(
      id: doc.documentID,
      name: doc['name'],
      duration: doc['duration'],
      details: doc['details'],
      price: doc['price'],
      image: doc['image'],
      
    );
  }
}