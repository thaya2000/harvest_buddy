// edit_account_page.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/constant.dart';
import 'package:harvest_buddy/home_page.dart';
import 'package:harvest_buddy/utils/user_profile_helper.dart';
import 'package:harvest_buddy/utils/collection_data_retriever.dart';
import 'package:harvest_buddy/widgets/my_textfield.dart';
import 'models/auth_user.dart'; // Import your AuthUser class

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final CollectionDataRetrieverHelper _collectionDataRetrieverHelper =
      CollectionDataRetrieverHelper();

  bool isServiceProvider = false;
  late AuthUser authUser;
  late Map<String, dynamic> userData;
  late Map<String, dynamic> serviceProviderData;

  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      userData = await _collectionDataRetrieverHelper.fetchCollectionData(
          "users", user.uid);

      isServiceProvider = userData['isServiceProvider'];

      if (isServiceProvider) {
        serviceProviderData = await _collectionDataRetrieverHelper
            .fetchCollectionData("serviceProviders", user.uid);

        setState(() {
          authUser = AuthUser(
            firstName: serviceProviderData['firstName'] ?? "",
            lastName: serviceProviderData['lastName'] ?? "",
            address: serviceProviderData['address'] ?? "",
            nicNo: serviceProviderData['nicNo'] ?? "",
            phoneNumber: serviceProviderData['phoneNumber'] ?? "",
            harvesterType: serviceProviderData['harvesterType'] ?? "",
            ratePerAcre:
                serviceProviderData['ratePerAcre']?.toString() ?? "0.0",
            harvestingArea: serviceProviderData['harvestingArea'] ?? "",
          );
        });
      } else {
        setState(() {
          authUser = AuthUser(
            firstName: userData['firstName'] ?? "",
            lastName: userData['lastName'] ?? "",
            address: userData['address'] ?? "",
            nicNo: userData['nicNo'] ?? "",
            phoneNumber: userData['phoneNumber'] ?? "",
          );
        });
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  Future<void> saveEditedData() async {
    try {
      if (isServiceProvider) {
        await FirebaseFirestore.instance
            .collection("serviceProviders")
            .doc(user.uid)
            .set(authUser.toJson());
      } else {
        await FirebaseFirestore.instance
            .collection("farmers")
            .doc(user.uid)
            .set(authUser.toJson());
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );

      print('Successfully saved');
    } catch (e) {
      print('Error saving edited data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextStyle profileName = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
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
                          child: Text(authUser.firstName ?? 'Default Value',
                              style: profileName),
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
                        InputText(
                          text: authUser.firstName,
                          labelText: "First Name",
                          onChanged: (value) {
                            authUser.firstName = value;
                          },
                        ),
                        InputText(
                          text: authUser.lastName,
                          labelText: "Last Name",
                          onChanged: (value) {
                            authUser.lastName = value;
                          },
                        ),
                        InputText(
                          text: authUser.nicNo,
                          labelText: "NIC Number",
                          onChanged: (value) {
                            authUser.nicNo = value;
                          },
                        ),
                        InputText(
                          text: authUser.phoneNumber,
                          labelText: "Phone Number",
                          onChanged: (value) {
                            authUser.phoneNumber = value;
                          },
                        ),
                        InputText(
                          text: authUser.address,
                          labelText: "Address",
                          onChanged: (value) {
                            authUser.address = value;
                          },
                        ),
                        if (isServiceProvider)
                          InputText(
                            text: authUser.harvesterType,
                            labelText: "Harvester Type",
                            onChanged: (value) {
                              authUser.harvesterType = value;
                            },
                          ),
                        if (isServiceProvider)
                          InputText(
                            text: authUser.ratePerAcre,
                            labelText: "Rate Per Acre",
                            onChanged: (value) {
                              authUser.ratePerAcre = value;
                            },
                          ),
                        if (isServiceProvider)
                          InputText(
                            text: authUser.harvestingArea,
                            labelText: "Working Area",
                            onChanged: (value) {
                              authUser.harvestingArea = value;
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextButton(
                      onPressed: saveEditedData,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF003C3C),
                        ),
                      ),
                      child: const Text(
                        "Save changes",
                        style: TextStyle(
                          color: Colors.white,
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
