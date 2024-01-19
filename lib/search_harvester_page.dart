import 'package:flutter/material.dart';
import 'package:harvest_buddy/widgets/booking_card.dart';

class SearchHarvester extends StatefulWidget {
  const SearchHarvester({super.key});

  @override
  State<SearchHarvester> createState() => _HomePageState();
}

class _HomePageState extends State<SearchHarvester> {
  final String serviceProviderName = "ServiceProvider";
  final String harvesterType = "ML1151515";
  final List<String> availableSlots = [
    "Morning slot",
    "Afternoon slot",
    "Evening slot"
  ];
  final double rating = 4.5;
  final double ratePerAcre = 15000;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Define text styles
    TextStyle appNameStyle = const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60), // Set a fully opaque color
    );
    TextStyle h1style = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60), // Set a fully opaque color
    );

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(
              255, 0, 120, 120), // Set your desired background color
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(20.0), // Set your desired bottom-left radius
              bottomRight:
                  Radius.circular(20.0), // Set your desired bottom-right radius
            ),
          ),
          title: Container(
            child: const Column(
              children: [
                Text(
                  "Mallavi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "2024-02-29",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: width * 0.6,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(10),
                child: const Center(child: Text("6 Harvesters found")),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    BookingCard(
                      serviceProviderName: serviceProviderName,
                      harvesterType: harvesterType,
                      availableSlots: availableSlots,
                      rating: rating,
                      ratePerAcre: ratePerAcre,
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
