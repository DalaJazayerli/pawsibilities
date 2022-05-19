import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/admin/admin_home.dart';
import 'package:pawsibilities/widgets/widgets.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({Key? key}) : super(key: key);

  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.of(context).size.height * 0.2,
            20,
            0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffff914d),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFieldCustom(
                  label: 'Email',
                  controller: _emailTextController,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFieldCustom(
                  label: 'Password',
                  controller: _passwordTextController,
                  validator: _requiredValidator,
                  password: true,
                ),
                const SizedBox(height: 50),
                Align(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const AdminHome())));
                        }).onError((error, stackTrace) {
                          print("Error${error.toString()}");
                        });
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      primary: const Color((0xffff914d)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
