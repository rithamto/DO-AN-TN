// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrderStateData {
  StatusType get status => throw _privateConstructorUsedError;
  List<SellData> get sells => throw _privateConstructorUsedError;
  List<SellData> get sellsOriginal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrderStateDataCopyWith<SalesOrderStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderStateDataCopyWith<$Res> {
  factory $SalesOrderStateDataCopyWith(
          SalesOrderStateData value, $Res Function(SalesOrderStateData) then) =
      _$SalesOrderStateDataCopyWithImpl<$Res, SalesOrderStateData>;
  @useResult
  $Res call(
      {StatusType status, List<SellData> sells, List<SellData> sellsOriginal});
}

/// @nodoc
class _$SalesOrderStateDataCopyWithImpl<$Res, $Val extends SalesOrderStateData>
    implements $SalesOrderStateDataCopyWith<$Res> {
  _$SalesOrderStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sells = null,
    Object? sellsOriginal = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      sells: null == sells
          ? _value.sells
          : sells // ignore: cast_nullable_to_non_nullable
              as List<SellData>,
      sellsOriginal: null == sellsOriginal
          ? _value.sellsOriginal
          : sellsOriginal // ignore: cast_nullable_to_non_nullable
              as List<SellData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesOrderStateDataCopyWith<$Res>
    implements $SalesOrderStateDataCopyWith<$Res> {
  factory _$$_SalesOrderStateDataCopyWith(_$_SalesOrderStateData value,
          $Res Function(_$_SalesOrderStateData) then) =
      __$$_SalesOrderStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusType status, List<SellData> sells, List<SellData> sellsOriginal});
}

/// @nodoc
class __$$_SalesOrderStateDataCopyWithImpl<$Res>
    extends _$SalesOrderStateDataCopyWithImpl<$Res, _$_SalesOrderStateData>
    implements _$$_SalesOrderStateDataCopyWith<$Res> {
  __$$_SalesOrderStateDataCopyWithImpl(_$_SalesOrderStateData _value,
      $Res Function(_$_SalesOrderStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sells = null,
    Object? sellsOriginal = null,
  }) {
    return _then(_$_SalesOrderStateData(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      sells: null == sells
          ? _value._sells
          : sells // ignore: cast_nullable_to_non_nullable
              as List<SellData>,
      sellsOriginal: null == sellsOriginal
          ? _value._sellsOriginal
          : sellsOriginal // ignore: cast_nullable_to_non_nullable
              as List<SellData>,
    ));
  }
}

/// @nodoc

class _$_SalesOrderStateData implements _SalesOrderStateData {
  const _$_SalesOrderStateData(
      {this.status = StatusType.init,
      final List<SellData> sells = const [],
      final List<SellData> sellsOriginal = const []})
      : _sells = sells,
        _sellsOriginal = sellsOriginal;

  @override
  @JsonKey()
  final StatusType status;
  final List<SellData> _sells;
  @override
  @JsonKey()
  List<SellData> get sells {
    if (_sells is EqualUnmodifiableListView) return _sells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sells);
  }

  final List<SellData> _sellsOriginal;
  @override
  @JsonKey()
  List<SellData> get sellsOriginal {
    if (_sellsOriginal is EqualUnmodifiableListView) return _sellsOriginal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sellsOriginal);
  }

  @override
  String toString() {
    return 'SalesOrderStateData(status: $status, sells: $sells, sellsOriginal: $sellsOriginal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrderStateData &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._sells, _sells) &&
            const DeepCollectionEquality()
                .equals(other._sellsOriginal, _sellsOriginal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_sells),
      const DeepCollectionEquality().hash(_sellsOriginal));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesOrderStateDataCopyWith<_$_SalesOrderStateData> get copyWith =>
      __$$_SalesOrderStateDataCopyWithImpl<_$_SalesOrderStateData>(
          this, _$identity);
}

abstract class _SalesOrderStateData implements SalesOrderStateData {
  const factory _SalesOrderStateData(
      {final StatusType status,
      final List<SellData> sells,
      final List<SellData> sellsOriginal}) = _$_SalesOrderStateData;

