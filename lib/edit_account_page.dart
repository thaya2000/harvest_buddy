import 'package:flutter/material.dart';
import 'package:harvest_buddy/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditAccount(),
    );
  }
}

class EditAccount extends StatefulWidget {
  EditAccount({super.key});

  @override
  State<EditAccount> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<EditAccount> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Assume these are the default values received from the backend
    String firstNameDefaultValue = "Thevarasa";
    String lastNameDefaultValue = "Thayanan";
    String addressDefaultValue = "123, Thamapsiddy road, Point Pedro, Jaffna";
    String nicNumberDefaultValue = "123456789";
    String phoneNumberDefaultValue = "555-555-5555";

    // Create controllers with default values
    TextEditingController firstNameController =
        TextEditingController(text: firstNameDefaultValue);
    TextEditingController lastNameController =
        TextEditingController(text: lastNameDefaultValue);
    TextEditingController addressController =
        TextEditingController(text: addressDefaultValue);
    TextEditingController nicNumberController =
        TextEditingController(text: nicNumberDefaultValue);
    TextEditingController phoneNumberController =
        TextEditingController(text: phoneNumberDefaultValue);

    // Define text styles
    TextStyle profileName = TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center, // Align the child to the center vertically
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: firstNameController,
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
                              labelText: "First Name",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: lastNameController,
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
                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: addressController,
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
                              labelText: "Address",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: nicNumberController,
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
                              labelText: "NIC Number",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: phoneNumberController,
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
                              labelText: "Phone Number",
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
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Save changes",
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(
                              0xFF003C3C), // Set the color without transparency
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
