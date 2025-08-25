// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoryState {

 bool get isLoading; List<StoryPageInfo> get stories;// lista de urls
 String? get errorMessage; StoryType? get currentType; int? get currentIndex; List<double> get progressValues;
/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryStateCopyWith<StoryState> get copyWith => _$StoryStateCopyWithImpl<StoryState>(this as StoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.stories, stories)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentType, currentType) || other.currentType == currentType)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other.progressValues, progressValues));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(stories),errorMessage,currentType,currentIndex,const DeepCollectionEquality().hash(progressValues));

@override
String toString() {
  return 'StoryState(isLoading: $isLoading, stories: $stories, errorMessage: $errorMessage, currentType: $currentType, currentIndex: $currentIndex, progressValues: $progressValues)';
}


}

/// @nodoc
abstract mixin class $StoryStateCopyWith<$Res>  {
  factory $StoryStateCopyWith(StoryState value, $Res Function(StoryState) _then) = _$StoryStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<StoryPageInfo> stories, String? errorMessage, StoryType? currentType, int? currentIndex, List<double> progressValues
});




}
/// @nodoc
class _$StoryStateCopyWithImpl<$Res>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._self, this._then);

  final StoryState _self;
  final $Res Function(StoryState) _then;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? stories = null,Object? errorMessage = freezed,Object? currentType = freezed,Object? currentIndex = freezed,Object? progressValues = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,stories: null == stories ? _self.stories : stories // ignore: cast_nullable_to_non_nullable
as List<StoryPageInfo>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentType: freezed == currentType ? _self.currentType : currentType // ignore: cast_nullable_to_non_nullable
as StoryType?,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,progressValues: null == progressValues ? _self.progressValues : progressValues // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryState].
extension StoryStatePatterns on StoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryState value)  $default,){
final _that = this;
switch (_that) {
case _StoryState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryState value)?  $default,){
final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<StoryPageInfo> stories,  String? errorMessage,  StoryType? currentType,  int? currentIndex,  List<double> progressValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that.isLoading,_that.stories,_that.errorMessage,_that.currentType,_that.currentIndex,_that.progressValues);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<StoryPageInfo> stories,  String? errorMessage,  StoryType? currentType,  int? currentIndex,  List<double> progressValues)  $default,) {final _that = this;
switch (_that) {
case _StoryState():
return $default(_that.isLoading,_that.stories,_that.errorMessage,_that.currentType,_that.currentIndex,_that.progressValues);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<StoryPageInfo> stories,  String? errorMessage,  StoryType? currentType,  int? currentIndex,  List<double> progressValues)?  $default,) {final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that.isLoading,_that.stories,_that.errorMessage,_that.currentType,_that.currentIndex,_that.progressValues);case _:
  return null;

}
}

}

/// @nodoc


class _StoryState implements StoryState {
  const _StoryState({this.isLoading = false, final  List<StoryPageInfo> stories = storyAssets, this.errorMessage, this.currentType, this.currentIndex, final  List<double> progressValues = progressValues}): _stories = stories,_progressValues = progressValues;
  

@override@JsonKey() final  bool isLoading;
 final  List<StoryPageInfo> _stories;
@override@JsonKey() List<StoryPageInfo> get stories {
  if (_stories is EqualUnmodifiableListView) return _stories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stories);
}

// lista de urls
@override final  String? errorMessage;
@override final  StoryType? currentType;
@override final  int? currentIndex;
 final  List<double> _progressValues;
@override@JsonKey() List<double> get progressValues {
  if (_progressValues is EqualUnmodifiableListView) return _progressValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_progressValues);
}


/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryStateCopyWith<_StoryState> get copyWith => __$StoryStateCopyWithImpl<_StoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._stories, _stories)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentType, currentType) || other.currentType == currentType)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other._progressValues, _progressValues));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_stories),errorMessage,currentType,currentIndex,const DeepCollectionEquality().hash(_progressValues));

@override
String toString() {
  return 'StoryState(isLoading: $isLoading, stories: $stories, errorMessage: $errorMessage, currentType: $currentType, currentIndex: $currentIndex, progressValues: $progressValues)';
}


}

/// @nodoc
abstract mixin class _$StoryStateCopyWith<$Res> implements $StoryStateCopyWith<$Res> {
  factory _$StoryStateCopyWith(_StoryState value, $Res Function(_StoryState) _then) = __$StoryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<StoryPageInfo> stories, String? errorMessage, StoryType? currentType, int? currentIndex, List<double> progressValues
});




}
/// @nodoc
class __$StoryStateCopyWithImpl<$Res>
    implements _$StoryStateCopyWith<$Res> {
  __$StoryStateCopyWithImpl(this._self, this._then);

  final _StoryState _self;
  final $Res Function(_StoryState) _then;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? stories = null,Object? errorMessage = freezed,Object? currentType = freezed,Object? currentIndex = freezed,Object? progressValues = null,}) {
  return _then(_StoryState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,stories: null == stories ? _self._stories : stories // ignore: cast_nullable_to_non_nullable
as List<StoryPageInfo>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentType: freezed == currentType ? _self.currentType : currentType // ignore: cast_nullable_to_non_nullable
as StoryType?,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,progressValues: null == progressValues ? _self._progressValues : progressValues // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
