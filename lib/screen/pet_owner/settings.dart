import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_notifications.dart';
import 'package:pawsibilities/sign_in/sign_in_screen.dart';

// ignore: camel_case_types
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xffff914d),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.grey,
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PetOwnerNotifications()));
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text(
              "Sign Out",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color(
                  0xffff914d,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 17),
                textStyle: const TextStyle(
                  fontSize: 17,
                )),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              });
            }),
      ),
    );
  }
}
