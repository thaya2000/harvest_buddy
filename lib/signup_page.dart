// signup_page.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/my_textfield.dart';
import 'models/auth_user.dart';
import 'models/farmer.dart';
import 'models/service_provider.dart'; // Corrected import

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final AuthUser authUser = AuthUser();
  final Farmer farmer = Farmer();
  final ServiceProvider serviceProvider = ServiceProvider();

  void signUserUp() async {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      if (authUser.password == authUser.confirmPassword) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: authUser.email ?? "sample@gmail.com",
          password: authUser.password ?? "123456",
        );

        authUser.userId = userCredential.user?.uid ?? 'defaultUserId';

        await addUserDetails();

        Navigator.push(
          scaffoldKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => LoginScreen(
              onTap: () {},
            ),
          ),
        );
      } else {
        Navigator.pop(context);
        genericErrorMessage("Password doesn't match!");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      genericErrorMessage(e.code);
    }
  }

  Future<void> addUserDetails() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authUser.userId)
          .set(authUser.toJson());

      if (authUser.isServiceProvider ?? false) {
        serviceProvider.userId = authUser.userId;
        serviceProvider.firstName = authUser.firstName;
        serviceProvider.lastName = authUser.lastName;
        serviceProvider.address = authUser.address;
        serviceProvider.phoneNumber = authUser.phoneNumber;
        serviceProvider.nicNo = authUser.nicNo;
        serviceProvider.harvesterType = authUser.harvesterType;
        // serviceProvider.ratePerAcre =
        //     double.tryParse(authUser.ratePerAcre ?? "0") ?? 20000.0;
        serviceProvider.ratePerAcre = authUser.ratePerAcre;
        serviceProvider.harvestingArea = authUser.harvestingArea;

        await FirebaseFirestore.instance
            .collection('serviceProviders')
            .doc(authUser.userId)
            .set(serviceProvider.toJson());
      } else {
        farmer.userId = authUser.userId;
        farmer.firstName = authUser.firstName;
        farmer.lastName = authUser.lastName;
        farmer.address = authUser.address;
        farmer.phoneNumber = authUser.phoneNumber;
        farmer.nicNo = authUser.nicNo;

        await FirebaseFirestore.instance
            .collection('farmers')
            .doc(authUser.userId)
            .set(farmer.toJson());
      }

      print('User details uploaded successfully!');
    } catch (e) {
      print('Error uploading user details: $e');
    }
  }

  void genericErrorMessage(String message) {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Create",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 60, 60),
                            ),
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "account!",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 60, 60),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: Column(
                    children: [
                      InputText(
                        text: authUser.email,
                        labelText: "Username or email",
                      ),
                      InputText(
                        text: authUser.firstName,
                        labelText: "First Name",
                      ),
                      InputText(
                        text: authUser.lastName,
                        labelText: "Last Name",
                      ),
                      InputText(
                        text: authUser.address,
                        labelText: "Address",
                      ),
                      InputText(
                        text: authUser.nicNo,
                        labelText: "Nic Number",
                      ),
                      InputText(
                        text: authUser.phoneNumber,
                        labelText: "Phone Number",
                      ),
                      InputText(
                        text: authUser.password,
                        labelText: "Password",
                        obscureText: true,
                      ),
                      InputText(
                        text: authUser.confirmPassword,
                        labelText: "Confirm Password",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text('Create account as Service Provider'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Visibility(
                  visible: isChecked,
                  child: Column(
                    children: [
                      InputText(
                        text: authUser.harvesterType,
                        labelText: "Harvester Type",
                      ),
                      InputText(
                        text: authUser.ratePerAcre,
                        labelText: "Enter Rate Per Acre",
                      ),
                      InputText(
                        text: authUser.harvestingArea,
                        labelText: "Harvesting Area",
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextButton(
                    onPressed: signUserUp,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF003C3C),
                      ),
                    ),
                    child: const Text(
                      "Create account",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    Align(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      onTap: () {},
                                    )),
                          );
                        },
                        child: const Text("Sign in"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
