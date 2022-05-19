import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/sign_in/clinic_sign_in.dart';
import '../widgets/user_image.dart';
import '../widgets/widgets.dart';

class ClinicSignUp extends StatefulWidget {
  const ClinicSignUp({Key? key}) : super(key: key);

  @override
  State<ClinicSignUp> createState() => _ClinicSignUpState();
}

class _ClinicSignUpState extends State<ClinicSignUp> {
  final _formKey = GlobalKey<FormState>();

  final _emailSignInController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _workingHoursFromController = TextEditingController();
  final _workingHoursToController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _locationController = TextEditingController();
  final _websiteController = TextEditingController();
  final _serviceTypeController = TextEditingController();
  final _priceController = TextEditingController();

  var loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xffff914d),
          ),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              children: [
                // UserImage(
                // onFileChanged: (imageURL) {
                // setState(() {
                // this.imageURL = imageURL;
                //});
                //},
                //),
                const SizedBox(height: 20),
                TextFieldCustom(
                  label: 'Email (Sign In)',
                  controller: _emailSignInController,
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
                const SizedBox(
                  height: 10,
                ),
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
                const Text(
                  '     Working Hours',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldCustom(
                        label: 'From',
                        controller: _workingHoursFromController,
                        validator: _requiredValidator,
                      ),
                    ),
                    Expanded(
                      child: TextFieldCustom(
                        label: 'To',
                        controller: _workingHoursToController,
                        validator: _requiredValidator,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  label: 'Phone Number',
                  controller: _phoneNumberController,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  label: 'Location',
                  controller: _locationController,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  label: 'Website',
                  controller: _websiteController,
                  validator: _requiredValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '     Services',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldCustom(
                        label: 'Service Type',
                        controller: _serviceTypeController,
                        validator: _requiredValidator,
                      ),
                    ),
                    Expanded(
                      child: TextFieldCustom(
                        label: 'Price',
                        controller: _priceController,
                        validator: _requiredValidator,
                      ),
                    ),
                  ],
                ),
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
                          final clinic = Clinic(
                            name: _nameController.text,
                            email: _emailController.text,
                            emailSignIn: _emailSignInController.text,
                            workingHoursFrom: _workingHoursFromController.text,
                            workingHoursTo: _workingHoursToController.text,
                            phoneNumber: _phoneNumberController.text,
                            location: _locationController.text,
                            website: _websiteController.text,
                            serviceType: _serviceTypeController.text,
                            price: _priceController.text,
                          );
                          _signUp(clinic);
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ],
            )));
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

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Have an Account?",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ClinicSignIn()));
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

  Future _signUp(Clinic clinic) async {
    setState(() {
      loading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailSignInController.text,
        password: _passwordController.text,
      );

      final clinicdoc = FirebaseFirestore.instance.collection('clinics').doc();
      clinic.id = clinicdoc.id;
      final json = clinic.toJson();
      await clinicdoc.set(json);

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
                    child: const Text('Okay'))
              ],
            ));
  }
}

class Clinic {
  String id;
  final String emailSignIn;
  final String name;
  final String email;
  final String workingHoursFrom;
  final String workingHoursTo;
  final String phoneNumber;
  final String location;
  final String website;
  final String serviceType;
  final String price;

  Clinic({
    this.id = '',
    required this.email,
    required this.emailSignIn,
    required this.name,
    required this.workingHoursFrom,
    required this.workingHoursTo,
    required this.phoneNumber,
    required this.location,
    required this.website,
    required this.serviceType,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'emailSignIn': emailSignIn,
        'name': name,
        'email': email,
        'workingHoursFrom': workingHoursFrom,
        'workingHoursTo': workingHoursTo,
        'phoneNumber': phoneNumber,
        'location': location,
        'website': website,
        'serviceType': serviceType,
        'price': price,
      };

  static Clinic fromJson(Map<String, dynamic> json) => Clinic(
        id: json['id'],
        emailSignIn: json['emailSignIn'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        workingHoursFrom: json['workingHoursFrom'] ?? '',
        workingHoursTo: json['workingHoursTo'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        location: json['location'] ?? '',
        website: json['website'] ?? '',
        serviceType: json['serviceType'] ?? '',
        price: json['price'] ?? '',
      );
}
