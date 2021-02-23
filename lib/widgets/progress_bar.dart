import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StepProgressIndicator(
      gradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.orange, Colors.white],
      ),
      totalSteps: 10,
      currentStep: 6,
      selectedColor: Colors.red,
      unselectedColor: Colors.yellow,
    ));
  }
}
