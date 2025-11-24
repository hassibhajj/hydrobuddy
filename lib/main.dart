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
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("HydroBuddy -your Water Intake calculator",
        style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,
        color: Colors.white)),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "enter your details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.blue),
              ),
              SizedBox(height:20),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "weight (KG)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),

              SizedBox( height: 20),
              TextField(
                controller : exerciseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Exercise(minutes per day)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

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
              SizedBox(height:10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical :14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12,
                    ),
                  ),
                ),
                  onPressed: () {
                    setState(() {
                      weightController.clear();
                      exerciseController.clear();
                      totalWater = null;


                      });
                  },
                  child: const Text("reset"),

              ),
              SizedBox(height: 20),
              if(totalWater != null)
                Text(
                  "Recommended daily water intake: ${totalWater!.toStringAsFixed(2)} liters",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if(totalWater !=null)
                  Padding(
                    padding: const EdgeInsets.only(top:12),
                    child: Text(
                      "tip : Drink water consistently throughout the day to stay hydrated!",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  ),
            ],

          )
        )

    );
  }
}


