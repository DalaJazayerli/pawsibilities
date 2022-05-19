import 'package:flutter/material.dart';

class PetOwnerBookmarks extends StatefulWidget {
  const PetOwnerBookmarks({Key? key}) : super(key: key);

  @override
  State<PetOwnerBookmarks> createState() => _PetOwnerBookmarksState();
}

class _PetOwnerBookmarksState extends State<PetOwnerBookmarks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Bookmarks'),
    );
  }
}
