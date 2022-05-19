import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_notifications.dart';
import 'package:pawsibilities/screen/admin/admin_pet_owner_details.dart';

import '../../sign_in/sign_up_screen.dart';

class AdminPetOwners extends StatefulWidget {
  const AdminPetOwners({Key? key}) : super(key: key);

  @override
  State<AdminPetOwners> createState() => _AdminPetOwnersState();
}

class _AdminPetOwnersState extends State<AdminPetOwners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Pet Owners",
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
                      builder: (context) => const AdminNotifications()));
            },
          ),
        ],
      ),
      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff36ced4),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xffff914d),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PetOwnerDetails(user: user)));
        },
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
