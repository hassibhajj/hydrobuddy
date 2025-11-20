import 'package:flutter/material.dart';

void main() {
  runApp(const HydroBuddyApp());
}

class HydroBuddyApp extends StatelessWidget {
  const HydroBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HydroBuddy',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HydroBuddy'),
        ),
        body: const Center(
          child: Text('Welcome to HydroBuddy!'),
        ),
      ),
    );
  }
}
