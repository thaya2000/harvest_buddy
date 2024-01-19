import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/constant.dart';
import 'package:harvest_buddy/utils/user_profile_helper.dart';
import 'package:harvest_buddy/utils/collection_data_retriever.dart';
import 'package:harvest_buddy/widgets/my_textfield.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final CollectionDataRetrieverHelper _collectionDataRetrieverHelper =
      CollectionDataRetrieverHelper();

  // final UserProfileHelper _profileHelper = UserProfileHelper();

  bool isServiceProvider = false;
  late Map<String, dynamic> _userData;
  late Map<String, dynamic> _farmerData;
  late Map<String, dynamic> _serviceProviderData;

  final user = FirebaseAuth.instance.currentUser!;

  // final CollectionReference farmersCollection =
  //     FirebaseFirestore.instance.collection("farmers");

  // Create controllers with default values
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _nicNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _harvestTypeController = TextEditingController();
  final _harvestRatePerAcreController = TextEditingController();
  final _workingAreaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  // Function to fetch profile data and update controllers
  Future<void> fetchProfileData() async {
    try {
      _userData = await _collectionDataRetrieverHelper.fetchCollectionData(
          "users", user.uid);

      isServiceProvider = _userData['isServiceProvider'];

      print(_userData);
      if (_userData['isServiceProvider']) {
        _serviceProviderData = await _collectionDataRetrieverHelper
            .fetchCollectionData("serviceProviders", user.uid);

        print('Service Provider Data: $_serviceProviderData');

        setState(() {
          _firstNameController.text = _serviceProviderData['firstName'] ?? "";
          _lastNameController.text = _serviceProviderData['lastName'] ?? "";
          _addressController.text = _serviceProviderData['address'] ?? "";
          _nicNumberController.text = _serviceProviderData['nicNo'] ?? "";
          _phoneNumberController.text =
              _serviceProviderData['phoneNumber'] ?? "";
          _harvestTypeController.text =
              _serviceProviderData['harvesterType'] ?? "";
          _harvestRatePerAcreController.text =
              _serviceProviderData['ratePerAcre'] ?? "";
          _workingAreaController.text =
              _serviceProviderData['harvestingArea'] ?? "";
        });
      } else {
        _farmerData = await _collectionDataRetrieverHelper.fetchCollectionData(
            "farmers", user.uid);

        print('farmer Data: $_farmerData');

        setState(() {
          _firstNameController.text = _farmerData['firstName'] ?? "";
          _lastNameController.text = _farmerData['lastName'] ?? "";
          _addressController.text = _farmerData['address'] ?? "";
          _nicNumberController.text = _farmerData['nicNo'] ?? "";
          _phoneNumberController.text = _farmerData['phoneNumber'] ?? "";
        });
      }

      // _farmerData = await _profileHelper.fetchUserProfile();

      // DocumentSnapshot farmerSnapshot =
      //     await farmersCollection.doc(user.uid).get();

      // DocumentSnapshot farmerSnapshot = await FirebaseFirestore.instance
      //     .collection("farmers")
      //     .doc(user.uid)
      //     .get();

      // Map<String, dynamic> userData =
      //     farmerSnapshot.data() as Map<String, dynamic>;
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  Future<void> saveEditedData() async {
    try {
      if (_userData['isServiceProvider']) {
        await FirebaseFirestore.instance
            .collection("serviceProviders")
            .doc(user.uid)
            .set({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'address': _addressController.text,
          'nicNo': _nicNumberController.text,
          'phoneNumber': _phoneNumberController.text,
          'harvesterType': _harvestTypeController.text,
          'ratePerAcre': _harvestRatePerAcreController.text,
        });
      } else {
        await FirebaseFirestore.instance
            .collection("farmers")
            .doc(user.uid)
            .set({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'address': _addressController.text,
          'nicNo': _nicNumberController.text,
          'phoneNumber': _phoneNumberController.text,
        });
      }

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountPage()),
      );

      print('Successfully saved');

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
        alignment: Alignment.center, // Align the child to the center vertically
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
                          child: Text(_firstNameController.text,
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
                          controller: _firstNameController,
                          labelText: "First Name",
                        ),
                        InputText(
                          controller: _lastNameController,
                          labelText: "Last Name",
                        ),
                        InputText(
                          controller: _nicNumberController,
                          labelText: "NIC Number",
                        ),
                        InputText(
                          controller: _phoneNumberController,
                          labelText: "Phone Number",
                        ),
                        InputText(
                          controller: _addressController,
                          labelText: "Address",
                        ),
                        if (isServiceProvider)
                          InputText(
                            controller: _harvestTypeController,
                            labelText: "Harvester Type",
                          ),
                        if (isServiceProvider)
                          InputText(
                            controller: _harvestRatePerAcreController,
                            labelText: "Rate Per Acre",
                          ),
                        if (isServiceProvider)
                          InputText(
                            controller: _workingAreaController,
                            labelText: "Working Area",
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
                          const Color(
                              0xFF003C3C), // Set the color without transparency
                        ),
                      ),
                      child: const Text(
                        "Save changes",
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
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
