import 'package:flutter/material.dart';
import 'package:harvest_buddy/confirm_booking_page.dart';

class BookingCard extends StatelessWidget {
  final String serviceProviderName;
  final String harvesterType;
  final List<String> availableSlots;
  final double rating;
  final double ratePerAcre;

  const BookingCard({
    required this.serviceProviderName,
    required this.harvesterType,
    required this.availableSlots,
    required this.rating,
    required this.ratePerAcre,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 215, 233, 245),
                ),
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("Service Provider Name"),
                    ),
                    Center(child: Text(serviceProviderName)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 253, 238, 219),
                ),
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("Harvester Type"),
                    ),
                    Center(child: Text(harvesterType)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 27, 180, 14),
                ),
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Available Slots",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    for (String slot in availableSlots)
                      Center(
                        child: Text(
                          slot,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, right: 10),
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text("Rating"),
                        ),
                        Center(child: Text(rating.toString())),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, right: 10),
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text("Rate Per Acre"),
                        ),
                        Center(child: Text("LKR $ratePerAcre")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmBooking(
                            serviceProviderName: serviceProviderName,
                            harvesterType: harvesterType,
                            availableSlots: availableSlots,
                            rating: rating,
                            ratePerAcre: ratePerAcre,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red, // Set the color without transparency
                      ),
                    ),
                    child: const Text(
                      "Book now",
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
