import 'package:flutter/material.dart';
import 'package:harvest_buddy/account_page.dart';
import 'package:harvest_buddy/activity_page.dart';
import 'package:harvest_buddy/auth/auth.dart';
import 'package:harvest_buddy/edit_account_page.dart';
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
  runApp(const InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
      title: "HarvestBuddy",
      debugShowCheckedModeBanner: false,
    );
  }
}
