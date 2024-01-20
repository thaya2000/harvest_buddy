// login_page.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/home_page.dart';
import 'package:harvest_buddy/home_service_provider.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/signup_page.dart';
import 'package:harvest_buddy/widgets/my_textfield.dart';
import 'models/auth_user.dart'; // Import your AuthUser class

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final AuthUser authUser = AuthUser();

  void signIn() async {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authUser.email ?? "Sample@email.com",
        password: authUser.password ?? "123456",
      );

      final user = FirebaseAuth.instance.currentUser!;

      DocumentSnapshot userSnapshot = await userCollection.doc(user.uid).get();
      Map<String, dynamic> _userData =
          userSnapshot.data() as Map<String, dynamic>;

      print('farmer Data: $_userData');

      if (_userData['isServiceProvider']) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeServiceProvider()),
        );
        print("Service Provider Login page");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        print("Farmer Login page");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      genericErrorMessage(e.code);
    }
  }

  void genericErrorMessage(String message) {
    showDialog(
      context: context,
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Define text styles
    TextStyle appNameStyle = const TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

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
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 50),
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
                                  builder: (context) => const LandingPage()),
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        "Welcome back!",
                        style: appNameStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: Container(
                  child: Column(
                    children: [
                      InputText(
                        text: authUser.email,
                        labelText: "Email",
                      ),
                      InputText(
                        text: authUser.password,
                        labelText: "Password",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?"),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextButton(
                    onPressed: signIn,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(
                            0xFF003C3C), // Set the color without transparency
                      ),
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
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
                    const Text("Don't have an account?"),
                    Align(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen(
                                        onTap: () {},
                                      )),
                            );
                          },
                          child: const Text("Create account")),
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
