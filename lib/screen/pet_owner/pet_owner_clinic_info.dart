import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_appointment.dart';
import 'package:pawsibilities/sign_in/sign_up_screen.dart';

import '../../sign_in/clinic_sign_up.dart';

class PetOwnerClinicInfo extends StatelessWidget {
  final Clinic clinic;

  const PetOwnerClinicInfo({
    Key? key,
    required this.clinic,
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
            "   Clinic Details:",
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
                clinic.name,
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
                clinic.email,
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
                '    Open From:',
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
                clinic.workingHoursFrom,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'To:',
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
                clinic.workingHoursTo,
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
                '    Phone Number:',
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
                clinic.phoneNumber,
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
                '    Website:',
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
                clinic.website,
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
                '    Location:',
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
                clinic.location,
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
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetOwnerAppointment()));
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
