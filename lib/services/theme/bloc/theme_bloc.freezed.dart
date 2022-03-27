// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _State call(
      {required FootballThemeData lightThemeData,
      required FootballThemeData darkThemeData,
      required List<FootballThemeData> customThemesData,
      required Config config}) {
    return _State(
      lightThemeData: lightThemeData,
      darkThemeData: darkThemeData,
      customThemesData: customThemesData,
      config: config,
    );
  }
}

/// @nodoc
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  /// The selected light theme which will be used when the device is using the
  /// system light theme.
  FootballThemeData get lightThemeData => throw _privateConstructorUsedError;

  /// The selected dark theme which will be used when the device is using the
  /// system dark theme.
  FootballThemeData get darkThemeData => throw _privateConstructorUsedError;

  /// The list of custom themes for the currently authenticated user.
  List<FootballThemeData> get customThemesData =>
      throw _privateConstructorUsedError;
  Config get config => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call(
      {FootballThemeData lightThemeData,
      FootballThemeData darkThemeData,
      List<FootballThemeData> customThemesData,
      Config config});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object? lightThemeData = freezed,
    Object? darkThemeData = freezed,
    Object? customThemesData = freezed,
    Object? config = freezed,
  }) {
    return _then(_value.copyWith(
      lightThemeData: lightThemeData == freezed
          ? _value.lightThemeData
          : lightThemeData // ignore: cast_nullable_to_non_nullable
              as FootballThemeData,
      darkThemeData: darkThemeData == freezed
          ? _value.darkThemeData
          : darkThemeData // ignore: cast_nullable_to_non_nullable
              as FootballThemeData,
      customThemesData: customThemesData == freezed
          ? _value.customThemesData
          : customThemesData // ignore: cast_nullable_to_non_nullable
              as List<FootballThemeData>,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FootballThemeData lightThemeData,
      FootballThemeData darkThemeData,
      List<FootballThemeData> customThemesData,
      Config config});
}

/// @nodoc
class __$StateCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? lightThemeData = freezed,
    Object? darkThemeData = freezed,
    Object? customThemesData = freezed,
    Object? config = freezed,
  }) {
    return _then(_State(
      lightThemeData: lightThemeData == freezed
          ? _value.lightThemeData
          : lightThemeData // ignore: cast_nullable_to_non_nullable
              as FootballThemeData,
      darkThemeData: darkThemeData == freezed
          ? _value.darkThemeData
          : darkThemeData // ignore: cast_nullable_to_non_nullable
              as FootballThemeData,
      customThemesData: customThemesData == freezed
          ? _value.customThemesData
          : customThemesData // ignore: cast_nullable_to_non_nullable
              as List<FootballThemeData>,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config,
    ));
  }
}

/// @nodoc

class _$_State extends _State {
  _$_State(
      {required this.lightThemeData,
      required this.darkThemeData,
      required this.customThemesData,
      required this.config})
      : super._();

  @override

  /// The selected light theme which will be used when the device is using the
  /// system light theme.
  final FootballThemeData lightThemeData;
  @override

  /// The selected dark theme which will be used when the device is using the
  /// system dark theme.
  final FootballThemeData darkThemeData;
  @override

  /// The list of custom themes for the currently authenticated user.
  final List<FootballThemeData> customThemesData;
  @override
  final Config config;

  @override
  String toString() {
    return 'ThemeState(lightThemeData: $lightThemeData, darkThemeData: $darkThemeData, customThemesData: $customThemesData, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _State &&
            const DeepCollectionEquality()
                .equals(other.lightThemeData, lightThemeData) &&
            const DeepCollectionEquality()
                .equals(other.darkThemeData, darkThemeData) &&
            const DeepCollectionEquality()
                .equals(other.customThemesData, customThemesData) &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lightThemeData),
      const DeepCollectionEquality().hash(darkThemeData),
      const DeepCollectionEquality().hash(customThemesData),
      const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);
}

abstract class _State extends ThemeState {
  factory _State(
      {required FootballThemeData lightThemeData,
      required FootballThemeData darkThemeData,
      required List<FootballThemeData> customThemesData,
      required Config config}) = _$_State;
  _State._() : super._();

  @override

  /// The selected light theme which will be used when the device is using the
  /// system light theme.
  FootballThemeData get lightThemeData;
  @override

  /// The selected dark theme which will be used when the device is using the
  /// system dark theme.
  FootballThemeData get darkThemeData;
  @override

  /// The list of custom themes for the currently authenticated user.
  List<FootballThemeData> get customThemesData;
  @override
  Config get config;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}
