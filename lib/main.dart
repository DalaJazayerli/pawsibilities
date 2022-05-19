import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/assets/palette.dart';
import 'package:pawsibilities/sign_in/admin_sign_in.dart';
import 'package:pawsibilities/sign_in/clinic_sign_in.dart';
import 'package:pawsibilities/sign_in/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pawsibilities',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: const SignInScreen(),
    );
  }
}
