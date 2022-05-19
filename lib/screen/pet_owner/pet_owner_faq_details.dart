import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_add_faq.dart';

class PetOwnerFaqDetails extends StatelessWidget {
  final FAQ faq;

  const PetOwnerFaqDetails({
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
        ],
      ),
    );
  }
}
