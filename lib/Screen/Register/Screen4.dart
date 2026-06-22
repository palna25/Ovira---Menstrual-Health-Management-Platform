//screen4
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ovira1/Screen/Register/Screen5.dart';
import '../Utils/colors.dart';

class Screen4 extends StatefulWidget {
  final String username;
  final int periodLength;
  final int cycleLength;

  const Screen4(
      {super.key,
      required this.username,
      required this.periodLength,
      required this.cycleLength});

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  DateTime _lastPeriodDate = DateTime.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _lastPeriodDate = value!;
      });
      _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
        'lastPeriodDate': _lastPeriodDate,
      }, SetOptions(merge: true));
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: const Center(
                  child: Text(
                    "Almost Done.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: const Center(
                  child: Text(
                    "When did your last period start?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  child: const Center(
                    child: Text(
                      "If you're irregular or not sure, tap 'Not Sure'",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                _lastPeriodDate.day.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              MaterialButton(
                onPressed: _showDatePicker,
                color: Colors.deepPurple,
                child: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Text(
                    "Choose Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(), // This will push the buttons to the bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Store a null value in Firebase Cloud Firestore
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen5(
                                  username: widget.username,
                                  periodLength: widget.periodLength,
                                  cycleLength: widget.cycleLength,
                                  lastPeriodDate: null,
                                  onSignUpSuccess: (bool) {},
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Not Sure'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen5(
                                  username: widget.username,
                                  periodLength: widget.periodLength,
                                  cycleLength: widget.cycleLength,
                                  lastPeriodDate: _lastPeriodDate,
                                  onSignUpSuccess: (bool) {},
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Continue'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
