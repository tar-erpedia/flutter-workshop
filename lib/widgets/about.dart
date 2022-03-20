
import 'package:flutter/material.dart';
import 'package:flutter_workshop/widgets/appbar.dart';
import 'package:flutter_workshop/widgets/drawer.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Scaffold(
  appBar: appbar,
  drawer: drawer(context),
  body: const Text("אודות"));
}