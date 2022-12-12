import 'package:flutter/material.dart';
import 'dart:math';

import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //progress circle
            CircularPercentIndicator(
              radius: 40,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //habit name
                Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),

                //progres
                Text(
                  '2:00 / 10 = 20%',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
