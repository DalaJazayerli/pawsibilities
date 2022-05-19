import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/sign_in/sign_up_screen.dart';
import 'package:pawsibilities/widgets/widgets.dart';
import 'package:booking_calendar/booking_calendar.dart';

class PetOwnerAppointment extends StatefulWidget {
  const PetOwnerAppointment({Key? key}) : super(key: key);

  @override
  State<PetOwnerAppointment> createState() => _PetOwnerAppointmentState();
}

class _PetOwnerAppointmentState extends State<PetOwnerAppointment> {
  final _formKey = GlobalKey<FormState>();

  final _commentsController = TextEditingController();
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
      body: Form(
        child: ListView(
          children: [
            const Text(
              "   Choose Appointment Type:",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffff914d),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                //First Button
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.medical_services_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //Second Button
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    CupertinoIcons.scissors,
                    size: 50,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //Third Button
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.favorite,
                    size: 50,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 55,
                ),
                Text(
                  'Shots',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  'Grooming',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Check Ups',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.pending_rounded,
                  size: 50,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'Other',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '     Comments',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(label: '', controller: _commentsController),
            const SizedBox(
              height: 20,
            ),
            // ignore: unnecessary_null_comparison
            //------------------------Pick time and date buttons---------------

            //---------------------Date and Time Picker---------------------

            //------------------Book Appointment Button-------------------------
            Align(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PetOwnerAppointment()));
                },
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color((0xffff914d)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 17,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
