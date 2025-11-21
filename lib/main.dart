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
  final TextEditingController weightController = TextEditingController();
  final TextEditingController exerciseController = TextEditingController();
  double? totalWater;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("HydroBuddy - Water Intake"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "enter your details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height:20),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "weight (KG)",
                    border: OutlineInputBorder(),
                  ),
                ),

              SizedBox( height: 20),
              TextField(
                controller : exerciseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Exercise(minutes per day)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(

                onPressed: () {
                  final double weight = double.tryParse(
                      weightController.text) ?? 0;
                  final double exercise = double.tryParse(
                      exerciseController.text) ?? 0;

                  final double baseline = weight * 0.033;
                  final double extra = (exercise / 30) * 0.035;
                  final double result = baseline + extra;
                  setState(() {
                    totalWater = result;
                  });
                },
                child: const Text("Calculate"),
              ),
              SizedBox(height: 20),
              if(totalWater != null)
                Text(
                  "Recommended daily water intake: ${totalWater!.toStringAsFixed(2)} liters",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

            ],

          )
        )

    );
  }
}


