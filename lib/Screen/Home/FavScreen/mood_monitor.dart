import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodMonitorPage extends StatefulWidget {
  const MoodMonitorPage({super.key});

  @override
  _MoodMonitorPageState createState() => _MoodMonitorPageState();
}

class _MoodMonitorPageState extends State<MoodMonitorPage> {
  // List of moods
  final List<String> moods = [
    "Happy",
    "Sad",
    "Excited",
    "Anxious",
    "Angry",
    "Relaxed",
    "Tired",
    "Frustrated",
    "Content",
    "Surprised"
  ];

  // Track the selected moods
  List<bool> selectedMoods = List<bool>.filled(10, false);

  @override
  void initState() {
    super.initState();
    _loadSelectedMoods(); // Load the saved moods when the page is opened
  }

  // Function to load saved mood selections from shared_preferences
  Future<void> _loadSelectedMoods() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedMoods = prefs.getStringList('selectedMoods');

    if (savedMoods != null) {
      setState(() {
        for (int i = 0; i < moods.length; i++) {
          selectedMoods[i] = savedMoods.contains(moods[i]);
        }
      });
    }
  }

  // Function to handle the submit button press
  Future<void> handleSubmit() async {
    // Collect selected moods
    List<String> selectedMoodsList = [];
    for (int i = 0; i < moods.length; i++) {
      if (selectedMoods[i]) {
        selectedMoodsList.add(moods[i]);
      }
    }

    // Save selected moods to shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedMoods', selectedMoodsList);

    // Print selected moods for debugging (you can replace this with API calls or local storage)
    print("Selected Moods: $selectedMoodsList");

    // Navigate back to the profile screen after submission
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Mood'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(moods[index]),
                    value: selectedMoods[index],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedMoods[index] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: const Text('Submit Mood'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
