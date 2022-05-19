// ignore_for_file: unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/clinic/clinic_appointments.dart';
import 'package:pawsibilities/sign_in/clinic_sign_up.dart';
import 'package:pawsibilities/widgets/widgets.dart';
import '../screen/clinic/clinic_home.dart';
import 'reset_password.dart';

class ClinicSignIn extends StatefulWidget {
  const ClinicSignIn({Key? key}) : super(key: key);

  @override
  _ClinicSignInState createState() => _ClinicSignInState();
}

class _ClinicSignInState extends State<ClinicSignIn> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var loading = false;
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
                forgetPassword(context),
                const SizedBox(height: 50),
                if (loading) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
                if (!loading) ...[
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
                                    builder: ((context) =>
                                        const ClinicHome())));
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
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
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
                  signUpOption()
                ],
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

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have an Account?",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ClinicSignUp()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(
                color: Color(0xffff914d), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style:
              TextStyle(color: Color(0xffff914d), fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResetPasswordScreen())),
      ),
    );
  }
}
