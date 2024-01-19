import 'package:flutter/material.dart';
import 'package:harvest_buddy/widgets/booking_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchHarvester extends StatefulWidget {
  const SearchHarvester({Key? key});

  @override
  State<SearchHarvester> createState() => _HomePageState();
}

class _HomePageState extends State<SearchHarvester> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 120, 120),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        title: const Text("Mallavi"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // Container(
              //   width: width * 0.6,
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 227, 227, 227),
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   margin: const EdgeInsets.all(25),
              //   padding: const EdgeInsets.all(10),
              //   child: const Center(child: Text("Harvesters found")),
              // ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('serviceProviders')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Text("No service providers available");
                  }

                  List<Map<String, dynamic>> harvestersData =
                      snapshot.data!.docs.map((document) {
                    return document.data() as Map<String, dynamic>;
                  }).toList();

                  int numberOfHarvesters = harvestersData.length;

                  return Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 227, 227),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.all(25),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child:
                                Text("$numberOfHarvesters Harvesters found")),
                      ),
                      Column(
                        children: harvestersData.map((data) {
                          print("data: $data");
                          return BookingCard(
                            serviceProviderName: data['firstName'] ?? '',
                            harvesterType: data['harvesterType'] ?? '',
                            availableSlots: List<String>.from(
                                data['availableSlots'] ??
                                    ["Morning Slot", "Evening Slot"]),
                            rating: (data['rating'] as num?)?.toDouble() ?? 5.0,
                            ratePerAcre: (data['ratePerAcre']) ?? 16000.00,
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
