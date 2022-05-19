import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/sign_in/sign_up_screen.dart';

class PetOwnerDetails extends StatelessWidget {
  final User user;

  const PetOwnerDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xffff914d),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const Text(
            "   Pet Owner Details:",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xffff914d),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                '    Name:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                '    Email:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 400,
          ),
          Align(
            child: ElevatedButton(
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                final docFaq =
                    FirebaseFirestore.instance.collection('users').doc(user.id);
                docFaq.delete();
                Navigator.pop(context);
              },
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
            ),
          ),
        ],
      ),
    );
  }
}
