import 'package:flutter/material.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      
      return users
          .add({
            'full_name': fullName, 
            'company': company, 
            'age': age 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}