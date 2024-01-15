import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:harvest_buddy/login_page.dart';
import 'package:harvest_buddy/widgets/activity_card.dart';
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
