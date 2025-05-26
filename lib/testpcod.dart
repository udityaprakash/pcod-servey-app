import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pcos_survey_app/datafetch.dart';

class HealthForm extends StatefulWidget {
  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController menstrualCycleController =
      TextEditingController();
  final TextEditingController menstrualDurationController =
      TextEditingController();
  var isloading = false;

  Map<String, int> yesNoFields = {
    "Recent Weight Gain": 0,
    "Skin Darkening": 0,
    "Hair Loss": 0,
    "Acne": 0,
    "Regular Fast Food Consumption": 0,
    "Regular Exercise": 0,
    "Mood Swings": 0,
    "Regular Periods": 0,
    "Excessive Body/Facial Hair": 0,
  };

  final List<Map<String, dynamic>> bloodGroups = [
    {"label": "A+", "value": 11},
    {"label": "A-", "value": 12},
    {"label": "B+", "value": 13},
    {"label": "B-", "value": 14},
    {"label": "O+", "value": 15},
    {"label": "O-", "value": 16},
    {"label": "AB+", "value": 17},
    {"label": "AB-", "value": 18},
  ];
  String selectedBloodGroup = "11";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PCOD Prediction')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildNumberField('Age', ageController),
              buildNumberField('Weight', weightController),
              buildNumberField('Height', heightController),
              SizedBox(height: 10),
              buildBloodGroupDropdown(),
              buildNumberField(
                  'Menstrual Cycle Interval', menstrualCycleController),
              buildNumberField(
                  'Menstrual Duration (Days)', menstrualDurationController),
              ...yesNoFields.keys
                  .map((field) => buildYesNoDropdown(field))
                  .toList(),
              SizedBox(height: 20),
              isloading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('{"pcos_diagnosis": 1}'),
                        //   ),
                        // );
                        // _formKey.currentState!.validate()
                        if (_formKey.currentState!.validate()) {
                          Map<String, dynamic> formData = {
                            "Age": int.tryParse(ageController.text) ?? 0,
                            "Weight": int.tryParse(weightController.text) ?? 0,
                            "Height": int.tryParse(heightController.text) ?? 0,
                            "Blood Group":
                                int.tryParse(selectedBloodGroup) ?? 11,
                            "Menstrual Cycle Interval":
                                int.tryParse(menstrualCycleController.text) ??
                                    0,
                            "Menstrual Duration (Days)": int.tryParse(
                                    menstrualDurationController.text) ??
                                0,
                            ...yesNoFields,
                            // ...yesNoFields,
                          };

                          // Map<String, dynamic> formData2 = {
                          //   "Age": 20,
                          //   "Weight": 170,
                          //   "Height": 170,
                          //   "Blood Group": 11,
                          //   "Menstrual Cycle Interval": 2,
                          //   "Recent Weight Gain": 0,
                          //   "Excessive Body/Facial Hair": 0,
                          //   "Skin Darkening": 0,
                          //   "Hair Loss": 1,
                          //   "Acne": 0,
                          //   "Regular Fast Food Consumption": 0,
                          //   "Regular Exercise": 1,
                          //   "PCOS Diagnosis": 0,
                          //   "Mood Swings": 0,
                          //   "Regular Periods": 0,
                          //   "Menstrual Duration (Days)": 2,
                          // };

                          setState(() {
                            isloading = true;
                          });

                          log(formData.toString());
                          final response = await http.post(
                            Uri.https(
                                "pcos-deployment2.onrender.com", "/predict"),
                            body: json.encode(formData),
                            headers: {'Content-Type': 'application/json'},
                          );

                          log(await response.toString());
                          log('Status: ${response.statusCode}');
                          log('Body: ${response.body}');
                          var res = json.decode(response.body);
                          setState(() {
                            isloading = false;
                          });
                          if (res['pcos_diagnosis'] == 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Your PCOS Diagnosis is Positive'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Your PCOS Diagnosis is Negative'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) =>
            value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  Widget buildBloodGroupDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: selectedBloodGroup,
        decoration: InputDecoration(
          labelText: 'Blood Group',
          border: OutlineInputBorder(),
        ),
        items: bloodGroups.map((group) {
          return DropdownMenuItem<String>(
            value: group["value"].toString(),
            child: Text(group["label"]),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedBloodGroup = value!;
          });
        },
      ),
    );
  }

  Widget buildYesNoDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<int>(
        value: yesNoFields[label],
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: const [
          DropdownMenuItem(value: 0, child: Text("No")),
          DropdownMenuItem(value: 1, child: Text("Yes")),
        ],
        onChanged: (value) {
          setState(() {
            yesNoFields[label] = value!;
          });
        },
      ),
    );
  }
}
