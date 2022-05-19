import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_bookmarks.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_encyclopedia.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_notifications.dart';

class Encyclopedia extends StatelessWidget {
  const Encyclopedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                        builder: (context) => const PetOwnerNotifications()));
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Icon(
                Icons.import_contacts,
              ),
              Icon(Icons.bookmark),
            ],
            labelColor: Color(0xffff914d),
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            PetOwnerEncyclopedia(),
            PetOwnerBookmarks(),
          ],
        ),
      ),
    );
  }
}
