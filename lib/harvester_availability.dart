import 'package:flutter/material.dart';
import 'package:harvest_buddy/widgets/time_slot.dart';

class HarvesterAvailability extends StatelessWidget {
  const HarvesterAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 50),
                child: Text(
                  "Post Your Availability!",
                  style: appNameStyle,
                ),
              ),
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Text(
                        "2024-02-12",
                        style: h1style,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TimeSlot(
                          timeSlot: "Morning Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Afternoon Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Evening Slot",
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Text(
                        "2024-02-12",
                        style: h1style,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TimeSlot(
                          timeSlot: "Morning Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Afternoon Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Evening Slot",
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Text(
                        "2024-02-12",
                        style: h1style,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TimeSlot(
                          timeSlot: "Morning Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Afternoon Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Evening Slot",
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Text(
                        "2024-02-12",
                        style: h1style,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TimeSlot(
                          timeSlot: "Morning Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Afternoon Slot",
                        ),
                        TimeSlot(
                          timeSlot: "Evening Slot",
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 70, top: 50.0),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey), // Add border color
                          borderRadius:
                              BorderRadius.circular(5), // Add border radius
                        ),
                        margin: EdgeInsets.only(right: 8),
                      ),
                      Text("Not Selected"),
                      SizedBox(width: 16),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                              color: Colors.grey), // Add border color
                          borderRadius:
                              BorderRadius.circular(5), // Add border radius
                        ),
                        margin: EdgeInsets.only(right: 8),
                      ),
                      Text("Selected"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      width: width * 0.4,
                      height: width * 0.1,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Save Changes",
                          style: TextStyle(
                            color: Colors.white, // Set the text color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
