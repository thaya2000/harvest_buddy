import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/edit_account_page.dart';
import 'package:harvest_buddy/landing_page.dart';
import 'package:harvest_buddy/utils/collection_data_retriever.dart';
import 'constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key});

  @override
  State<AccountPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AccountPage> {
  bool isServiceProvider = false;
  late Map<String, dynamic> _userData;
  late Map<String, dynamic> _farmerData;
  late Map<String, dynamic> _serviceProviderData;
  final CollectionDataRetrieverHelper _collectionDataRetrieverHelper =
      CollectionDataRetrieverHelper();
  final user = FirebaseAuth.instance.currentUser!;
  late String profileFullName = "";

  @override
  void initState() {
    super.initState();
    fetchProfileName();
  }

  Future<void> fetchProfileName() async {
    _userData = await _collectionDataRetrieverHelper.fetchCollectionData(
        "users", user.uid);

    if (_userData['isServiceProvider']) {
      _serviceProviderData = await _collectionDataRetrieverHelper
          .fetchCollectionData("serviceProviders", user.uid);
      final String firstNameValue = _serviceProviderData['firstName'] ?? '';
      final String lastNameValue = _serviceProviderData['lastName'] ?? '';

      setState(() {
        profileFullName = "$firstNameValue $lastNameValue";
      });

      print("Service provider name");
      print(profileFullName);
    } else {
      _farmerData = await _collectionDataRetrieverHelper.fetchCollectionData(
          "users", user.uid);
      final String firstNameValue = _farmerData['firstName'] ?? '';
      final String lastNameValue = _farmerData['lastName'] ?? '';

      setState(() {
        profileFullName = "$firstNameValue $lastNameValue";
      });

      print("Farmer name");
      print(profileFullName);
    }
  }

  Future<void> _showDeleteAccountConfirmationDialog(
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
                await deleteAccount();
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
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
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        try {
          final userDoc = await FirebaseFirestore.instance
              .collection(
                  'users') // Replace 'users' with the actual collection name
              .doc(currentUser.uid)
              .get();

          if (userDoc.exists) {
            final isServiceProvider =
                userDoc.data()?['isServiceProvider'] ?? false;

            if (isServiceProvider) {
              await FirebaseFirestore.instance
                  .collection('serviceProviders')
                  .doc(currentUser.uid)
                  .delete();
            } else {
              await FirebaseFirestore.instance
                  .collection('farmers')
                  .doc(currentUser.uid)
                  .delete();
            }
          } else {
            print('User document does not exist.');
          }

          await FirebaseFirestore.instance
              .collection(
                  'users') // Replace 'users' with the actual collection name
              .doc(currentUser.uid)
              .delete();
        } catch (e) {
          print('Error fetching user document: $e');
        }
      }

      await FirebaseAuth.instance.currentUser?.delete();
      await FirebaseAuth.instance.signOut();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
      print('Successfully deleted');
    } catch (e) {
      print('Error deleting account: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                          color: Colors.black,
                          width: 2.0,
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
                      child: Text(profileFullName, style: profileNameTextStyle),
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
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditAccount(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                        ),
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
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        _showDeleteAccountConfirmationDialog(context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                      ),
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextButton(
                    onPressed: () {
                      _showLogoutConfirmationDialog(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red,
                      ),
                    ),
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.white,
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

// Define text style
TextStyle profileNameTextStyle = const TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 0, 60, 60),
);
