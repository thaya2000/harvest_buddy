import 'package:flutter/material.dart';
import 'package:harvest_buddy/widgets/activity_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _HomePageState();
}

class _HomePageState extends State<ActivityScreen> {
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
      // backgroundColor: Color.fromARGB(255, 0, 200, 200),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 90),
                child: Text(
                  "Your Activities!",
                  style: appNameStyle,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 0;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Upcoming",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 4), // Add a gap between text and line
                        Container(
                          height: 2,
                          width: 80, // Set your desired line width
                          color: selectedButtonIndex == 0
                              ? Colors
                                  .grey // Set your desired line color when selected
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 4), // Add a gap between text and line
                        Container(
                          height: 2,
                          width: 80, // Set your desired line width
                          color: selectedButtonIndex == 1
                              ? Colors
                                  .grey // Set your desired line color when selected
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            (selectedButtonIndex == 0
                ? const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                        ],
                      ),
                    ),
                  )
                : const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2023-12-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                          ActivityCard(
                            bookingId: "723452",
                            district: "Mullaitivu",
                            area: "Mallavi",
                            bookingDate: "2024-02-29",
                            timeSlot: "Morning Slot",
                            harvesterPhone: "0777123456",
                          ),
                        ],
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
