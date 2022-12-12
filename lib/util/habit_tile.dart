import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.onTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
  });

  //convert seconds into min:sec -> 62 seconds = 1:02
  String formatToMinSec(int totalSeconds) {
    String secs = (totalSeconds % 60).toString();
    // modulus e.g. 62 % 60 = 2 tylko różnica
    String mins = (totalSeconds / 60).toStringAsFixed(5);

    //if secs is a 1 digit number, place a 0 infrot of it
    if (secs.length == 1) {
      secs = '0' + secs;
    }

    //if mins is a 1 digit number
    if (mins[1] == '.') {
      mins = mins.substring(0, 1);
    }
    return mins + ':' + secs;
  }

  //calculate the progress pecentage
  double percentCompleted() {
    return timeSpent / (timeGoal * 60);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(children: [
                      //progress circle
                      CircularPercentIndicator(
                        radius: 60,
                        percent: percentCompleted() < 1
                            ? percentCompleted()
                            : 1, //fix
                        progressColor: percentCompleted() > 0.5
                            ? (percentCompleted() > 0.75
                                ? Colors.green
                                : Colors.orange)
                            : Colors.red,
                      ),
                      //play pause button
                      Center(
                        child:
                            Icon(habitStarted ? Icons.pause : Icons.play_arrow),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //habit name
                    Text(
                      habitName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    //progress
                    Text(
                      formatToMinSec(timeSpent) +
                          '/' +
                          timeGoal.toString() +
                          ' = ' +
                          (percentCompleted() * 100).toStringAsFixed(0) +
                          '%',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: settingsTapped,
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
