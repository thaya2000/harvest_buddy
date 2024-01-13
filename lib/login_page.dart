import 'package:flutter/material.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/signup_page.dart';
import 'constant.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Define text styles
    TextStyle appNameStyle = TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    return Scaffold(
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
                padding: const EdgeInsets.only(left: 30, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),

                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal:
                                    15.0), // Adjust these values as needed

                            labelText: "NIC or Mobile Number",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),

                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal:
                                    20.0), // Adjust these values as needed

                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot password?"),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        print("Validate");
                      }
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF003C3C), // Set the color without transparency
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
                    Text("Don't have an account?"),
                    Align(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text("Create account")),
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
