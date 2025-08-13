import 'dart:async';

import 'package:flutter/material.dart';

class StoryViewPage extends StatefulWidget {
  const StoryViewPage({super.key});

  @override
  _StoryViewPageState createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final PageController _pageController = PageController(

  );
 /* final List<String> storyAssets = [
    'assets/img_1.png',
    'assets/img_2.png',
    'assets/img_3.png',
    'assets/img_4.png',
    'assets/img_5.png',
  ];*/
  final List<String> storyAssets = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1495567720989-cebdbdd97913',
    'https://images.unsplash.com/photo-1522206024047-9c925421675b',
    'assets/img_4.png',
    'https://images.unsplash.com/photo-1470770903676-69b98201ea1c',
  ];

  int _currentPage = 0;
  late List<double> _progressValues;
  Timer? _timer;

  static const Duration storyDuration = Duration(seconds: 5);
  static const Duration tick = Duration(milliseconds: 10);

  @override
  void initState() {
    super.initState();
    _progressValues = List.generate(storyAssets.length, (_) => 0.0);
    //_startProgress();
  }

  void _startProgress() {
    _timer?.cancel();
    _timer = Timer.periodic(tick, (timer) {
      setState(() {
        _progressValues[_currentPage] +=
            tick.inMilliseconds / storyDuration.inMilliseconds;

        if (_progressValues[_currentPage] >= 1.0) {
          _progressValues[_currentPage] = 1.0;
          timer.cancel();
          _goToNextStory();
        }
      });
    });
  }

  void _goToNextStory() {
    if (_currentPage < storyAssets.length - 1) {
      setState(() {
        _currentPage++;
      });

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 10),
        curve: Curves.easeInOut,
      );
      //_startProgress();
    } else {
      _timer?.cancel();
     // Navigator.pop(context); // cerrar al final
    }
  }

  void _goToBackStory() {
    if (_currentPage >= 1) {
      setState(() {
        _progressValues[_currentPage] = 0;
        _currentPage--;
        _progressValues[_currentPage] = 0;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 10),
        curve: Curves.easeInOut,
      );
      //_startProgress();
    }
  }

  void _onTapNextHistory() {
    _progressValues[_currentPage] = 1.0;
    _goToNextStory();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            itemCount: storyAssets.length,
            itemBuilder: (context, index) {
              return StoryContent(
                imagePath: storyAssets[index],
                onBack: _goToBackStory,
                onNext: _onTapNextHistory,
                onPause: () => _timer?.cancel(),
                onResume: _startProgress,
              );
            },
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                StoryProgressBar(progressValues: _progressValues),
                const SizedBox(height: 10),
                StoryTopBar(onClose: () => Navigator.pop(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

class StoryContent extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onPause;
  final VoidCallback onResume;

  const StoryContent({
    super.key,
    required this.imagePath,
    required this.onBack,
    required this.onNext,
    required this.onPause,
    required this.onResume,
  });


  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onPause,
      onLongPressEnd: (_) => onResume(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _isNetworkImage(imagePath)
              ? Image.network(
            imagePath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null){
                onResume();
                return child;
              } else{
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
              return Center(
                child: Icon(Icons.broken_image, color: Colors.white),
              );
            },
          )
              : Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          SizedBox.expand(
            child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(onTap: onBack)),
                Expanded(child: GestureDetector(onTap: onNext)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkImageWithCallback extends StatefulWidget {
  final String url;
  final VoidCallback onImageLoaded;
  final VoidCallback onInit;

  const NetworkImageWithCallback({
    super.key,
    required this.url,
    required this.onImageLoaded,
    required this.onInit,
  });

  @override
  State<NetworkImageWithCallback> createState() =>
      _NetworkImageWithCallbackState();
}

class _NetworkImageWithCallbackState extends State<NetworkImageWithCallback> {
  late final ImageStream _imageStream;
  late final ImageStreamListener _listener;
  bool _imageLoading = false;


  @override
  void initState() {
    super.initState();
    widget.onInit();
    final imageProvider = NetworkImage(widget.url);
    _imageStream = imageProvider.resolve(ImageConfiguration());
    _listener = ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageLoading= true ;
      });
      widget.onImageLoaded();
    }, onError: (error, stackTrace) {
      print('Error al cargar imagen: $error');
    });

    _imageStream.addListener(_listener);

  }

  @override
  void dispose() {
    _imageStream.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_imageLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Image.network(widget.url, fit: BoxFit.cover);
  }
}


