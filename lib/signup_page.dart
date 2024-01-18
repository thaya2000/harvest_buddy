import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/my_textfield.dart';
import '../models/user.dart' as model;

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController(text: "default1@example.com");
  final passwordController = TextEditingController(text: "asd123");
  final confirmPasswordController = TextEditingController(text: "asd123");
  final firstNameController = TextEditingController(text: "Thaya");
  final lastNameController = TextEditingController(text: "Theva");
  final addressController =
      TextEditingController(text: "N012, Hapugala, Galle.");
  final phoneNumberController = TextEditingController(text: "+94712345678");
  final nicNoController = TextEditingController(text: "200000000V");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;
  void signUserUp() async {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        await addUserDetails(
            emailController.text,
            passwordController.text,
            firstNameController.text,
            lastNameController.text,
            addressController.text,
            phoneNumberController.text,
            nicNoController.text,
            userCredential.user?.uid);

        Navigator.push(
          scaffoldKey.currentContext!,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    onTap: () {},
                  )),
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

  Future<void> addUserDetails(
    String email,
    String password,
    String firstName,
    String lastName,
    String address,
    String phoneNumber,
    String nicNo,
    String? userId,
  ) async {
    try {
      model.User user = model.User(
        userId: userId!,
        password: password,
        email: email,
        firstName: 'Thaya',
        lastName: 'Theva',
        address: 'N012, Hapugala, Galle.',
        phoneNumber: '+94712345678',
        nicNo: '200000000V',
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(user.toJson());
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
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()),
                            );
                          },
                        ),
                      ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  child: Column(
                    children: [
                      InputText(
                        controller: emailController,
                        labelText: "Username or email",
                      ),
                      InputText(
                        controller: firstNameController,
                        labelText: "First Name",
                      ),
                      InputText(
                        controller: lastNameController,
                        labelText: "Last Name",
                      ),
                      InputText(
                        controller: addressController,
                        labelText: "Address",
                      ),
                      InputText(
                        controller: nicNoController,
                        labelText: "Nic Number",
                      ),
                      InputText(
                        controller: phoneNumberController,
                        labelText: "Phone Number",
                      ),
                      InputText(
                        controller: passwordController,
                        labelText: "Password",
                      ),
                      InputText(
                        controller: confirmPasswordController,
                        labelText: "Confirm Password",
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
                  Text('Create account as Service Provider'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Visibility(
                  visible: isChecked,
                  child: Column(
                    children: [
                      InputText(
                        controller: emailController,
                        labelText: "Harvester Type",
                      ),
                      InputText(
                        controller: firstNameController,
                        labelText: "Enter Rate Per Acre",
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
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
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
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
