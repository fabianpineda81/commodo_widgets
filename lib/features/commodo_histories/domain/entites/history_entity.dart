
class HistoryEntity{
  List<StoryPageInfo> histories ;
  HistoryEntity({required this.histories});

}

class StoryPageInfo {
  final String url;
  final StoryType storyType;
  final Duration duration;
  const StoryPageInfo({
    required this.url,
    required this.storyType,
    required this.duration,
  });
}

enum StoryType {
  image,
  gif,
  video,
}
