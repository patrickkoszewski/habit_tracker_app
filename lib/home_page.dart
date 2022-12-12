import 'package:flutter/material.dart';
import 'package:habit_tracker_app/util/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //overall habit summary
  List habitList = [
    // [habitName, habitStarted, timeSpent(sec), timeGoal(min)]
    ['Ćwiczenia', false, 0, 30],
    ['Medytacja', false, 0, 10],
    ['Kodowanie', false, 0, 120],
    ['Książka', false, 0, 60],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Konsekwencja to klucz.'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          HabitTile(
            habitName: habitList[0][0],
            onTap: () {},
            settingsTapped: () {},
            timeSpent: 4,
            timeGoal: 12,
            habitStarted: habitList[0][1],
          ),
        ],
      ),
    );
  }
}
