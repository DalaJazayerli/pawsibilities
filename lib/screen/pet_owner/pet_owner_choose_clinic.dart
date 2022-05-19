import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_clinic_info.dart';

import '../../sign_in/clinic_sign_up.dart';
import '../admin/admin_clinic_details.dart';

class PetOwnerChooseClinic extends StatefulWidget {
  const PetOwnerChooseClinic({Key? key}) : super(key: key);

  @override
  State<PetOwnerChooseClinic> createState() => _PetOwnerChooseClinicState();
}

class _PetOwnerChooseClinicState extends State<PetOwnerChooseClinic> {
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
              builder: (context) => PetOwnerClinicInfo(clinic: clinic)));
        },
      );

  Stream<List<Clinic>> readClinics() => FirebaseFirestore.instance
      .collection('clinics')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Clinic.fromJson(doc.data())).toList());
}
