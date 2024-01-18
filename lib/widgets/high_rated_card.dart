import 'package:flutter/material.dart';
import 'package:harvest_buddy/constant.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.harvesterName, // New argument
  }) : super(key: key);

  final double height;
  final double width;
  final String harvesterName; // New argument

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                hIcon,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
              Text(harvesterName) // Use the harvesterName argument here
            ],
          ),
        ),
      ),
    );
  }
}
