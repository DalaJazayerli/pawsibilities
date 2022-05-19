import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsibilities/net/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawsibilities/sign_in/sign_up_screen.dart';
import 'package:pawsibilities/widgets/widgets.dart';

import '../../widgets/user_image.dart';

class PetProfileForm extends StatefulWidget {
  const PetProfileForm({Key? key}) : super(key: key);

  @override
  State<PetProfileForm> createState() => _PetProfileFormState();
}

class _PetProfileFormState extends State<PetProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageYearsController = TextEditingController();
  final _ageMonthsController = TextEditingController();
  final _genderController = TextEditingController();
  final _breedController = TextEditingController();
  final _vaccinesController = TextEditingController();
  final _healthController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var loading = false;

  String imageURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xffff914d),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            UserImage(
              onFileChanged: (imageURL) {
                setState(() {
                  this.imageURL = imageURL;
                });
              },
            ),
            const Text(
              '  Pet Details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffff914d),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              label: 'Name',
              controller: _nameController,
              validator: _requiredValidator,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              label: 'Type of Pet',
              controller: _typeController,
              validator: _requiredValidator,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              label: 'Weight(KGs)',
              controller: _weightController,
              validator: _requiredValidator,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '     Age',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldCustom(
                      label: 'Years',
                      controller: _ageYearsController,
                      validator: _requiredValidator),
                ),
                Expanded(
                  child: TextFieldCustom(
                      label: 'Months',
                      controller: _ageMonthsController,
                      validator: _requiredValidator),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
                label: 'Gender',
                controller: _genderController,
                validator: _requiredValidator),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              label: 'Breed',
              controller: _breedController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '  Medical Information',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffff914d),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              label: 'Vaccines',
              controller: _vaccinesController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              label: 'Health Conditions',
              controller: _healthController,
            ),
            const SizedBox(height: 50),
            Align(
              child: ElevatedButton(
                onPressed: () {
                  final pet = Pet(
                    name: _nameController.text,
                    type: _typeController.text,
                    weight: _weightController.text,
                    ageYears: _ageYearsController.text,
                    ageMonths: _ageMonthsController.text,
                    gender: _genderController.text,
                    breed: _breedController.text,
                    vaccines: _vaccinesController.text,
                    health: _healthController.text,
                  );
                  createPet(pet);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
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
                    horizontal: 120,
                    vertical: 17,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future createPet(Pet pet) async {
    final docPet = FirebaseFirestore.instance.collection('pets').doc();

    pet.id = docPet.id;
    final json = pet.toJson();
    await docPet.set(json);
  }
}

class Pet {
  String id;
  final String name;
  final String type;
  final String weight;
  final String ageYears;
  final String ageMonths;
  final String gender;
  final String breed;
  final String vaccines;
  final String health;

  Pet(
      {this.id = '',
      required this.name,
      required this.type,
      required this.weight,
      required this.ageYears,
      required this.ageMonths,
      required this.gender,
      required this.breed,
      required this.vaccines,
      required this.health});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'weight': weight,
        'ageYears': ageYears,
        'ageMonths': ageMonths,
        'gender': gender,
        'breed': breed,
        'vaccines': vaccines,
        'health': health
      };
  static Pet fromJson(Map<String, dynamic> json) => Pet(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        weight: json['weight'],
        ageYears: json['ageYears'],
        ageMonths: json['ageMonths'],
        gender: json['gender'],
        breed: json['breed'],
        vaccines: json['vaccines'],
        health: json['health'],
      );
}
