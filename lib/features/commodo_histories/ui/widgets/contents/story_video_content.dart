
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryVideoContent extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onPause;
  final VoidCallback onResume;

  const StoryVideoContent({
    super.key,
    required this.videoUrl,
    required this.onBack,
    required this.onNext,
    required this.onPause,
    required this.onResume,
  });

  @override
  State<StoryVideoContent> createState() => _StoryVideoContentState();
}

class _StoryVideoContentState extends State<StoryVideoContent> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse( widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
          _controller.play();
          widget.onResume();
        });
      })
      ..addListener(() {
        if (_controller.value.hasError) {
          widget.onPause();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _isInitialized
            ? FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        )
            : const Center(child: CircularProgressIndicator(color: Colors.white)),
      ],
    );
  }
}