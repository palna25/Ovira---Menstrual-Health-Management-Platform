import 'dart:ui';

import 'package:flutter/material.dart';
import '../../Utils/colors.dart';

class Notes extends StatefulWidget{
  const Notes({super.key});


  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final _formKey = GlobalKey<FormState>();
  String _noteText = '';


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
    SizedBox(height: size.height * 0.08),

      Text(
        "     Enter your notes here..",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: textColor2,
        ),
      ),
      //const SizedBox(height: 10,),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: TextFormField(
    decoration: const InputDecoration(
    border: OutlineInputBorder(),
    ),
    maxLines: 25,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Write your note here';
    }
    return null;
    },
    onSaved: (value) => _noteText = value!,
    ),
    ),
    ),
    ElevatedButton(
    onPressed: () {
    if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    // Save the note to your database or storage
    print('Note saved: $_noteText');
    }
    },
    child: const Text( 'Save Note',),
    ),
    ],
    ),
    ),

    ),
    );
  }
}