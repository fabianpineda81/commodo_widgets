import 'dart:async';


import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryViewPage extends StatefulWidget {
  const StoryViewPage({super.key});

  @override
  _StoryViewPageState createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final PageController _pageController = PageController(

  );
  int _currentPage = 0;
  late List<double> _progressValues;
  Timer? _timer;


  final List<StoryPageInfo> storyAssets = [
    StoryPageInfo(url: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb', storyType : StoryType.image, duration:Duration(seconds: 5)),
    StoryPageInfo(url: 'https://images.unsplash.com/photo-1495567720989-cebdbdd97913', storyType : StoryType.image,  duration: Duration(seconds: 5)),
    StoryPageInfo(url: 'https://images.unsplash.com/photo-1522206024047-9c925421675b', storyType : StoryType.image, duration: Duration(seconds: 5)),
    StoryPageInfo(url: 'https://images.unsplash.com/photo-1470770903676-69b98201ea1c', storyType : StoryType.image, duration: Duration(seconds: 5)),
    StoryPageInfo(url:
    "https://media.istockphoto.com/id/1357877671/es/v%C3%ADdeo/felicitaciones-de-feliz-navidad-feliz-navidad-neon-animation.mp4?s=mp4-640x640-is&k=20&c=5dKsCWZdYTnawb57UhmCzy2VAh_VGh9QIRTmUrSaox8="
        , storyType : StoryType.video, duration: Duration(seconds: 5)),
    StoryPageInfo(url:
        "https://media.istockphoto.com/id/1447608541/es/v%C3%ADdeo/vertical-social-story-background-env%C3%ADo-gratis.mp4?s=mp4-640x640-is&k=20&c=tuHQ8DrUOMI0EfiOtf-7Xlm35qZ65KWwr6OwU3sJfDE="
        , storyType : StoryType.video, duration: Duration(seconds: 5)),
    StoryPageInfo(url:
        "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2cyMnhsZHlpaWZjdDh5aTZldHpxbnpmcWw4bWE3dTJoNzd0b3N1NSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xyovwdi6Q5grEwr9Cb/giphy.gif",
        storyType : StoryType.gif, duration: Duration(seconds: 5)),
    StoryPageInfo(url:
        "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExdHdwb2tuYmpldnE4OTIwdmF4dDN1ZDRrbnNha2Zub2pzM3VyanB2eSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/w6Q6ACsF7YiYolEBmV/giphy.gif",
        storyType : StoryType.gif, duration: Duration(seconds: 5)),


  ];
  final List<NetworkImage> images=[
    NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb'),
    NetworkImage('https://images.unsplash.com/photo-1495567720989-cebdbdd97913'),
    NetworkImage('https://images.unsplash.com/photo-1522206024047-9c925421675b'),
    NetworkImage('https://images.unsplash.com/photo-1470770903676-69b98201ea1c'),
  ];

  List<StoryContent> storyWidgets = [];





  static const Duration storyDuration = Duration(seconds: 5);
  static const Duration tick = Duration(milliseconds: 10);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Pre-cargar imágenes una sola vez

  }


  @override
  void initState() {
    super.initState();
    _progressValues = List.generate(storyAssets.length, (_) => 0.0);
    storyWidgets= List.generate(storyAssets.length, (index) {
      return StoryContent(
        imagePath: storyAssets[index].url,
        onBack: _goToBackStory,
        onNext: _onTapNextHistory,
        onPause: () => _timer?.cancel(),
        onResume: _startProgress,
        storyPageInfo: storyAssets[index],
      );

    });

    //_startProgress();

  }

  void _startProgress() {
    if(_timer?.isActive==true ){
        return;
    }
    if( _progressValues[_currentPage]==1.0 && _currentPage == storyAssets.length - 1){
      _timer?.cancel();
      return;
    }
    _timer?.cancel();
    _timer = Timer.periodic(tick, (timer) {
      setState(() {
        _progressValues[_currentPage] +=
            tick.inMilliseconds / storyAssets[_currentPage].duration.inMilliseconds;

        if (_progressValues[_currentPage] >= 1.0) {
          _progressValues[_currentPage] = 1.0;
          timer.cancel();
          _onTapNextHistory();
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

    } else {
     // _timer?.cancel();
     // Navigator.pop(context); // cerrar al final
    }
    _startProgress();
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
    }
    _startProgress();
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
              return storyWidgets[index];
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


class StoryContent extends StatefulWidget {
  final String imagePath;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final StoryPageInfo storyPageInfo;

  const StoryContent({
    super.key,
    required this.imagePath,
    required this.onBack,
    required this.onNext,
    required this.onPause,
    required this.onResume,
    required this.storyPageInfo,
  });

  @override
  State<StoryContent> createState() => _StoryContentState();
}

class _StoryContentState extends State<StoryContent>
    with AutomaticKeepAliveClientMixin {
  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 👈 importante para que AutomaticKeepAliveClientMixin funcione

    return GestureDetector(
      onLongPress: widget.onPause,
      onLongPressEnd: (_) => widget.onResume(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if(widget.storyPageInfo.storyType == StoryType.video) StoryVideoContent(
            videoUrl: widget.imagePath,
            onBack: widget.onBack,
            onNext: widget.onNext,
            onPause: widget.onPause,
            onResume: widget.onResume,
          ),
          if(widget.storyPageInfo.storyType == StoryType.image) StoryImageContent(
            imagePath: widget.imagePath,
            onBack: widget.onBack,
            onNext: widget.onNext,
            onPause: widget.onPause,
            onResume: widget.onResume,
            storyPageInfo: widget.storyPageInfo,
          ),
          if(widget.storyPageInfo.storyType == StoryType.gif) StoryGifContent(
            gifPath: widget.imagePath,
            onBack: widget.onBack,
            onNext: widget.onNext,
            onPause: widget.onPause,
            onResume: widget.onResume,)
          ,
          SizedBox.expand(
            child: Row(
              children: <Widget>[
                Expanded(child: GestureDetector(onTap: widget.onBack)),
                Expanded(child: GestureDetector(onTap: widget.onNext)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // 👈 mantiene vivo el widget
}

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

enum StoryType {
  image,
  gif,
  video,
}

class StoryPageInfo{
  final String url;
  final StoryType storyType;
  final Duration duration;

  StoryPageInfo({
    required this.url,
    required this.storyType,
    required this.duration,
  });
}


