import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/clinic/clinic_notifications.dart';

class ClinicAppointments extends StatefulWidget {
  const ClinicAppointments({Key? key}) : super(key: key);

  @override
  State<ClinicAppointments> createState() => _ClinicAppointmentsState();
}

class _ClinicAppointmentsState extends State<ClinicAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Scheduled Appointments",
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
                      builder: (context) => const ClinicNotifications()));
            },
          ),
        ],
      ),
    );
  }
}