  @override
  StatusType get status;
  @override
  List<SellData> get sells;
  @override
  List<SellData> get sellsOriginal;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrderStateDataCopyWith<_$_SalesOrderStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrderState {
  SalesOrderStateData? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderStateData? data) initial,
    required TResult Function(SalesOrderStateData? data) status,
    required TResult Function(SalesOrderStateData? data) getSell,
    required TResult Function(SalesOrderStateData? data) addSell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderStateData? data)? initial,
    TResult? Function(SalesOrderStateData? data)? status,
    TResult? Function(SalesOrderStateData? data)? getSell,
    TResult? Function(SalesOrderStateData? data)? addSell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderStateData? data)? initial,
    TResult Function(SalesOrderStateData? data)? status,
    TResult Function(SalesOrderStateData? data)? getSell,
    TResult Function(SalesOrderStateData? data)? addSell,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Status value) status,
    required TResult Function(GetSell value) getSell,
    required TResult Function(AddSell value) addSell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Status value)? status,
    TResult? Function(GetSell value)? getSell,
    TResult? Function(AddSell value)? addSell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Status value)? status,
    TResult Function(GetSell value)? getSell,
    TResult Function(AddSell value)? addSell,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrderStateCopyWith<SalesOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderStateCopyWith<$Res> {
  factory $SalesOrderStateCopyWith(
          SalesOrderState value, $Res Function(SalesOrderState) then) =
      _$SalesOrderStateCopyWithImpl<$Res, SalesOrderState>;
  @useResult
  $Res call({SalesOrderStateData? data});

  $SalesOrderStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SalesOrderStateCopyWithImpl<$Res, $Val extends SalesOrderState>
    implements $SalesOrderStateCopyWith<$Res> {
  _$SalesOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalesOrderStateData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrderStateDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SalesOrderStateDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $SalesOrderStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrderStateData? data});

  @override
  $SalesOrderStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$SalesOrderStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Initial(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalesOrderStateData?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({this.data});

  @override
  final SalesOrderStateData? data;

  @override
  String toString() {
    return 'SalesOrderState.initial(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderStateData? data) initial,
    required TResult Function(SalesOrderStateData? data) status,
    required TResult Function(SalesOrderStateData? data) getSell,
    required TResult Function(SalesOrderStateData? data) addSell,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderStateData? data)? initial,
    TResult? Function(SalesOrderStateData? data)? status,
    TResult? Function(SalesOrderStateData? data)? getSell,
    TResult? Function(SalesOrderStateData? data)? addSell,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderStateData? data)? initial,
    TResult Function(SalesOrderStateData? data)? status,
    TResult Function(SalesOrderStateData? data)? getSell,
    TResult Function(SalesOrderStateData? data)? addSell,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Status value) status,
    required TResult Function(GetSell value) getSell,
    required TResult Function(AddSell value) addSell,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Status value)? status,
    TResult? Function(GetSell value)? getSell,
    TResult? Function(AddSell value)? addSell,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Status value)? status,
    TResult Function(GetSell value)? getSell,
    TResult Function(AddSell value)? addSell,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SalesOrderState {
  const factory Initial({final SalesOrderStateData? data}) = _$Initial;

  @override
  SalesOrderStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusCopyWith<$Res>
    implements $SalesOrderStateCopyWith<$Res> {
  factory _$$StatusCopyWith(_$Status value, $Res Function(_$Status) then) =
      __$$StatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrderStateData? data});

  @override
  $SalesOrderStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$StatusCopyWithImpl<$Res>
    extends _$SalesOrderStateCopyWithImpl<$Res, _$Status>
    implements _$$StatusCopyWith<$Res> {
  __$$StatusCopyWithImpl(_$Status _value, $Res Function(_$Status) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Status(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalesOrderStateData?,
    ));
  }
}

/// @nodoc

class _$Status implements Status {
  const _$Status({this.data});

  @override
  final SalesOrderStateData? data;

  @override
  String toString() {
    return 'SalesOrderState.status(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Status &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCopyWith<_$Status> get copyWith =>
      __$$StatusCopyWithImpl<_$Status>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderStateData? data) initial,
    required TResult Function(SalesOrderStateData? data) status,
    required TResult Function(SalesOrderStateData? data) getSell,
    required TResult Function(SalesOrderStateData? data) addSell,
  }) {
    return status(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderStateData? data)? initial,
    TResult? Function(SalesOrderStateData? data)? status,
    TResult? Function(SalesOrderStateData? data)? getSell,
    TResult? Function(SalesOrderStateData? data)? addSell,
  }) {
    return status?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderStateData? data)? initial,
    TResult Function(SalesOrderStateData? data)? status,
    TResult Function(SalesOrderStateData? data)? getSell,
    TResult Function(SalesOrderStateData? data)? addSell,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Status value) status,
    required TResult Function(GetSell value) getSell,
    required TResult Function(AddSell value) addSell,
  }) {
    return status(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Status value)? status,
    TResult? Function(GetSell value)? getSell,
    TResult? Function(AddSell value)? addSell,
  }) {
    return status?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Status value)? status,
    TResult Function(GetSell value)? getSell,
    TResult Function(AddSell value)? addSell,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this);
    }
    return orElse();
  }
}

abstract class Status implements SalesOrderState {
  const factory Status({final SalesOrderStateData? data}) = _$Status;

