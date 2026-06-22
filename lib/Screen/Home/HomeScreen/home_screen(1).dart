/*import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Home/HomeScreen/log_period.dart';
//import '../../Utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Utils/colors.dart';

class HomeScreen extends StatefulWidget {
  final DateTime? lastPeriodDate;

  const HomeScreen({super.key, this.lastPeriodDate});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  // Sample data: you would replace this with user input
  DateTime lastPeriodStartDate = DateTime(2023, 9, 5);
  int cycleLength = 28;
  int periodLength = 5;

  // Function to calculate the next period start date
  DateTime getNextPeriodStart() {
    return lastPeriodStartDate.add(Duration(days: cycleLength));
  }

  // Function to calculate ovulation date
  DateTime getOvulationDate() {
    return lastPeriodStartDate.add(Duration(days: cycleLength ~/ 2));
  }

  // Function to get fertility window (5 days before ovulation and 1 day after)
  List<DateTime> getFertilityWindow() {
    DateTime ovulationDate = getOvulationDate();
    List<DateTime> fertilityWindow = [];
    for (int i = -5; i <= 1; i++) {
      fertilityWindow.add(ovulationDate.add(Duration(days: i)));
    }
    return fertilityWindow;
  }

  // Check if a given day is within the period
  bool isDuringPeriod(DateTime day) {
    return day.isAfter(lastPeriodStartDate.subtract(Duration(days: 1))) &&
           day.isBefore(lastPeriodStartDate.add(Duration(days: periodLength)));
  }

  // Check if a given day is the next expected period
  bool isNextPeriod(DateTime day) {
    DateTime nextPeriodStart = getNextPeriodStart();
    return day.isAfter(nextPeriodStart.subtract(Duration(days: 1))) &&
           day.isBefore(nextPeriodStart.add(Duration(days: periodLength)));
  }

  // Check if a given day is the ovulation date
  bool isOvulation(DateTime day) {
    return day == getOvulationDate();
  }

  // Check if a given day is in the fertility window
  bool isFertile(DateTime day) {
    return getFertilityWindow().contains(day);
  }

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
    padding: EdgeInsets.all(16.0),
    children: [
    SizedBox(height: size.height * 0.08),
    Text(
    "Period Tracking Calendar",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: primaryColor,
    ),
    ),
    const SizedBox(height: 65),
       TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (isDuringPeriod(day)) {
              return Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            } else if (isNextPeriod(day)) {
              return Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            } else if (isOvulation(day)) {
              return Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            } else if (isFertile(day)) {
              return Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            } else {
              return null;
            }
          },
        ),
      ),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogPeriodScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: primaryColor),
              const SizedBox(width: 10),
              Text(
                "Log Period",
                style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
    )
    ),
        ),

    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Home/HomeScreen/log_period.dart';
import 'package:ovira1/Screen/Utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  final DateTime? lastPeriodDate;

  const HomeScreen({super.key, this.lastPeriodDate});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime lastPeriodStartDate = DateTime.now();
  int cycleLength = 28;
  int periodLength = 5;

  Future<void> _getUserData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    await firestore.collection('users').doc(uid).get().then((value) {
      if (value.exists) {
        setState(() {
          lastPeriodStartDate = value.get('lastPeriodDate')?.toDate();
          cycleLength = value.get('cycleLength');
          periodLength = value.get('periodLength');
        });
      } else {
        print('No data found');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Function to calculate the next period start date
  DateTime getNextPeriodStart() {
    return lastPeriodStartDate.add(Duration(days: cycleLength));
  }

  // Function to calculate ovulation date
  DateTime getOvulationDate() {
    return lastPeriodStartDate.add(Duration(days: cycleLength - 14));
  }

  // Function to calculate fertility window
  List<DateTime> getFertilityWindow() {
    DateTime ovulationDate = getOvulationDate();
    return [
      ovulationDate.subtract(const Duration(days: 5)),
      ovulationDate.subtract(const Duration(days: 4)),
      ovulationDate.subtract(const Duration(days: 3)),
      ovulationDate.subtract(const Duration(days: 2)),
      ovulationDate,
      ovulationDate.add(const Duration(days: 1)),
    ];
  }

  // Check if a given day is within the period
  bool isDuringPeriod(DateTime day) {
    return day.isAfter(lastPeriodStartDate) &&
        day.isBefore(lastPeriodStartDate.add(Duration(days: periodLength)));
  }

  // Check if a given day is the next expected period
  bool isNextPeriod(DateTime day) {
    DateTime nextPeriodStart = getNextPeriodStart();
    return day.isAfter(nextPeriodStart.subtract(const Duration(days: 1))) &&
        day.isBefore(nextPeriodStart.add(Duration(days: periodLength)));
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
                "Period Tracking Calendar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 65),
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                  if (isDuringPeriod(day)) {
                    return Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  } else if (isNextPeriod(day)) {
                    return Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColor2,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  } else if (getOvulationDate() == day) {
                    // Display ovulation day in a different color
                    return Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.pink, // Change to your desired color
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  } else if (getFertilityWindow().contains(day)) {
                    // Display fertility window in a different color
                    return Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color:
                              Colors.lightGreen, // Change to your desired color
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return null;
                  }
                }),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogPeriodScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
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
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        "Log Period",
                        style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//write a flutter code using dart language in a file named home_screen that has class named HomeScreen in which there is a rangepicker/rangecalendar that gives ranges of period,fertility window and ovulation from the data stored in firebase cloud firestore of period length, cycle length and last period date