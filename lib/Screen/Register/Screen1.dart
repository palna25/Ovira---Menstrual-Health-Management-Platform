// screen1.dart
import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Register/intro_screen.dart';
import '../Utils/colors.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.contacts_sharp),
                  labelText: 'Enter your name',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(username: _username),
                    ),
                  );
                }
              },
              child: Container(
                height: size.height * 0.03,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.zero,
                ),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}