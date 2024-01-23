// signup_page.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/my_textfield.dart';
import 'models/auth_user.dart';
import 'models/farmer.dart';
import 'models/service_provider.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthUser authUser = AuthUser();

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
          email: authUser.email ?? "abc@gmail.com",
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

      print(authUser.toJson());

      if (authUser.isServiceProvider ?? false) {
        ServiceProvider serviceProvider = authUser.toServiceProvider();
        await FirebaseFirestore.instance
            .collection('serviceProviders')
            .doc(serviceProvider.userId)
            .set(serviceProvider.toJson());
      } else {
        Farmer farmer = authUser.toFarmer();
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
                        text: authUser.email = "abc@gmail.com",
                        labelText: "Username or email",
                        onChanged: (value) => authUser.email = value,
                      ),
                      InputText(
                        text: authUser.firstName = "Thaya",
                        labelText: "First Name",
                        onChanged: (value) => authUser.firstName = value,
                      ),
                      InputText(
                        text: authUser.lastName = "Theva",
                        labelText: "Last Name",
                        onChanged: (value) => authUser.lastName = value,
                      ),
                      InputText(
                        text: authUser.address = "NO 123, ABC Road, Colombo 05",
                        labelText: "Address",
                        onChanged: (value) => authUser.address = value,
                      ),
                      InputText(
                        text: authUser.nicNo = "123456789V",
                        labelText: "Nic Number",
                        onChanged: (value) => authUser.nicNo = value,
                      ),
                      InputText(
                        text: authUser.phoneNumber = "0712345678",
                        labelText: "Phone Number",
                        onChanged: (value) => authUser.phoneNumber = value,
                      ),
                      InputText(
                        text: authUser.password = "123456",
                        labelText: "Password",
                        onChanged: (value) => authUser.password = value,
                        obscureText: true,
                      ),
                      InputText(
                        text: authUser.confirmPassword = "123456",
                        labelText: "Confirm Password",
                        onChanged: (value) => authUser.confirmPassword = value,
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
