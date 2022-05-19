import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/screen/pet_owner/main_appointments.dart';
import 'package:pawsibilities/screen/pet_owner/pet_owner_home.dart';
import '../../widgets/widgets.dart';
import 'sign_up_screen.dart';
import 'reset_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _error;
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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
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
                height: 15,
              ),
              TextFieldCustom(
                label: 'Password',
                controller: _passwordTextController,
                validator: _requiredValidator,
                password: true,
              ),
              forgetPassword(context),
              const SizedBox(
                height: 20,
              ),
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
                                      const PetOwnerHome())));
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
                const SizedBox(
                  height: 20,
                ),
                signUpOption()
              ],
            ],
          ),
        ),
      ),
    );
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
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
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

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  // Future _signIn() async {
  // setState(() {
  // loading = true;
  //});

  //  try {
  // await FirebaseAuth.instance
  //     .createUserWithEmailAndPassword(
  //   email: _emailTextController.text,
  //   password: _passwordTextController.text,
  // )
  //  .then((value) {
  // Navigator.push(context,
  //      MaterialPageRoute(builder: ((context) => const PetOwnerHome())));
  //  });
  // } on FirebaseAuthException catch (e) {
  // _handleSignUpError(e);
  //  setState(() {
  //  loading = false;
  //  });
  // }
  // }

  void _handleSignUpError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'user-not-found':
        messageToDisplay = 'Your email or password is incorrect';
        break;
      case 'wrong-password':
        messageToDisplay = 'Your email or password is incorrect';
        break;
      default:
        messageToDisplay = 'An unknown error occured';
        break;
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Sign in failed'),
              content: Text(messageToDisplay),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay'))
              ],
            ));
  }
}
