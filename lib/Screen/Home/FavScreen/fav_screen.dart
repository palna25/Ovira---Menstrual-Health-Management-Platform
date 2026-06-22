import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Home/FavScreen/mood_monitor.dart';
//import 'package:ovira1/Screen/Home/FavScreen/mood_monitor.dart';
import 'package:ovira1/Screen/Home/FavScreen/notes.dart';
import 'package:ovira1/Screen/Home/FavScreen/self_care.dart';
import 'package:ovira1/Screen/Home/FavScreen/symptoms.dart';

import '../../Utils/colors.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor2,
              backgroundColor2,
              backgroundColor4,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SizedBox(height: size.height * 0.08),
              Text(
                "Activities",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 65),

              // Profile Section
              
              
              const SizedBox(height: 30,),
              ListTile(
                leading: const Icon(Icons.self_improvement_outlined, color: Colors.blueAccent),
                title: const Text('Self Care'),
                //subtitle: Text(''),
                trailing: const Icon(Icons.library_music, color: Colors.grey),
                onTap: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelfCare(), // Replace with your profile screen
                    ),
                  );
                },
              ),
              const Divider(),
              const SizedBox(height: 30,),
              ListTile(
                leading: const Icon(Icons.note, color: Colors.blueAccent),
                title: const Text('Notes'),
                subtitle: const Text('Add Notes'),
                trailing: const Icon(Icons.note_add, color: Colors.grey),
                onTap: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notes(), // Replace with your profile screen
                    ),
                  );
                },
              ),
              const Divider(),const SizedBox(height: 30,),
              ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.blueAccent),
                title: const Text('Symptoms'),
                //subtitle: Text(''),
                trailing: const Icon(Icons.add, color: Colors.grey),
                onTap: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SymptomsPage(), // Replace with your profile screen
                    ),
                  );
                },
              ),
              const Divider(),const SizedBox(height: 30,),
              ListTile(
                leading: const Icon(Icons.mood, color: Colors.blueAccent),
                title: const Text('Moods'),
                //subtitle: Text(''),
                trailing: const Icon(Icons.add, color: Colors.grey),
                onTap: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodMonitorPage(), // Replace with your profile screen
                    ),
                  );
                },
              ),
              const Divider(),
            ],),
        ),
      ),
    );
  }

}