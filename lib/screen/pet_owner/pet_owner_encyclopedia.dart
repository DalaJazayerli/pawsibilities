import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_articles.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_faqs.dart';

class PetOwnerEncyclopedia extends StatefulWidget {
  const PetOwnerEncyclopedia({Key? key}) : super(key: key);

  @override
  State<PetOwnerEncyclopedia> createState() => _PetOwnerEncyclopediaState();
}

class _PetOwnerEncyclopediaState extends State<PetOwnerEncyclopedia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Align(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetOwnerArticles()));
              },
              child: const Text(
                'Articles',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color(0xff36ced4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 120,
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
          Align(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetOwnerFaqs()));
              },
              child: const Text(
                'FAQs',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: const Color(0xff36ced4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 130,
                  vertical: 17,
                ),
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
