import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'schedule_page.dart';
import 'home_page.dart';
import 'constant.dart';
import 'landing_page.dart';
import 'login_page.dart';
import 'signup_page.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
      title: "HarvestBuddy",
      debugShowCheckedModeBanner: false,
    );
  }
}
