import 'package:flutter/material.dart';
import 'package:flutter_workshop/widgets/about.dart';
import 'package:flutter_workshop/widgets/calendar.dart';

drawer(context) => Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap:(){
            Navigator.push(context , MaterialPageRoute(builder: (context) => const About()));
          }
      ),
      ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text('Shifts'),
          onTap:(){
            Navigator.push(context , MaterialPageRoute(builder: (context) => const Calendar()));
          }
      ),
    ],
  ),
);