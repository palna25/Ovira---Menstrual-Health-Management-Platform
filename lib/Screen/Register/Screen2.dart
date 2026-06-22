//screen2
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Register/Screen3.dart';
import '../Utils/colors.dart';

class Screen2 extends StatefulWidget {
  final String username;

  const Screen2({super.key, required this.username});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int _selectedValue = 4;

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
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: const Center(
                    child: Text(
                      "Your Average Period Length?",
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
                    child: Text("Period Length    $_selectedValue day(s)"),
                    onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                              width: double.infinity,
                              height: 250,
                              child: CupertinoPicker(
                                backgroundColor: Colors.white,
                                itemExtent: 30,
                                scrollController:
                                    FixedExtentScrollController(initialItem: 4),
                                children: List<Widget>.generate(10, (index) {
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
                const Spacer(), // This will push the button to the bottom
                Container(
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
                              // Store the initial item's value (4) in Firebase Cloud Firestore
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.username)
                                  .set({
                                'periodLength': 4,
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screen3(
                                      username: widget.username,
                                      periodLength: 4),
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
                                  builder: (context) => Screen3(
                                    username: widget.username,
                                    periodLength: _selectedValue,
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
      ),
    );
  }
}
