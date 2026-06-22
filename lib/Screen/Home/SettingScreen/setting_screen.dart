import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Home/SettingScreen/FAQ.dart';
import '../../Utils/colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notificationsEnabled = true;
  String cycleLength = '';
  String periodLength = ''; // Added period length

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          cycleLength = '${data['cycleLength']} Days';
          periodLength = '${data['periodLength']} Days';
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
  Future<void> _updateCycleLength(int value) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'cycleLength': value,
      });
    } catch (e) {
      print('Error updating cycle length: $e');
    }
  }

  Future<void> _updatePeriodLength(int value) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'periodLength': value,
      });
    } catch (e) {
      print('Error updating period length: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 65),

              // Profile Section
              ListTile(
                leading: const Icon(Icons.person, color: Colors.blueAccent),
                title: const Text('Profile'),
                subtitle: const Text('View your profile'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(username: FirebaseAuth.instance.currentUser!.uid), // Replace with your profile screen
                    ),
                  );
                },
              ),
              const Divider(),
              // Cycle Length Setting (1-31 days)
              ListTile(
                title: const Text('Cycle Length'),
                subtitle: const Text('Adjust your average cycle length'),
                trailing: CupertinoButton(
                  child: Text(cycleLength),
                  onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (_) => SizedBox(
                      height: 250,
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(initialItem: 13),
                        children: List.generate(31, (index) {
                          final day = (index + 1).toString();
                          return Center(
                            child: Text('$day Days'),
                          );
                        }),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            cycleLength = '${value + 1} Days';
                          });
                          _updateCycleLength(value + 1);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),

// Period Length Setting (1-15 days)
              ListTile(
                title: const Text('Period Length'),
                subtitle: const Text('Adjust your average period length'),
                trailing: CupertinoButton(
                  child: Text(periodLength),
                  onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (_) => SizedBox(
                      height: 250,
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(initialItem: 3),
                        children: List.generate(15, (index) {
                          final day = (index + 1).toString();
                          return Center(
                            child: Text('$day Days'),
                          );
                        }),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            periodLength = '${value + 1} Days';
                          });
                          _updatePeriodLength(value + 1);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              // About Section
              const AboutListTile(
                applicationIcon: Icon(Icons.woman_2_rounded),
                applicationName: 'Ovira',
                aboutBoxChildren: [
                  Text(
                    'Welcome To Ovira',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    'Empowering women to take control of their reproductive health, one cycle at a time.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black45),
                  ),
                  Text(
                    'Our Mission',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    'At Ovira, we are dedicated to providing a simple, yet powerful tool that helps you understand your body and make informed decisions about your well-being. Our app offers:',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black45),
                  ),
                  Text(
                    '\n - Effortless period tracking. \n - Accurate future cycle forecasting. \n - Personalized symptom diary. \n - Intuitive design for easy use. \n - Secure data storage.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black45),
                  )
                ],
              ),
              const Divider(),

              // FAQs Section Styled Like AboutListTile
              ListTile(
                leading: const Icon(Icons.help_outline, color: Colors.pinkAccent),
                title: const Text('FAQs'),
                subtitle: const Text('Frequently Asked Questions'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Faq()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ProfileScreen extends StatefulWidget {
  final String username;

  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final DocumentSnapshot? _documentSnapshot;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(widget.username).get();
      setState(() {
        _documentSnapshot = documentSnapshot;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_documentSnapshot == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_documentSnapshot.exists) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: const Center(
          child: Text('No data available'),
        ),
      );
    }

    final Map<String, dynamic> data = _documentSnapshot.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              // Profile Picture
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/proflie.jpeg'), // Placeholder image
                ),
              ),
              const SizedBox(height: 20),

              // Editable Name
              _buildEditableField('Name', TextEditingController(text: data['username'] ?? '')),
              const SizedBox(height: 20),

              // Editable Age

              // Editable Email
              _buildEditableField('Email', TextEditingController(text: data['backupEmail'] ?? '')),
              const SizedBox(height: 20),

              // Editable Phone Number


              ],
          ),
        ),
      ),
    );
  }

  // Helper function to build editable fields with validation
  Widget _buildEditableField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}