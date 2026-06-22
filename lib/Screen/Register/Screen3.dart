//screen3
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import 'Screen4.dart';

class Screen3 extends StatefulWidget {
  final String username;
  final int periodLength;

  const Screen3(
      {super.key, required this.username, required this.periodLength, });
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  int _selectedValue = 28;

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
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: const Center(
                    child: Text(
                      "Your Average Cycle Length?",
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
                const SizedBox(height: 250),
                CupertinoButton.filled(
                    child: Text("Cycle Length    $_selectedValue day(s)"),
                    onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 30,
                            scrollController:
                            FixedExtentScrollController(initialItem: 27),
                            children:  List<Widget>.generate(31, (index) {
                              return Center(
                                child: Text('$index'),
                              );
                            }),
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                        ))),
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
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Store the initial item's value (28) in Firebase Cloud Firestore
                              FirebaseFirestore.instance.collection('users').doc(widget.username).set({
                                'cycleLength': 28,
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screen4(
                                    username: widget.username,
                                    periodLength: widget.periodLength,
                                    cycleLength: 28,
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
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screen4(
                                    username: widget.username,
                                    periodLength: widget.periodLength,
                                    cycleLength: _selectedValue,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}