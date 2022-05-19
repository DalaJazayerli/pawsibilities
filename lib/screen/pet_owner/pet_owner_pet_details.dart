import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_appointment.dart';
import 'package:pawsibilities/screen/pet_owner/pet_profile_form.dart';
import 'package:pawsibilities/sign_in/sign_up_screen.dart';

import '../../sign_in/clinic_sign_up.dart';

class PetOwnerPetDetails extends StatelessWidget {
  final Pet pet;

  const PetOwnerPetDetails({
    Key? key,
    required this.pet,
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
            "   Pet Details:",
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
                pet.name,
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
                '    Type of Pet:',
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
                pet.type,
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
                '    Weight:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.weight,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                '    Age:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.ageYears,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Years',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.ageMonths,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Months',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
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
                '    gender:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.gender,
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
                '    Breed:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.breed,
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
                '    Vaccines:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.vaccines,
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
                '    Health Conidtions:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pet.health,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 250,
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
                    FirebaseFirestore.instance.collection('pets').doc(pet.id);
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
