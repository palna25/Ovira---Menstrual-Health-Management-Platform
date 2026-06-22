import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ovira1/Screen/Home/HomeScreen/home_screen.dart';
import 'package:ovira1/Screen/Home/bottom_nav.dart';
import 'package:ovira1/Screen/Register/Screen5.dart';
import 'package:ovira1/Screen/Utils/colors.dart';
//import 'package:ovira1/Screen/Home/Utils/colors.dart';

class LogPeriodScreen extends StatefulWidget {
  const LogPeriodScreen({super.key});

  @override
  _LogPeriodScreenState createState() => _LogPeriodScreenState();
}

class _LogPeriodScreenState extends State<LogPeriodScreen> {
  DateTime _lastPeriodDate = DateTime.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    ).then((value){
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
              const SizedBox(height: 100,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: const Center(
                  child: Text(
                    "Add Your Date.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70,),
              Text(_lastPeriodDate.day.toString(),style:const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
              const SizedBox(height: 200,),
              MaterialButton(
                onPressed: _showDatePicker,
                color: Colors.deepPurple,
                child: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Text("Choose Date",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                ),
              ),
              const Spacer(), // This will push the buttons to the bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
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
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNav()
                            ));
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