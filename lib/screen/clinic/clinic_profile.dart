import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/clinic/clinic_notifications.dart';

import 'package:pawsibilities/sign_in/clinic_sign_in.dart';

import '../../widgets/user_image.dart';

class ClinicProfile extends StatefulWidget {
  const ClinicProfile({Key? key}) : super(key: key);

  @override
  State<ClinicProfile> createState() => _ClinicProfileState();
}

class _ClinicProfileState extends State<ClinicProfile> {
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
                      builder: (context) => const ClinicNotifications()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 500,
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClinicSignIn()));
                });
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color((0xffff914d)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                  vertical: 17,
                ),
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
