import 'package:flutter/material.dart';

class ActivityCardServiceProvider extends StatelessWidget {
  final String date;
  final String timeSlot;
  final String customerName;
  final String paddyLandAddress;
  final String customerPhoneNumber;

  const ActivityCardServiceProvider({
    super.key,
    required this.date,
    required this.timeSlot,
    required this.customerName,
    required this.paddyLandAddress,
    required this.customerPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextStyle h1style = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );
    TextStyle h2style = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
      child: Container(
        width: width * 0.8,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                date,
                style: h1style,
              ),
            ),
            Center(
              child: Text(
                timeSlot,
                style: h2style,
              ),
            ),
            Text(
              "Customer Name",
              style: h2style,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 5, bottom: 5),
              child: Text(
                customerName,
                style: h2style,
              ),
            ),
            Text(
              "Paddy land address",
              style: h2style,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 5, bottom: 5),
              child: Text(
                paddyLandAddress,
                style: h2style,
              ),
            ),
            Text(
              "Customer Phone Number",
              style: h2style,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 5, bottom: 5),
              child: Text(
                customerPhoneNumber,
                style: h2style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  width: width * 0.4,
                  height: width * 0.1,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
