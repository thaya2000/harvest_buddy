import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/activity_page.dart';
import 'package:harvest_buddy/edit_account_page.dart';
import 'package:harvest_buddy/home_service_provider.dart';
import 'schedule_page.dart';
import 'home_page.dart';
import 'constant.dart';
import 'landing_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeServiceProvider(),
      title: "HarvestBuddy",
      debugShowCheckedModeBanner: false,
    );
  }
}
