import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.value,
    required this.unit,
    required this.progressColor,
    required this.changeProgressColor,
  }) : super(key: key);
  final double value;
  final String unit;
  final Color progressColor;
  final Color changeProgressColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      shadowColor: Colors.white,
      elevation: 24,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            const Text(
              "Power Consumption",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // FAProgressBar(
            //   currentValue: value,
            //   displayText: unit,
            //   maxValue: 500,
            //   borderRadius: BorderRadius.circular(18),
            //   backgroundColor: Colors.black45,
            //   progressColor: progressColor,
            //   changeColorValue: 300,
            //   changeProgressColor: changeProgressColor,
            //   animatedDuration: const Duration(milliseconds: 50),
            // ),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
