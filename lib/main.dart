import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:ovira1/Screen/Utils/colors.dart';
import 'package:ovira1/Screen/Welcome/spash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions( apiKey: "AIzaSyAcxZ1gC2jqgDADaPKGyocyi3cTX33Qbr0",
  authDomain: "ovira1-c8637.firebaseapp.com",
  projectId: "ovira1-c8637",
  storageBucket: "ovira1-c8637.appspot.com",
  messagingSenderId: "862129842215",
  appId: "1:862129842215:web:b248777456b484e78ec602"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: MySplashScreen(),

   );
  }
}
