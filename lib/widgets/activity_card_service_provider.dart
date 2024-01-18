import 'package:flutter/material.dart';

class ActivityCardServiceProvider extends StatelessWidget {
  final TextEditingController dayController;
  final TextEditingController timeSlotController;
  final TextEditingController customerNameController;
  final TextEditingController paddyLandAddressController;
  final TextEditingController customerPhoneNumberController;

  const ActivityCardServiceProvider({
    Key? key,
    required this.dayController,
    required this.timeSlotController,
    required this.customerNameController,
    required this.paddyLandAddressController,
    required this.customerPhoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextStyle h1style = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );
    TextStyle h2style = const TextStyle(
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
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                dayController.text,
                style: h1style,
              ),
            ),
            Center(
              child: Text(
                timeSlotController.text,
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
                customerNameController.text,
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
                paddyLandAddressController.text,
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
                customerPhoneNumberController.text,
                style: h2style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.4,
                  height: width * 0.1,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
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
