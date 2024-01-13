import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/high_rated_card.dart';
import 'constant.dart';
import 'signup_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      // backgroundColor: Color.fromARGB(255, 0, 200, 200),
      body: SingleChildScrollView(
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
                    "Welcome Thayanan!",
                    style: appNameStyle,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 50),
                    child: Text(
                      "High Rated Harvesters",
                      style: h1style,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
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
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(255, 0, 200, 200),
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          // Handle item tap
        },
      ),
    );
  }
}
