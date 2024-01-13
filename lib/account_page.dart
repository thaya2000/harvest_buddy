import 'package:flutter/material.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/signup_page.dart';
import 'constant.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AccountPage> {
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
    TextStyle profileName = TextStyle(
      fontSize: 15.0,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                Colors.black, // Set your desired border color
                            width: 2.0, // Set the border width
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            DPthaya,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Thevarasa Thayanan", style: profileName),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width * 0.6,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // shadow color
                              spreadRadius:
                                  2, // how much the shadow should spread
                              blurRadius: 5, // how blurry the shadow should be
                              offset:
                                  Offset(0, 2), // changes the shadow position
                            ),
                          ],
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Handle the edit account button press
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          label: Text("Edit account"),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.6,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius:
                                2, // how much the shadow should spread
                            blurRadius: 5, // how blurry the shadow should be
                            offset: Offset(0, 2), // changes the shadow position
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          // Handle the delete account button press
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                        ),
                        label: Text("Delete account"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
