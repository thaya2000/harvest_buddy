import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/activity_card.dart';
import 'package:harvest_buddy/widgets/booking_card.dart';
import 'package:harvest_buddy/widgets/high_rated_card.dart';
import 'constant.dart';
import 'signup_page.dart';

class ConfirmBooking extends StatefulWidget {
  ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _HomePageState();
}

class _HomePageState extends State<ConfirmBooking> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Define text styles
    TextStyle appNameStyle = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60), // Set a fully opaque color
    );
    TextStyle h1style = TextStyle(
      fontSize: 12.0,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Text(
                  "Service Provider - Mr B. Vithusan",
                  style: appNameStyle,
                ),
                Text(
                  "Phone Number - 0777123456",
                  style: h1style,
                ),
                Text(
                  "Harvester Type - Kubota 70G+",
                  style: h1style,
                ),
                Text(
                  "Rating - 4.5(15)",
                  style: h1style,
                ),
                Text(
                  "Rate Per Acre - 0777123456",
                  style: h1style,
                ),
              ],
            ),
          ),
          Text(
            "Schedule - 2024-02-24",
            style: appNameStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Center(child: Text("Sold Out")),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Pending")),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Selected")),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  // width: MediaQuery.of(context).size.width * 0.4,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Morning Slot",
                      style: TextStyle(
                        color: Colors.black, // Set the text color to white
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // width: MediaQuery.of(context).size.width * 0.4,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Afternoon Slot",
                      style: TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              // width: MediaQuery.of(context).size.width * 0.4,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Evening Slot",
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: height * 0.08,
              width: width * 0.9,
              child: Material(
                elevation: 0.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter you paddy field location',
                    suffixIcon: Icon(Icons.location_on),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.1,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Confirm booking",
                  style: TextStyle(
                    color: Colors.white, // Set the text color to white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
