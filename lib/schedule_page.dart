import 'package:flutter/material.dart';
import 'package:harvest_buddy/search_harvester_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SchedulePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextEditingController dateController = TextEditingController();

    String dropdownArea = [
      "select the area",
      "Mullaitivu",
      "Jaffna",
      "Kilinochi",
      "Vavuniya",
      "Mannar"
    ][0];
    String dropdownTimeSlot = [
      "select the time slot",
      "Morning slot",
      "Afternoon slot",
      "Evening slot"
    ][0];
    String dropdownMachineType = [
      "select the machine type",
      "Kubota 70G",
      "Kubota 70G+",
      "Kubota 68",
      "Class",
      "Agratech",
      "Agratech cool",
      "Lovel",
      "World",
    ][0];

    // Define text styles
    TextStyle appNameStyle = const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 60, 60),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 150),
                  child: Text(
                    "Schedule Harvester",
                    style: appNameStyle,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: height * 0.08, // Set your desired height
                      width: width * 0.9, // Set your desired width
                      child: DropdownButtonFormField<String>(
                        value: dropdownArea,
                        items: [
                          "select the area",
                          "Mullaitivu",
                          "Jaffna",
                          "Kilinochi",
                          "Vavuniya",
                          "Mannar",
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownArea = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Area",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        // Set initial value to null to have no initial selection
                        // Keep this line to maintain the initial null value
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: height * 0.08,
                      width: width * 0.9,
                      child: Material(
                        elevation: 0.0, // Set elevation to 0.0 to remove shadow
                        child: TextFormField(
                          controller: dateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );

                            if (pickedDate != null &&
                                pickedDate != DateTime.now()) {
                              String formattedDate =
                                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                              dateController.text = formattedDate;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Date",
                            suffixIcon: const Icon(Icons.calendar_today),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: height * 0.08, // Set your desired height
                      width: width * 0.9, // Set your desired width
                      child: DropdownButtonFormField<String>(
                        value: dropdownTimeSlot,
                        items: [
                          "select the time slot",
                          "Morning slot",
                          "Afternoon slot",
                          "Evening slot"
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownTimeSlot = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Time Slot",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        // Set initial value to null to have no initial selection
                        // Keep this line to maintain the initial null value
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: height * 0.08, // Set your desired height
                      width: width * 0.9, // Set your desired width
                      child: DropdownButtonFormField<String>(
                        value: dropdownMachineType,
                        items: [
                          "select the machine type",
                          "Kubota 70G",
                          "Kubota 70G+",
                          "Kubota 68",
                          "Class",
                          "Agratech",
                          "Agratech cool",
                          "Lovel",
                          "World",
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownMachineType = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Machine Type",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        // Set initial value to null to have no initial selection
                        // Keep this line to maintain the initial null value
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchHarvester()),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red, // Set the color without transparency
                        ),
                      ),
                      child: const Text(
                        "Search harvester",
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
