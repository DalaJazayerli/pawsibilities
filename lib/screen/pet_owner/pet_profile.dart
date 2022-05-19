import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_notifications.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_pet_details.dart';
import 'package:pawsibilities/screen/pet_owner/pet_profile_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({Key? key}) : super(key: key);

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Your Pets",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PetProfileForm()),
          );
        },
        backgroundColor: const Color(0xffff914d),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<List<Pet>>(
          stream: readPet(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final pets = snapshot.data!;

              return ListView(
                children: pets.map(buildPet).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildPet(Pet pet) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff36ced4),
          child: Icon(
            Icons.pets,
            color: Colors.white,
          ),
        ),
        title: Text(
          pet.name,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              pet.type,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              pet.gender,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xffff914d),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PetOwnerPetDetails(pet: pet)));
        },
      );

  Stream<List<Pet>> readPet() => FirebaseFirestore.instance
      .collection('pets')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Pet.fromJson(doc.data())).toList());
}
