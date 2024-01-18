import 'package:flutter/material.dart';
import 'package:harvest_buddy/confirm_booking_page.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
  });

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
                    color: const Color.fromARGB(255, 215, 233, 245)),
                child: const Column(
                  children: <Widget>[
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Service Provider Name")),
                    Center(child: Text("Vithusan B"))
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
                    color: const Color.fromARGB(255, 253, 238, 219)),
                child: const Column(
                  children: <Widget>[
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Harvester Type")),
                    Center(child: Text("Kubota 70G+")),
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
                    color: const Color.fromARGB(255, 27, 180, 14)),
                child: const Column(
                  children: <Widget>[
                    Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Availabe Slot",
                          style: TextStyle(color: Colors.white),
                        )),
                    Center(
                        child: Text(
                      "Morning Slot",
                      style: TextStyle(color: Colors.white),
                    )),
                    Center(
                        child: Text(
                      "Afternoon Slot",
                      style: TextStyle(color: Colors.white),
                    )),
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
                        color: Colors.white),
                    child: const Column(
                      children: <Widget>[
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text("Rating")),
                        Center(child: Text("4.5")),
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
                        color: Colors.white),
                    child: const Column(
                      children: <Widget>[
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text("Rate Per Acre")),
                        Center(child: Text("LKR 15000")),
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
                            builder: (context) => const ConfirmBooking()),
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
