import 'package:flutter/material.dart';

class StoryTopBar extends StatelessWidget {
  final VoidCallback onClose;

  const StoryTopBar({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Story',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: onClose,
        )
      ],
    );
  }
}