  @override
  SalesOrderStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$StatusCopyWith<_$Status> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSellCopyWith<$Res>
    implements $SalesOrderStateCopyWith<$Res> {
  factory _$$GetSellCopyWith(_$GetSell value, $Res Function(_$GetSell) then) =
      __$$GetSellCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrderStateData? data});

  @override
  $SalesOrderStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetSellCopyWithImpl<$Res>
    extends _$SalesOrderStateCopyWithImpl<$Res, _$GetSell>
    implements _$$GetSellCopyWith<$Res> {
  __$$GetSellCopyWithImpl(_$GetSell _value, $Res Function(_$GetSell) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GetSell(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalesOrderStateData?,
    ));
  }
}

/// @nodoc

class _$GetSell implements GetSell {
  const _$GetSell({this.data});

  @override
  final SalesOrderStateData? data;

  @override
  String toString() {
    return 'SalesOrderState.getSell(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSell &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSellCopyWith<_$GetSell> get copyWith =>
      __$$GetSellCopyWithImpl<_$GetSell>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderStateData? data) initial,
    required TResult Function(SalesOrderStateData? data) status,
    required TResult Function(SalesOrderStateData? data) getSell,
    required TResult Function(SalesOrderStateData? data) addSell,
  }) {
    return getSell(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderStateData? data)? initial,
    TResult? Function(SalesOrderStateData? data)? status,
    TResult? Function(SalesOrderStateData? data)? getSell,
    TResult? Function(SalesOrderStateData? data)? addSell,
  }) {
    return getSell?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderStateData? data)? initial,
    TResult Function(SalesOrderStateData? data)? status,
    TResult Function(SalesOrderStateData? data)? getSell,
    TResult Function(SalesOrderStateData? data)? addSell,
    required TResult orElse(),
  }) {
    if (getSell != null) {
      return getSell(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Status value) status,
    required TResult Function(GetSell value) getSell,
    required TResult Function(AddSell value) addSell,
  }) {
    return getSell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Status value)? status,
    TResult? Function(GetSell value)? getSell,
    TResult? Function(AddSell value)? addSell,
  }) {
    return getSell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Status value)? status,
    TResult Function(GetSell value)? getSell,
    TResult Function(AddSell value)? addSell,
    required TResult orElse(),
  }) {
    if (getSell != null) {
      return getSell(this);
    }
    return orElse();
  }
}

abstract class GetSell implements SalesOrderState {
  const factory GetSell({final SalesOrderStateData? data}) = _$GetSell;

  @override
  SalesOrderStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetSellCopyWith<_$GetSell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSellCopyWith<$Res>
    implements $SalesOrderStateCopyWith<$Res> {
  factory _$$AddSellCopyWith(_$AddSell value, $Res Function(_$AddSell) then) =
      __$$AddSellCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrderStateData? data});

  @override
  $SalesOrderStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AddSellCopyWithImpl<$Res>
    extends _$SalesOrderStateCopyWithImpl<$Res, _$AddSell>
    implements _$$AddSellCopyWith<$Res> {
  __$$AddSellCopyWithImpl(_$AddSell _value, $Res Function(_$AddSell) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AddSell(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SalesOrderStateData?,
    ));
  }
}

/// @nodoc

class _$AddSell implements AddSell {
  const _$AddSell({this.data});

  @override
  final SalesOrderStateData? data;

  @override
  String toString() {
    return 'SalesOrderState.addSell(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSell &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSellCopyWith<_$AddSell> get copyWith =>
      __$$AddSellCopyWithImpl<_$AddSell>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderStateData? data) initial,
    required TResult Function(SalesOrderStateData? data) status,
    required TResult Function(SalesOrderStateData? data) getSell,
    required TResult Function(SalesOrderStateData? data) addSell,
  }) {
    return addSell(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderStateData? data)? initial,
    TResult? Function(SalesOrderStateData? data)? status,
    TResult? Function(SalesOrderStateData? data)? getSell,
    TResult? Function(SalesOrderStateData? data)? addSell,
  }) {
    return addSell?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderStateData? data)? initial,
    TResult Function(SalesOrderStateData? data)? status,
    TResult Function(SalesOrderStateData? data)? getSell,
    TResult Function(SalesOrderStateData? data)? addSell,
    required TResult orElse(),
  }) {
    if (addSell != null) {
      return addSell(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Status value) status,
    required TResult Function(GetSell value) getSell,
    required TResult Function(AddSell value) addSell,
  }) {
    return addSell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Status value)? status,
    TResult? Function(GetSell value)? getSell,
    TResult? Function(AddSell value)? addSell,
  }) {
    return addSell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Status value)? status,
    TResult Function(GetSell value)? getSell,
    TResult Function(AddSell value)? addSell,
    required TResult orElse(),
  }) {
    if (addSell != null) {
      return addSell(this);
    }
    return orElse();
  }
}

abstract class AddSell implements SalesOrderState {
  const factory AddSell({final SalesOrderStateData? data}) = _$AddSell;

  @override
  SalesOrderStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$AddSellCopyWith<_$AddSell> get copyWith =>
      throw _privateConstructorUsedError;
}
