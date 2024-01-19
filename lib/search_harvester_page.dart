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
              Container(
                width: width * 0.6,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 227, 227),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(10),
                child: const Center(child: Text("Harvesters found")),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('serviceproviders')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text("No service providers available");
                  }

                  return Column(
                    children: snapshot.data!.docs.map((document) {
                      var data = document.data() as Map<String, dynamic>;

                      print("data: $data");

                      return BookingCard(
                        serviceProviderName: data['serviceProviderName'],
                        harvesterType: data['harvesterType'],
                        availableSlots:
                            List<String>.from(data['availableSlots']),
                        rating: data['rating'].toDouble(),
                        ratePerAcre: data['ratePerAcre'].toDouble(),
                      );
                    }).toList(),
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
