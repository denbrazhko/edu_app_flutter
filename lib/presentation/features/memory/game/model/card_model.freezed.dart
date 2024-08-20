// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemoryCard {
  int get position => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  MemoryCardState get state => throw _privateConstructorUsedError;

  /// Create a copy of MemoryCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoryCardCopyWith<MemoryCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryCardCopyWith<$Res> {
  factory $MemoryCardCopyWith(
          MemoryCard value, $Res Function(MemoryCard) then) =
      _$MemoryCardCopyWithImpl<$Res, MemoryCard>;
  @useResult
  $Res call({int position, String image, MemoryCardState state});
}

/// @nodoc
class _$MemoryCardCopyWithImpl<$Res, $Val extends MemoryCard>
    implements $MemoryCardCopyWith<$Res> {
  _$MemoryCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoryCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? image = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as MemoryCardState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoryCardImplCopyWith<$Res>
    implements $MemoryCardCopyWith<$Res> {
  factory _$$MemoryCardImplCopyWith(
          _$MemoryCardImpl value, $Res Function(_$MemoryCardImpl) then) =
      __$$MemoryCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position, String image, MemoryCardState state});
}

/// @nodoc
class __$$MemoryCardImplCopyWithImpl<$Res>
    extends _$MemoryCardCopyWithImpl<$Res, _$MemoryCardImpl>
    implements _$$MemoryCardImplCopyWith<$Res> {
  __$$MemoryCardImplCopyWithImpl(
      _$MemoryCardImpl _value, $Res Function(_$MemoryCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemoryCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? image = null,
    Object? state = null,
  }) {
    return _then(_$MemoryCardImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as MemoryCardState,
    ));
  }
}

/// @nodoc

class _$MemoryCardImpl with DiagnosticableTreeMixin implements _MemoryCard {
  _$MemoryCardImpl(
      {required this.position, required this.image, required this.state});

  @override
  final int position;
  @override
  final String image;
  @override
  final MemoryCardState state;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemoryCard(position: $position, image: $image, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemoryCard'))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoryCardImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, image, state);

  /// Create a copy of MemoryCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoryCardImplCopyWith<_$MemoryCardImpl> get copyWith =>
      __$$MemoryCardImplCopyWithImpl<_$MemoryCardImpl>(this, _$identity);
}

abstract class _MemoryCard implements MemoryCard {
  factory _MemoryCard(
      {required final int position,
      required final String image,
      required final MemoryCardState state}) = _$MemoryCardImpl;

  @override
  int get position;
  @override
  String get image;
  @override
  MemoryCardState get state;

  /// Create a copy of MemoryCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoryCardImplCopyWith<_$MemoryCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
