import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_add_faq.dart';

class FaqPage extends StatelessWidget {
  final FAQ faq;

  const FaqPage({
    Key? key,
    required this.faq,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xffff914d),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Flexible(
              child: Text(
                faq.question,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Flexible(
              child: Text(
                faq.answer,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 300,
          ),
          Align(
            child: ElevatedButton(
              child: const Text(
                '  Edit  ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: const Color(
                    0xffff914d,
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
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                final docFaq =
                    FirebaseFirestore.instance.collection('faq').doc(faq.id);
                docFaq.delete();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: const Color(
                    0xffff914d,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 17),
                  textStyle: const TextStyle(
                    fontSize: 17,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
