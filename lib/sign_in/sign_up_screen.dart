import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/widgets/widgets.dart';
import 'sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsibilities/net/firebase.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xffff914d),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff914d),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFieldCustom(
                label: 'Name',
                controller: _nameController,
                validator: _requiredValidator,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                label: 'Email',
                controller: _emailController,
                validator: _requiredValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                label: 'Password',
                controller: _passwordController,
                validator: _requiredValidator,
                password: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                validator: _confirmPasswordValidator,
                password: true,
              ),
              const SizedBox(height: 40),
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
                        final user = User(
                          name: _nameController.text,
                          email: _emailController.text,
                        );
                        _signUp(user);
                      }
                    },
                    child: const Text(
                      'Sign Up',
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
              ],
              const SizedBox(
                height: 30,
              ),
              signInOption(),
            ],
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Have an Account?",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          },
          child: const Text(
            "  Sign In",
            style: TextStyle(
                color: Color(0xffff914d), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return 'This field is required';
    }
    if (_passwordController.text != confirmPasswordText) {
      return "Password do not match";
    }
    return null;
  }

  Future _signUp(User user) async {
    setState(() {
      loading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final userdoc = FirebaseFirestore.instance.collection('users').doc();
      user.id = userdoc.id;
      final json = user.toJson();
      await userdoc.set(json);

      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sign Up Succeeded'),
                content: const Text('Your account was successfully created'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              ));
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
      setState(() {
        loading = false;
      });
    }
  }

  void _handleSignUpError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'Email is already used';
        break;
      case 'invalid-email':
        messageToDisplay = 'Email is invalid';
        break;
      case 'operation-not-allowed':
        messageToDisplay = 'This operation is not allowed';
        break;
      case 'weak-password':
        messageToDisplay = 'Password is too weak';
        break;
      default:
        messageToDisplay = 'An unknown error occured';
        break;
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Sign up failed'),
              content: Text(messageToDisplay),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay')),
              ],
            ));
  }
}

class User {
  String id;
  final String email;
  final String name;

  User({this.id = '', required this.email, required this.name});

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
      );
}
