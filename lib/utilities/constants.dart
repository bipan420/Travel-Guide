import 'package:cloud_firestore/cloud_firestore.dart';
final _firestore = Firestore.instance;
final usersRef = _firestore.collection('users');
final packageRef = _firestore.collection('tourPackage');