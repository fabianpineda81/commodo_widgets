
import 'package:flutter/material.dart';

class StoryGifContent extends StatelessWidget {
  final String gifPath;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onPause;
  final VoidCallback onResume;

  const StoryGifContent({
    super.key,
    required this.gifPath,
    required this.onBack,
    required this.onNext,
    required this.onPause,
    required this.onResume,
  });

  bool _isNetworkGif(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _isNetworkGif(gifPath)
            ? Image.network(
          gifPath,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame == null) {
              onPause();
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else {
              onResume();
              return child;
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, color: Colors.white),
            );
          },
        )
            : Image.asset(
          gifPath,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}



