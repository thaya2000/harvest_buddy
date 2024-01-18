import 'package:flutter/material.dart';
import 'package:harvest_buddy/widgets/time_slot.dart';

class HarvesterAvailability extends StatelessWidget {
  const HarvesterAvailability({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextStyle appNameStyle = const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    TextStyle h1style = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    // Calculate the next four days
    List<String> nextFourDays = [];
    for (int i = 1; i <= 4; i++) {
      DateTime nextDate = DateTime.now().add(Duration(days: i));
      nextFourDays.add("${nextDate.year}-${nextDate.month}-${nextDate.day}");
    }

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
            children: List.generate(nextFourDays.length, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      nextFourDays[index],
                      style: h1style,
                    ),
                  ),
                  const Row(
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
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 70, top: 50.0),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                ),
                const Text("Not Selected"),
                const SizedBox(width: 16),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                ),
                const Text("Selected"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width * 0.4,
                height: width * 0.1,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
