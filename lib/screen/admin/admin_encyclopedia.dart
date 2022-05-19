import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_articles.dart';
import 'package:pawsibilities/screen/admin/admin_faqs.dart';

import 'admin_notifications.dart';

class AdminEncyclopedia extends StatefulWidget {
  const AdminEncyclopedia({Key? key}) : super(key: key);

  @override
  State<AdminEncyclopedia> createState() => _AdminEncyclopediaState();
}

class _AdminEncyclopediaState extends State<AdminEncyclopedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Encyclopedia",
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
      body: ListView(children: [
        const SizedBox(
          height: 100,
        ),
        Align(
          child: ElevatedButton(
            child: const Text(
              'Articles',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminArticles()));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color(
                  0xff36ced4,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 17),
                textStyle: const TextStyle(
                  fontSize: 17,
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          child: ElevatedButton(
            child: const Text(
              'FAQs',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminFAQs()));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color(
                  0xff36ced4,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 17),
                textStyle: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ]),
    );
  }
}
