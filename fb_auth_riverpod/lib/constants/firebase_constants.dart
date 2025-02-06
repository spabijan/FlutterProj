import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class FirebaseConstants {
  FirebaseConstants._();

  static final userCollections = FirebaseFirestore.instance.collection('users');
  static final fbAuth = FirebaseAuth.instance;
}
