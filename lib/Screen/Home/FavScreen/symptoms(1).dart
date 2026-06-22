import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({super.key});

  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  // Define a Map to track selected symptoms
  Map<String, bool> symptoms = {
    'Cramps': false,
    'Headaches': false,
    'Bloating': false,
    'Fatigue': false,
    'Mood Swings': false,
    'Nausea': false,
    'Breast Tenderness': false,
    'Acne': false,
    'Back Pain': false,
    'Food Cravings': false,
    'Dizziness': false,
    'Heavy Bleeding': false,
    'Digestive Issues': false,
  };

  // Other symptom input controller
  TextEditingController otherController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSelectedSymptoms(); // Load saved symptoms when the page is opened
  }

  // Load saved symptoms from shared_preferences
  Future<void> _loadSelectedSymptoms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedSymptoms = prefs.getStringList('selectedSymptoms');
    if (savedSymptoms != null) {
      setState(() {
        symptoms.updateAll((key, value) => savedSymptoms.contains(key));
      });
    }
    // Load 'Other' symptoms
    otherController.text = prefs.getString('otherSymptom') ?? '';
  }

  // Function to handle the submit button press
  Future<void> handleSubmit() async {
    // Collect selected symptoms
    List<String> selectedSymptoms = symptoms.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Save selected symptoms to shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedSymptoms', selectedSymptoms);

    // Save 'Other' symptom if present
    if (otherController.text.isNotEmpty) {
      await prefs.setString('otherSymptom', otherController.text);
    } else {
      await prefs.remove('otherSymptom'); // Remove if field is empty
    }

    // Navigate back to the profile screen after submission
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Symptoms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: symptoms.keys.map((String symptom) {
                  return CheckboxListTile(
                    title: Text(symptom),
                    value: symptoms[symptom],
                    onChanged: (bool? value) {
                      setState(() {
                        symptoms[symptom] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            TextField(
              controller: otherController,
              decoration: const InputDecoration(
                labelText: 'Other symptoms',
                hintText: 'Enter other symptoms here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: const Text('Submit Symptoms'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the text controller when the widget is disposed
    otherController.dispose();
    super.dispose();
  }
}
