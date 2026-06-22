import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Register/Screen3.dart';
import 'package:ovira1/Screen/Register/Screen5.dart';
import 'package:ovira1/Screen/Register/Screen2.dart';
import 'package:ovira1/Screen/Register/Screen4.dart';

class IntroScreen extends StatefulWidget {
  final String username;

  const IntroScreen({super.key, required this.username});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController();
  String buttonText = "Next";
  int currentPageIndex = 1;
  int? _periodLength;
  int? _cycleLength;
  DateTime? _lastPeriodDate;
  String? _symptoms;
  String? _medication;

  // New variable to track sign-up success
  bool _isSignUpSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageIndex = index;

              if (index == 4) {
                buttonText = "Finish";
              } else {
                buttonText = "Next";
              }
              setState(() {});
            },
            children: [
              Center(child: Screen2(username: widget.username)),
              Center(child: Screen3(username: widget.username, periodLength: _periodLength ?? 0,)),
              Center(child: Screen4(username: widget.username, periodLength: _periodLength ?? 0, cycleLength: _cycleLength ?? 0)),
              Center(child: Screen5(username: widget.username, periodLength: _periodLength, cycleLength: _cycleLength, lastPeriodDate: _lastPeriodDate,onSignUpSuccess: (status) {
                setState(() {
                  _isSignUpSuccessful = status; // Update the sign-up status
                });
              },)),
            ],
          ),
        ],
      ),
    );
  }
}
