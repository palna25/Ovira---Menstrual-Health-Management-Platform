import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
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
            children: [
              const SizedBox(height: 20),
              Text(
                "FAQ!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  color: textColor1,
                ),
              ),
              const SizedBox(height: 20),
              const ListTile(
                title: Text(
                  'What is the Period Tracker App?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'This app helps you monitor your menstrual cycle, track symptoms, and predict your upcoming periods and fertile windows. It provides insights into your reproductive health and can help you identify patterns over time.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const Divider(),

              const ListTile(
                title: Text(
                  'How do I set up the app?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Download the app from your app store, create an account, and input your last menstrual period (LMP) date. You can also customize the app based on your cycle length and symptoms.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const Divider(),

              const ListTile(
                title: Text(
                  'How secure is my data?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Your data is encrypted and stored securely. We prioritize your privacy and ensure that your information is kept confidential.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const Divider(),

              const ListTile(
                title: Text(
                  'Is the app free?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'The app is available for free with basic features. Some advanced features or ad-free experiences may require a subscription or in-app purchase.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const Divider(),

              const ListTile(
                title: Text(
                  'What if my cycle is irregular?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'The app can accommodate irregular cycles. Input your period details as accurately as possible, and the app will adjust its predictions based on your data.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              const Divider(),

              const ListTile(
                title: Text(
                  'How often should I update my data?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'For the most accurate predictions, update your period and symptoms regularly. Frequent updates will help the app provide better insights into your cycle.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45,
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