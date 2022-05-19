import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/encyclopedia.dart';
import 'package:pawsibilities/screen/pet_owner/main_appointments.dart';
import 'package:pawsibilities/screen/pet_owner/pet_profile.dart';
import 'package:pawsibilities/screen/pet_owner/settings.dart';

class PetOwnerHome extends StatefulWidget {
  const PetOwnerHome({Key? key}) : super(key: key);

  @override
  State<PetOwnerHome> createState() => _PetOwnerHomeState();
}

class _PetOwnerHomeState extends State<PetOwnerHome> {
  List pages = [
    MainAppointments(),
    PetProfile(),
    Encyclopedia(),
    Settings(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          MainAppointments(),
          PetProfile(),
          Encyclopedia(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xffff914d),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pet Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Encyclopedia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
