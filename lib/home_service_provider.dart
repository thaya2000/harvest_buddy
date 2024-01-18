import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/activity_page.dart';
import 'package:harvest_buddy/harvester_availability.dart';
import 'package:harvest_buddy/widgets/activity_card_service_provider.dart';
import 'package:harvest_buddy/widgets/time_slot.dart';

class HomeServiceProvider extends StatefulWidget {
  const HomeServiceProvider({super.key});

  @override
  State<HomeServiceProvider> createState() => _HomePageState();
}

class _HomePageState extends State<HomeServiceProvider> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContentServiceProvider(),
    const HarvesterAvailability(),
    const ActivityScreen(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 0, 200, 200),
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.event, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContentServiceProvider extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController locationController = TextEditingController();
  DateTime? selectedDate;

  HomeContentServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextEditingController dateController = TextEditingController();
    FocusNode locationFocusNode = FocusNode();
    FocusNode dateFocusNode = FocusNode();

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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 50),
                child: Text(
                  "Welcome Vithusan!",
                  style: appNameStyle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    "Next Activities",
                    style: h1style,
                  ),
                ),
                const Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: <Widget>[
                        ActivityCardServiceProvider(
                          date: "2024-02-20",
                          timeSlot: "Morning Slot",
                          customerName: "Mr Thayanan",
                          paddyLandAddress: "10th lake Pandiyankulam",
                          customerPhoneNumber: "0777123456",
                        ),
                        ActivityCardServiceProvider(
                          date: "2024-02-20",
                          timeSlot: "Morning Slot",
                          customerName: "Mr Thayanan",
                          paddyLandAddress: "10th lake Pandiyankulam",
                          customerPhoneNumber: "0777123456",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    "Are you available on 2024-02-29",
                    style: h1style,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: const Row(
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
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 70, top: 10),
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
                        margin: const EdgeInsets.only(right: 8),
                      ),
                      const Text("Not Selected"),
                      const SizedBox(width: 16),
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
                          borderRadius: BorderRadius.circular(10)),
                      width: width * 0.4,
                      height: width * 0.1,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Confirm",
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
          ],
        ),
      ),
    );
  }
}
