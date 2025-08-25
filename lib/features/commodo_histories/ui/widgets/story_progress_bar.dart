
import 'package:flutter/material.dart';

class StoryProgressBar extends StatelessWidget {
  final List<double> progressValues;

  const StoryProgressBar({super.key, required this.progressValues});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(progressValues.length, (i) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: LinearProgressIndicator(
              value: progressValues[i],
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Colors.black,
              minHeight: 3,
            ),
          ),
        );
      }),
    );
  }
}