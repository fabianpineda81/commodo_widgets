import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:commodo_widgets_example/features/commodo_histories/domain/entites/history_entity.dart';

part 'stories_state.freezed.dart';



@freezed
abstract class StoryState with _$StoryState {
  const factory StoryState({
    @Default(false) bool isLoading,
    @Default(storyAssets) List<StoryPageInfo> stories, // lista de urls
    String? errorMessage,
    StoryType? currentType,
    int? currentIndex,
    @Default(progressValues) List<double> progressValues
  }) = _StoryState;
}

const List<double> progressValues = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
const  List<StoryPageInfo> storyAssets = [
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
