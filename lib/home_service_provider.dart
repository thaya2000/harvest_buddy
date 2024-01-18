import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/activity_page.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/schedule_page.dart';
import 'package:harvest_buddy/search_harvester_page.dart';
import 'package:harvest_buddy/widgets/activity_card_service_provider.dart';
import 'package:harvest_buddy/widgets/high_rated_card.dart';
import 'constant.dart';
import 'signup_page.dart';

class HomeServiceProvider extends StatefulWidget {
  HomeServiceProvider({super.key});

  @override
  State<HomeServiceProvider> createState() => _HomePageState();
}

class _HomePageState extends State<HomeServiceProvider> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContentServiceProvider(),
    // SchedulePage(),
    // ActivityScreen(),
    // AccountPage(),
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
        color: Color.fromARGB(255, 0, 200, 200),
        items: <Widget>[
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextEditingController dateController = TextEditingController();
    FocusNode locationFocusNode = FocusNode();
    FocusNode dateFocusNode = FocusNode();

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

    return SingleChildScrollView(
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
              Center(
                // padding: const EdgeInsets.all(10),
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

                      // Add more NewWidget widgets as needed
                    ],
                  ),
                ),
              )
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
            ],
          ),
        ],
      ),
    );
  }
}
