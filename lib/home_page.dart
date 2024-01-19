import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/activity_page.dart';
import 'package:harvest_buddy/schedule_page.dart';
import 'package:harvest_buddy/search_harvester_page.dart';
import 'package:harvest_buddy/utils/collection_data_retriever.dart';
import 'package:harvest_buddy/widgets/high_rated_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    const SchedulePage(),
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

class HomePageContent extends StatefulWidget {
  HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final CollectionDataRetrieverHelper _collectionDataRetrieverHelper =
      CollectionDataRetrieverHelper();

  bool isServiceProvider = false;
  final user = FirebaseAuth.instance.currentUser!;

  late Map<String, dynamic> _userData;
  late Map<String, dynamic> _farmerData;
  late String _fullName = "";

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    _userData = await _collectionDataRetrieverHelper.fetchCollectionData(
        "users", user.uid);
    isServiceProvider = _userData['isServiceProvider'];
    if (!isServiceProvider) {
      _farmerData = await _collectionDataRetrieverHelper.fetchCollectionData(
          "farmers", user.uid);
      setState(() {
        _fullName = _farmerData['firstName'];
      });
    }
  }

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
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 50),
                child: Text(
                  "Welcome $_fullName !",
                  style: appNameStyle,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Remove focus when tapping outside the input fields
                      locationFocusNode.unfocus();
                      dateFocusNode.unfocus();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: height * 0.08,
                            width: width * 0.9,
                            child: Material(
                              elevation: 0.0,
                              child: TextField(
                                controller: locationController,
                                focusNode: locationFocusNode,
                                decoration: InputDecoration(
                                  labelText: 'Enter Your Paddy Land Area',
                                  suffixIcon: const Icon(Icons.location_on),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        const BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: height * 0.08,
                            width: width * 0.9,
                            child: Material(
                              elevation: 0.0,
                              child: TextFormField(
                                controller: dateController,
                                readOnly: true,
                                focusNode: dateFocusNode,
                                onTap: () async {
                                  dateFocusNode
                                      .unfocus(); // Unfocus location field when date field is tapped
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)),
                                  );

                                  if (pickedDate != null &&
                                      pickedDate != DateTime.now()) {
                                    String formattedDate =
                                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                                    dateController.text = formattedDate;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: "Date",
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        const BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchHarvester()),
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red, // Set the color without transparency
                            ),
                          ),
                          child: const Text(
                            "Search harvester",
                            style: TextStyle(
                              color:
                                  Colors.white, // Set the text color to white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    "High Rated Harvesters",
                    style: h1style,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Vithu Harvesters"),
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Vyshuu Harvesters"),
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Thaya Harvesters"),
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Rishi Harvesters"),

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
                    "Best Price Harvesters",
                    style: h1style,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Vithu Harvesters"),
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Vyshuu Harvesters"),
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Thaya Harvesters"),
                        NewWidget(
                            height: height * 0.1,
                            width: width * 0.3,
                            harvesterName: "Rishi Harvesters"),

                        // Add more NewWidget widgets as needed
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
