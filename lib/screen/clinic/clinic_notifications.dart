import 'package:flutter/material.dart';

class ClinicNotifications extends StatefulWidget {
  const ClinicNotifications({Key? key}) : super(key: key);

  @override
  State<ClinicNotifications> createState() => _ClinicNotificationsState();
}

class _ClinicNotificationsState extends State<ClinicNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Notifications",
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
            color: const Color(0xffff914d),
            iconSize: 35,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
