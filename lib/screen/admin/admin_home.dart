import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_clinics.dart';
import 'package:pawsibilities/screen/admin/admin_encyclopedia.dart';
import 'package:pawsibilities/screen/admin/admin_pet_owners.dart';
import 'package:pawsibilities/screen/admin/admin_profile.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List pages = [
    AdminPetOwners(),
    AdminClinics(),
    AdminEncyclopedia(),
    AdminProfile(),
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
          AdminPetOwners(),
          AdminClinics(),
          AdminEncyclopedia(),
          AdminProfile(),
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
            icon: Icon(Icons.person),
            label: 'Pet Owners',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Clinics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: 'Encyclopedia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
