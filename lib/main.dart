import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:harvest_buddy/auth/auth.dart';
=======
import 'package:harvest_buddy/home_service_provider.dart';
>>>>>>> vithu_1
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
<<<<<<< HEAD
  const InitialScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
=======
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeServiceProvider(),
>>>>>>> vithu_1
      title: "HarvestBuddy",
      debugShowCheckedModeBanner: false,
    );
  }
}
