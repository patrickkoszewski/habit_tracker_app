import 'dart:async';

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
    ['Ćwiczenia', false, 0, 1],
    ['Medytacja', false, 0, 2],
    ['Kodowanie', false, 0, 3],
    ['Czytanie', false, 0, 60],
  ];

  void habitStarted(int index) {
    //note what the start time is
    var startTime = DateTime.now();

    //include the time already elapsed
    int elapsedTime = habitList[index][2];

    //habit started or stoped
    setState(() {
      habitList[index][1] =
          !habitList[index][1]; //habitList = opposite of habitList
    });

    if (habitList[index][1]) {
      //check if habitList[index][1] == true
      //keep the time going
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          //check when the user has stopped the timer
          if (!habitList[index][1]) {
            timer.cancel();
          }
          //calculate the time elapsed by comparing current time and start time
          var currentTime = DateTime.now();
          habitList[index][2] = elapsedTime +
              currentTime.second -
              startTime.second +
              60 * (currentTime.minute - startTime.minute) +
              60 * 60 * (currentTime.hour - startTime.hour);
        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ustawienia dla ' + habitList[index][0]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text('Konsekwencja to klucz.'),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: habitList.length,
            itemBuilder: (((context, index) {
              return HabitTile(
                habitName: habitList[index][0],
                onTap: () {
                  habitStarted(index);
                },
                settingsTapped: () {
                  settingsOpened(index);
                },
                habitStarted: habitList[index][1],
                timeSpent: habitList[index][2],
                timeGoal: habitList[index][3],
              );
            }))));
  }
}
