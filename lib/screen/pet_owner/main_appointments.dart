import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_choose_clinic.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_notifications.dart';

class MainAppointments extends StatefulWidget {
  const MainAppointments({Key? key}) : super(key: key);

  @override
  State<MainAppointments> createState() => _MainAppointmentsState();
}

class _MainAppointmentsState extends State<MainAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Upcoming Appointments",
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
              MaterialPageRoute(
                  builder: (context) => const PetOwnerChooseClinic()));
        },
        backgroundColor: const Color(0xffff914d),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
