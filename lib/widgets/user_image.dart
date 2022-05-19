import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pawsibilities/widgets/round_image.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as storage;

class UserImage extends StatefulWidget {
  final Function(String imageURL) onFileChanged;

  UserImage({
    required this.onFileChanged,
  });
  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  final ImagePicker _picker = ImagePicker();

  String? imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageURL == null)
          const Icon(
            Icons.image,
            size: 60,
            color: Colors.grey,
          ),
        if (imageURL != null)
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _selectPhoto(),
            child: AppRoundImage.url(
              imageURL!,
              width: 80,
              height: 80,
            ),
          ),
        InkWell(
          onTap: () => _selectPhoto(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              imageURL != null ? 'Change Photo' : 'Select Photo',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text('Camera'),
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.filter),
                    title: const Text('Pick a File'),
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
              onClosing: () {},
            ));
  }

  Future _pickImage(ImageSource source) async {
    try {
      final pickedFile =
          await _picker.pickImage(source: source, imageQuality: 50);
      if (pickedFile == null) {
        return;
      }
      var file = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (file == null) {
        return;
      }
      file = await compressImage(file.path, 35);
      await _uploadFile(file.path);
    } catch (error) {
      print("error: $error");
    }
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );
    return result!;
  }

  Future _uploadFile(String path) async {
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');

    final result = await ref.putFile(File(path));
    final fileURL = await result.ref.getDownloadURL();

    setState(() {
      imageURL = fileURL;
    });
    widget.onFileChanged(fileURL);
  }
}
