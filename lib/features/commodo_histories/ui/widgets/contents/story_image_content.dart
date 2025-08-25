

import 'package:commodo_widgets_example/features/commodo_histories/domain/entites/history_entity.dart';
import 'package:flutter/material.dart';

class StoryImageContent extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final StoryPageInfo storyPageInfo;
  const StoryImageContent({
    super.key,
    required this.imagePath,
    required this.onBack,
    required this.onNext,
    required this.onPause,
    required this.onResume,
    required this.storyPageInfo,
  });
  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit: StackFit.expand,
      children: [
        _isNetworkImage(imagePath)
            ? Image.network(
          imagePath,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              onResume();
              return child;
            } else {
              onPause();
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
                color: Colors.white,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, color: Colors.white),
            );
          },
        )
            : Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
