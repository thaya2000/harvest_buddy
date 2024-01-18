import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/edit_account_page.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/utils/user_profile_helper.dart';
import 'constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AccountPage> {
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String firstName = "";
  final UserProfileHelper _profileHelper = UserProfileHelper();
  @override
  void initState() {
    super.initState();
    fetchProfileName();
  }

  Future<void> fetchProfileName() async {
    final Map<String, dynamic> userProfile =
        await _profileHelper.fetchUserProfile();
    final String firstNameValue = userProfile['firstName'] ?? '';
    final String lastNameValue = userProfile['lastName'] ?? '';

    firstName = firstNameValue + " " + lastNameValue;
    print(firstName);
  }

  Future<void> _showDeleteAccountConfirmatiomDialog(
      BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete account'),
          content: const Text('Are you sure you want to delete account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await deleteAccount(); // Corrected call
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform logout and navigate to LandingPage
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );

      print('Successfully deleted');

      // Optional: You can update the local state or perform other actions after saving
    } catch (e) {
      print('Error saving edited data: $e');
    }
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
    TextStyle profileName = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Set your desired border color
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
                      child: Text(firstName, style: profileName),
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
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius:
                                2, // how much the shadow should spread
                            blurRadius: 5, // how blurry the shadow should be
                            offset: const Offset(
                                0, 2), // changes the shadow position
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditAccount()),
                                builder: (context) => const EditAccount()),
                          );
                        },
                        icon: const Icon(
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                        ),
                        label: const Text("Edit account"),
                        label: const Text("Edit account"),
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
                          spreadRadius: 2, // how much the shadow should spread
                          blurRadius: 5, // how blurry the shadow should be
                          offset:
                              const Offset(0, 2), // changes the shadow position
                        ),
                      ],
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        _showDeleteAccountConfirmatiomDialog(context);
                      },
                      icon: const Icon(
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                      ),
                      label: const Text("Delete account"),
                      label: const Text("Delete account"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: SizedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      _showLogoutConfirmationDialog(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red, // Set the color without transparency
                      ),
                    ),
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
