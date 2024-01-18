import 'package:flutter/material.dart';

class TimeSlot extends StatefulWidget {
  final String timeSlot;

  const TimeSlot({
    Key? key,
    required this.timeSlot,
  }) : super(key: key);

  @override
  _TimeSlotState createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10),
      child: Container(
        width: 85,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Text(
            widget.timeSlot,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
