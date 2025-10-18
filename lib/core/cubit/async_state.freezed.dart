// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncState<T> implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsyncState<$T>'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsyncState<$T>()';
}


}

/// @nodoc
class $AsyncStateCopyWith<T,$Res>  {
$AsyncStateCopyWith(AsyncState<T> _, $Res Function(AsyncState<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncState].
extension AsyncStatePatterns<T> on AsyncState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsyncInitial<T> value)?  initial,TResult Function( AsyncLoading<T> value)?  loading,TResult Function( AsyncSuccess<T> value)?  success,TResult Function( AsyncFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial(_that);case AsyncLoading() when loading != null:
return loading(_that);case AsyncSuccess() when success != null:
return success(_that);case AsyncFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsyncInitial<T> value)  initial,required TResult Function( AsyncLoading<T> value)  loading,required TResult Function( AsyncSuccess<T> value)  success,required TResult Function( AsyncFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case AsyncInitial():
return initial(_that);case AsyncLoading():
return loading(_that);case AsyncSuccess():
return success(_that);case AsyncFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsyncInitial<T> value)?  initial,TResult? Function( AsyncLoading<T> value)?  loading,TResult? Function( AsyncSuccess<T> value)?  success,TResult? Function( AsyncFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial(_that);case AsyncLoading() when loading != null:
return loading(_that);case AsyncSuccess() when success != null:
return success(_that);case AsyncFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( dynamic failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial();case AsyncLoading() when loading != null:
return loading();case AsyncSuccess() when success != null:
return success(_that.data);case AsyncFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( dynamic failure)  failure,}) {final _that = this;
switch (_that) {
case AsyncInitial():
return initial();case AsyncLoading():
return loading();case AsyncSuccess():
return success(_that.data);case AsyncFailure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( dynamic failure)?  failure,}) {final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial();case AsyncLoading() when loading != null:
return loading();case AsyncSuccess() when success != null:
return success(_that.data);case AsyncFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class AsyncInitial<T> with DiagnosticableTreeMixin implements AsyncState<T> {
  const AsyncInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsyncState<$T>.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsyncState<$T>.initial()';
}


}




/// @nodoc


class AsyncLoading<T> with DiagnosticableTreeMixin implements AsyncState<T> {
  const AsyncLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsyncState<$T>.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsyncState<$T>.loading()';
}


}




/// @nodoc


class AsyncSuccess<T> with DiagnosticableTreeMixin implements AsyncState<T> {
  const AsyncSuccess(this.data);
  

 final  T data;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncSuccessCopyWith<T, AsyncSuccess<T>> get copyWith => _$AsyncSuccessCopyWithImpl<T, AsyncSuccess<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsyncState<$T>.success'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsyncState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $AsyncSuccessCopyWith<T,$Res> implements $AsyncStateCopyWith<T, $Res> {
  factory $AsyncSuccessCopyWith(AsyncSuccess<T> value, $Res Function(AsyncSuccess<T>) _then) = _$AsyncSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$AsyncSuccessCopyWithImpl<T,$Res>
    implements $AsyncSuccessCopyWith<T, $Res> {
  _$AsyncSuccessCopyWithImpl(this._self, this._then);

  final AsyncSuccess<T> _self;
  final $Res Function(AsyncSuccess<T>) _then;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(AsyncSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AsyncFailure<T> with DiagnosticableTreeMixin implements AsyncState<T> {
  const AsyncFailure({this.failure = null});
  

@JsonKey() final  dynamic failure;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncFailureCopyWith<T, AsyncFailure<T>> get copyWith => _$AsyncFailureCopyWithImpl<T, AsyncFailure<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsyncState<$T>.failure'))
    ..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncFailure<T>&&const DeepCollectionEquality().equals(other.failure, failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failure));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsyncState<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AsyncFailureCopyWith<T,$Res> implements $AsyncStateCopyWith<T, $Res> {
  factory $AsyncFailureCopyWith(AsyncFailure<T> value, $Res Function(AsyncFailure<T>) _then) = _$AsyncFailureCopyWithImpl;
@useResult
$Res call({
 dynamic failure
});




}
/// @nodoc
class _$AsyncFailureCopyWithImpl<T,$Res>
    implements $AsyncFailureCopyWith<T, $Res> {
  _$AsyncFailureCopyWithImpl(this._self, this._then);

  final AsyncFailure<T> _self;
  final $Res Function(AsyncFailure<T>) _then;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = freezed,}) {
  return _then(AsyncFailure<T>(
failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
