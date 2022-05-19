import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> userSetup(String name) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
}

Future<void> petSetup(String name) async {
  CollectionReference pets = FirebaseFirestore.instance.collection('pets');
}

Future<void> clinicSetup(String name) async {
  CollectionReference clinic = FirebaseFirestore.instance.collection('clinics');
}
