import 'package:flutter/material.dart';

void main() {
  runApp(const HydroBuddyApp());
}

class HydroBuddyApp extends StatelessWidget {
  const HydroBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HydroBuddy",
      home: const WaterIntakePage(),
    );
  }
}

class WaterIntakePage extends StatefulWidget {
  const WaterIntakePage({super.key});

  @override
  State<WaterIntakePage> createState() => _WaterIntakePageState();
}

class _WaterIntakePageState extends State<WaterIntakePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("HydroBuddy - Water Intake"),
      ),
        body: const Center(
          child: Text(" lets calculate your daily water intake"),
        ),

    );
  }
}


