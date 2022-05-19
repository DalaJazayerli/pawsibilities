import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/clinic/clinic_appointments.dart';
import 'package:pawsibilities/screen/clinic/clinic_profile.dart';

class ClinicHome extends StatefulWidget {
  const ClinicHome({Key? key}) : super(key: key);

  @override
  State<ClinicHome> createState() => _ClinicHomeState();
}

class _ClinicHomeState extends State<ClinicHome> {
  List pages = [
    const ClinicAppointments(),
    const ClinicProfile(),
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
        children: const [
          ClinicAppointments(),
          ClinicProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffff914d),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
