import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_clinic_details.dart';
import 'package:pawsibilities/sign_in/clinic_sign_up.dart';

import 'admin_notifications.dart';

class AdminClinics extends StatefulWidget {
  const AdminClinics({Key? key}) : super(key: key);

  @override
  State<AdminClinics> createState() => _AdminClinicsState();
}

class _AdminClinicsState extends State<AdminClinics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Clinics",
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
      body: StreamBuilder<List<Clinic>>(
          stream: readClinics(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final clinics = snapshot.data!;

              return ListView(
                children: clinics.map(buildClinic).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildClinic(Clinic clinic) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff36ced4),
          child: Icon(
            Icons.apartment,
            color: Colors.white,
          ),
        ),
        title: Text(clinic.name),
        subtitle: Row(
          children: [
            Text(clinic.workingHoursFrom),
            const SizedBox(
              width: 10,
            ),
            Text(clinic.workingHoursTo),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xffff914d),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ClinicDetails(clinic: clinic)));
        },
      );

  Stream<List<Clinic>> readClinics() => FirebaseFirestore.instance
      .collection('clinics')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Clinic.fromJson(doc.data())).toList());
}
