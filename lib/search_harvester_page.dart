import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/activity_card.dart';
import 'package:harvest_buddy/widgets/booking_card.dart';
import 'package:harvest_buddy/widgets/high_rated_card.dart';
import 'constant.dart';
import 'signup_page.dart';

class SearchHarvester extends StatefulWidget {
  SearchHarvester({super.key});

  @override
  State<SearchHarvester> createState() => _HomePageState();
}

class _HomePageState extends State<SearchHarvester> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Define text styles
    TextStyle appNameStyle = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60), // Set a fully opaque color
    );
    TextStyle h1style = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60), // Set a fully opaque color
    );

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(
              255, 0, 120, 120), // Set your desired background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(20.0), // Set your desired bottom-left radius
              bottomRight:
                  Radius.circular(20.0), // Set your desired bottom-right radius
            ),
          ),
          title: Container(
            child: Column(
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
                    color: Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(10),
                child: Center(child: Text("6 Harvesters found")),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    BookingCard(),
                    BookingCard(),
                    BookingCard(),
                    BookingCard(),
                    BookingCard(),
                    BookingCard(),
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
