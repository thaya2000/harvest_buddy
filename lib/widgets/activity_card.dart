import 'package:flutter/material.dart';
import 'package:harvest_buddy/constant.dart';

class ActivityCard extends StatelessWidget {
  final String bookingId;
  final String district;
  final String area;
  final String bookingDate;
  final String timeSlot;
  final String harvesterPhone;

  const ActivityCard({
    super.key,
    required this.bookingId,
    required this.district,
    required this.area,
    required this.bookingDate,
    required this.timeSlot,
    required this.harvesterPhone,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF3C9595),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          hIcon2,
                          height: 50,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            Text("Booking ID"),
                            Text(bookingId),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xFFDFD895),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("District"),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(district),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: 1,
                            width: 150,
                            color: Colors.black,
                          ),
                          Text("Area"),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(area),
                          ),
                        ]),
                  ),
                )
              ],
            ),
            SizedBox(height: 4),
            Container(
              height: 160,
              width: 2,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Booking Date"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                    child: Text(bookingDate),
                  ),
                  Text("Time Slot"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                    child: Text(timeSlot),
                  ),
                  Text("Harvester Phone"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                    child: Text(harvesterPhone),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
