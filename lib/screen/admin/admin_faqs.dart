import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_add_faq.dart';

import 'admin_faq_page.dart';

class AdminFAQs extends StatefulWidget {
  const AdminFAQs({Key? key}) : super(key: key);

  @override
  State<AdminFAQs> createState() => _AdminFAQsState();
}

class _AdminFAQsState extends State<AdminFAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xffff914d),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xffff914d),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AdminAddFAQ()));
          }),
      body: StreamBuilder<List<FAQ>>(
          stream: readFAQ(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final faqs = snapshot.data!;

              return ListView(
                children: faqs.map(buildFAQ).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildFAQ(FAQ faq) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff36ced4),
          child: Icon(
            Icons.question_answer,
            color: Colors.white,
          ),
        ),
        title: Text(
          faq.question,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xffff914d),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FaqPage(faq: faq)));
        },
      );

  Stream<List<FAQ>> readFAQ() =>
      FirebaseFirestore.instance.collection('faq').snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => FAQ.fromJson(doc.data())).toList());
}
