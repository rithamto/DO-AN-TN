// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_manage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockManageStateData {
  List<ReportStockData> get reportStockManages =>
      throw _privateConstructorUsedError;
  bool get isOpenSearch => throw _privateConstructorUsedError;
  bool get isCategoryScreen => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  List<Product> get productsOriginal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockManageStateDataCopyWith<StockManageStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockManageStateDataCopyWith<$Res> {
  factory $StockManageStateDataCopyWith(StockManageStateData value,
          $Res Function(StockManageStateData) then) =
      _$StockManageStateDataCopyWithImpl<$Res, StockManageStateData>;
  @useResult
  $Res call(
      {List<ReportStockData> reportStockManages,
      bool isOpenSearch,
      bool isCategoryScreen,
      StatusType status,
      List<Product> products,
      List<Product> productsOriginal});
}

/// @nodoc
class _$StockManageStateDataCopyWithImpl<$Res,
        $Val extends StockManageStateData>
    implements $StockManageStateDataCopyWith<$Res> {
  _$StockManageStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportStockManages = null,
    Object? isOpenSearch = null,
    Object? isCategoryScreen = null,
    Object? status = null,
    Object? products = null,
    Object? productsOriginal = null,
  }) {
    return _then(_value.copyWith(
      reportStockManages: null == reportStockManages
          ? _value.reportStockManages
          : reportStockManages // ignore: cast_nullable_to_non_nullable
              as List<ReportStockData>,
      isOpenSearch: null == isOpenSearch
          ? _value.isOpenSearch
          : isOpenSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoryScreen: null == isCategoryScreen
          ? _value.isCategoryScreen
          : isCategoryScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      productsOriginal: null == productsOriginal
          ? _value.productsOriginal
          : productsOriginal // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockManageStateDataCopyWith<$Res>
    implements $StockManageStateDataCopyWith<$Res> {
  factory _$$_StockManageStateDataCopyWith(_$_StockManageStateData value,
          $Res Function(_$_StockManageStateData) then) =
      __$$_StockManageStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReportStockData> reportStockManages,
      bool isOpenSearch,
      bool isCategoryScreen,
      StatusType status,
      List<Product> products,
      List<Product> productsOriginal});
}

/// @nodoc
class __$$_StockManageStateDataCopyWithImpl<$Res>
    extends _$StockManageStateDataCopyWithImpl<$Res, _$_StockManageStateData>
    implements _$$_StockManageStateDataCopyWith<$Res> {
  __$$_StockManageStateDataCopyWithImpl(_$_StockManageStateData _value,
      $Res Function(_$_StockManageStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportStockManages = null,
    Object? isOpenSearch = null,
    Object? isCategoryScreen = null,
    Object? status = null,
    Object? products = null,
    Object? productsOriginal = null,
  }) {
    return _then(_$_StockManageStateData(
      reportStockManages: null == reportStockManages
          ? _value._reportStockManages
          : reportStockManages // ignore: cast_nullable_to_non_nullable
              as List<ReportStockData>,
      isOpenSearch: null == isOpenSearch
          ? _value.isOpenSearch
          : isOpenSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoryScreen: null == isCategoryScreen
          ? _value.isCategoryScreen
          : isCategoryScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      productsOriginal: null == productsOriginal
          ? _value._productsOriginal
          : productsOriginal // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_StockManageStateData implements _StockManageStateData {
  const _$_StockManageStateData(
      {final List<ReportStockData> reportStockManages = const [],
      this.isOpenSearch = false,
      this.isCategoryScreen = false,
      this.status = StatusType.init,
      final List<Product> products = const [],
      final List<Product> productsOriginal = const []})
      : _reportStockManages = reportStockManages,
        _products = products,
        _productsOriginal = productsOriginal;

  final List<ReportStockData> _reportStockManages;
  @override
  @JsonKey()
  List<ReportStockData> get reportStockManages {
    if (_reportStockManages is EqualUnmodifiableListView)
      return _reportStockManages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportStockManages);
  }

  @override
  @JsonKey()
  final bool isOpenSearch;
  @override
  @JsonKey()
  final bool isCategoryScreen;
  @override
  @JsonKey()
  final StatusType status;
  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<Product> _productsOriginal;
  @override
  @JsonKey()
  List<Product> get productsOriginal {
    if (_productsOriginal is EqualUnmodifiableListView)
      return _productsOriginal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsOriginal);
  }

  @override
  String toString() {
    return 'StockManageStateData(reportStockManages: $reportStockManages, isOpenSearch: $isOpenSearch, isCategoryScreen: $isCategoryScreen, status: $status, products: $products, productsOriginal: $productsOriginal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockManageStateData &&
            const DeepCollectionEquality()
                .equals(other._reportStockManages, _reportStockManages) &&
            (identical(other.isOpenSearch, isOpenSearch) ||
                other.isOpenSearch == isOpenSearch) &&
            (identical(other.isCategoryScreen, isCategoryScreen) ||
                other.isCategoryScreen == isCategoryScreen) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._productsOriginal, _productsOriginal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reportStockManages),
      isOpenSearch,
      isCategoryScreen,
      status,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_productsOriginal));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockManageStateDataCopyWith<_$_StockManageStateData> get copyWith =>
      __$$_StockManageStateDataCopyWithImpl<_$_StockManageStateData>(
          this, _$identity);
}

abstract class _StockManageStateData implements StockManageStateData {
  const factory _StockManageStateData(
      {final List<ReportStockData> reportStockManages,
      final bool isOpenSearch,
      final bool isCategoryScreen,
      final StatusType status,
      final List<Product> products,
      final List<Product> productsOriginal}) = _$_StockManageStateData;

  @override
  List<ReportStockData> get reportStockManages;
  @override
  bool get isOpenSearch;
  @override
  bool get isCategoryScreen;
  @override
  StatusType get status;
  @override
  List<Product> get products;
  @override
  List<Product> get productsOriginal;
  @override
  @JsonKey(ignore: true)
  _$$_StockManageStateDataCopyWith<_$_StockManageStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockManageState {
  StockManageStateData? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StockManageStateData? data) initial,
    required TResult Function(StockManageStateData? data) getReportStockManages,
    required TResult Function(StockManageStateData? data) isOpenSearch,
    required TResult Function(StockManageStateData? data) isCategoryScreen,
    required TResult Function(StockManageStateData? data) status,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StockManageStateData? data)? initial,
    TResult? Function(StockManageStateData? data)? getReportStockManages,
    TResult? Function(StockManageStateData? data)? isOpenSearch,
    TResult? Function(StockManageStateData? data)? isCategoryScreen,
    TResult? Function(StockManageStateData? data)? status,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StockManageStateData? data)? initial,
    TResult Function(StockManageStateData? data)? getReportStockManages,
    TResult Function(StockManageStateData? data)? isOpenSearch,
    TResult Function(StockManageStateData? data)? isCategoryScreen,
    TResult Function(StockManageStateData? data)? status,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetReportStockManages value)
        getReportStockManages,
    required TResult Function(IsOpenSearch value) isOpenSearch,
    required TResult Function(IsCategoryScreen value) isCategoryScreen,
    required TResult Function(Status value) status,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetReportStockManages value)? getReportStockManages,
    TResult? Function(IsOpenSearch value)? isOpenSearch,
    TResult? Function(IsCategoryScreen value)? isCategoryScreen,
    TResult? Function(Status value)? status,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetReportStockManages value)? getReportStockManages,
    TResult Function(IsOpenSearch value)? isOpenSearch,
    TResult Function(IsCategoryScreen value)? isCategoryScreen,
    TResult Function(Status value)? status,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockManageStateCopyWith<StockManageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockManageStateCopyWith<$Res> {
  factory $StockManageStateCopyWith(
          StockManageState value, $Res Function(StockManageState) then) =
      _$StockManageStateCopyWithImpl<$Res, StockManageState>;
  @useResult
  $Res call({StockManageStateData? data});

  $StockManageStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$StockManageStateCopyWithImpl<$Res, $Val extends StockManageState>
    implements $StockManageStateCopyWith<$Res> {
  _$StockManageStateCopyWithImpl(this._value, this._then);

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
              as StockManageStateData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StockManageStateDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $StockManageStateDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $StockManageStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StockManageStateData? data});

  @override
  $StockManageStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$StockManageStateCopyWithImpl<$Res, _$Initial>
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
              as StockManageStateData?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({this.data});

  @override
  final StockManageStateData? data;

  @override
  String toString() {
    return 'StockManageState.initial(data: $data)';
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
    required TResult Function(StockManageStateData? data) initial,
    required TResult Function(StockManageStateData? data) getReportStockManages,
    required TResult Function(StockManageStateData? data) isOpenSearch,
    required TResult Function(StockManageStateData? data) isCategoryScreen,
    required TResult Function(StockManageStateData? data) status,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StockManageStateData? data)? initial,
    TResult? Function(StockManageStateData? data)? getReportStockManages,
    TResult? Function(StockManageStateData? data)? isOpenSearch,
    TResult? Function(StockManageStateData? data)? isCategoryScreen,
    TResult? Function(StockManageStateData? data)? status,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StockManageStateData? data)? initial,
    TResult Function(StockManageStateData? data)? getReportStockManages,
    TResult Function(StockManageStateData? data)? isOpenSearch,
    TResult Function(StockManageStateData? data)? isCategoryScreen,
    TResult Function(StockManageStateData? data)? status,
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
    required TResult Function(GetReportStockManages value)
        getReportStockManages,
    required TResult Function(IsOpenSearch value) isOpenSearch,
    required TResult Function(IsCategoryScreen value) isCategoryScreen,
    required TResult Function(Status value) status,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetReportStockManages value)? getReportStockManages,
    TResult? Function(IsOpenSearch value)? isOpenSearch,
    TResult? Function(IsCategoryScreen value)? isCategoryScreen,
    TResult? Function(Status value)? status,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetReportStockManages value)? getReportStockManages,
    TResult Function(IsOpenSearch value)? isOpenSearch,
    TResult Function(IsCategoryScreen value)? isCategoryScreen,
    TResult Function(Status value)? status,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements StockManageState {
  const factory Initial({final StockManageStateData? data}) = _$Initial;

  @override
  StockManageStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetReportStockManagesCopyWith<$Res>
    implements $StockManageStateCopyWith<$Res> {
  factory _$$GetReportStockManagesCopyWith(_$GetReportStockManages value,
          $Res Function(_$GetReportStockManages) then) =
      __$$GetReportStockManagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StockManageStateData? data});

  @override
  $StockManageStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetReportStockManagesCopyWithImpl<$Res>
    extends _$StockManageStateCopyWithImpl<$Res, _$GetReportStockManages>
    implements _$$GetReportStockManagesCopyWith<$Res> {
  __$$GetReportStockManagesCopyWithImpl(_$GetReportStockManages _value,
      $Res Function(_$GetReportStockManages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GetReportStockManages(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StockManageStateData?,
    ));
  }
}

/// @nodoc

class _$GetReportStockManages implements GetReportStockManages {
  const _$GetReportStockManages({this.data});

  @override
  final StockManageStateData? data;

  @override
  String toString() {
    return 'StockManageState.getReportStockManages(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReportStockManages &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReportStockManagesCopyWith<_$GetReportStockManages> get copyWith =>
      __$$GetReportStockManagesCopyWithImpl<_$GetReportStockManages>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StockManageStateData? data) initial,
    required TResult Function(StockManageStateData? data) getReportStockManages,
    required TResult Function(StockManageStateData? data) isOpenSearch,
    required TResult Function(StockManageStateData? data) isCategoryScreen,
    required TResult Function(StockManageStateData? data) status,
  }) {
    return getReportStockManages(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StockManageStateData? data)? initial,
    TResult? Function(StockManageStateData? data)? getReportStockManages,
    TResult? Function(StockManageStateData? data)? isOpenSearch,
    TResult? Function(StockManageStateData? data)? isCategoryScreen,
    TResult? Function(StockManageStateData? data)? status,
  }) {
    return getReportStockManages?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StockManageStateData? data)? initial,
    TResult Function(StockManageStateData? data)? getReportStockManages,
    TResult Function(StockManageStateData? data)? isOpenSearch,
    TResult Function(StockManageStateData? data)? isCategoryScreen,
    TResult Function(StockManageStateData? data)? status,
    required TResult orElse(),
  }) {
    if (getReportStockManages != null) {
      return getReportStockManages(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetReportStockManages value)
        getReportStockManages,
    required TResult Function(IsOpenSearch value) isOpenSearch,
    required TResult Function(IsCategoryScreen value) isCategoryScreen,
    required TResult Function(Status value) status,
  }) {
    return getReportStockManages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetReportStockManages value)? getReportStockManages,
    TResult? Function(IsOpenSearch value)? isOpenSearch,
    TResult? Function(IsCategoryScreen value)? isCategoryScreen,
    TResult? Function(Status value)? status,
  }) {
    return getReportStockManages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetReportStockManages value)? getReportStockManages,
    TResult Function(IsOpenSearch value)? isOpenSearch,
    TResult Function(IsCategoryScreen value)? isCategoryScreen,
    TResult Function(Status value)? status,
    required TResult orElse(),
  }) {
    if (getReportStockManages != null) {
      return getReportStockManages(this);
    }
    return orElse();
  }
}

abstract class GetReportStockManages implements StockManageState {
  const factory GetReportStockManages({final StockManageStateData? data}) =
      _$GetReportStockManages;

  @override
  StockManageStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetReportStockManagesCopyWith<_$GetReportStockManages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsOpenSearchCopyWith<$Res>
    implements $StockManageStateCopyWith<$Res> {
  factory _$$IsOpenSearchCopyWith(
          _$IsOpenSearch value, $Res Function(_$IsOpenSearch) then) =
      __$$IsOpenSearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StockManageStateData? data});

  @override
  $StockManageStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$IsOpenSearchCopyWithImpl<$Res>
    extends _$StockManageStateCopyWithImpl<$Res, _$IsOpenSearch>
    implements _$$IsOpenSearchCopyWith<$Res> {
  __$$IsOpenSearchCopyWithImpl(
      _$IsOpenSearch _value, $Res Function(_$IsOpenSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$IsOpenSearch(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StockManageStateData?,
    ));
  }
}

/// @nodoc

class _$IsOpenSearch implements IsOpenSearch {
  const _$IsOpenSearch({this.data});

  @override
  final StockManageStateData? data;

  @override
  String toString() {
    return 'StockManageState.isOpenSearch(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsOpenSearch &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsOpenSearchCopyWith<_$IsOpenSearch> get copyWith =>
      __$$IsOpenSearchCopyWithImpl<_$IsOpenSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StockManageStateData? data) initial,
    required TResult Function(StockManageStateData? data) getReportStockManages,
    required TResult Function(StockManageStateData? data) isOpenSearch,
    required TResult Function(StockManageStateData? data) isCategoryScreen,
    required TResult Function(StockManageStateData? data) status,
  }) {
    return isOpenSearch(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StockManageStateData? data)? initial,
    TResult? Function(StockManageStateData? data)? getReportStockManages,
    TResult? Function(StockManageStateData? data)? isOpenSearch,
    TResult? Function(StockManageStateData? data)? isCategoryScreen,
    TResult? Function(StockManageStateData? data)? status,
  }) {
    return isOpenSearch?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StockManageStateData? data)? initial,
    TResult Function(StockManageStateData? data)? getReportStockManages,
    TResult Function(StockManageStateData? data)? isOpenSearch,
    TResult Function(StockManageStateData? data)? isCategoryScreen,
    TResult Function(StockManageStateData? data)? status,
    required TResult orElse(),
  }) {
    if (isOpenSearch != null) {
      return isOpenSearch(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetReportStockManages value)
        getReportStockManages,
    required TResult Function(IsOpenSearch value) isOpenSearch,
    required TResult Function(IsCategoryScreen value) isCategoryScreen,
    required TResult Function(Status value) status,
  }) {
    return isOpenSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetReportStockManages value)? getReportStockManages,
    TResult? Function(IsOpenSearch value)? isOpenSearch,
    TResult? Function(IsCategoryScreen value)? isCategoryScreen,
    TResult? Function(Status value)? status,
  }) {
    return isOpenSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetReportStockManages value)? getReportStockManages,
    TResult Function(IsOpenSearch value)? isOpenSearch,
    TResult Function(IsCategoryScreen value)? isCategoryScreen,
    TResult Function(Status value)? status,
    required TResult orElse(),
  }) {
    if (isOpenSearch != null) {
      return isOpenSearch(this);
    }
    return orElse();
  }
}

abstract class IsOpenSearch implements StockManageState {
  const factory IsOpenSearch({final StockManageStateData? data}) =
      _$IsOpenSearch;

  @override
  StockManageStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$IsOpenSearchCopyWith<_$IsOpenSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsCategoryScreenCopyWith<$Res>
    implements $StockManageStateCopyWith<$Res> {
  factory _$$IsCategoryScreenCopyWith(
          _$IsCategoryScreen value, $Res Function(_$IsCategoryScreen) then) =
      __$$IsCategoryScreenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StockManageStateData? data});

  @override
  $StockManageStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$IsCategoryScreenCopyWithImpl<$Res>
    extends _$StockManageStateCopyWithImpl<$Res, _$IsCategoryScreen>
    implements _$$IsCategoryScreenCopyWith<$Res> {
  __$$IsCategoryScreenCopyWithImpl(
      _$IsCategoryScreen _value, $Res Function(_$IsCategoryScreen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$IsCategoryScreen(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as StockManageStateData?,
    ));
  }
}

/// @nodoc

class _$IsCategoryScreen implements IsCategoryScreen {
  const _$IsCategoryScreen({this.data});

  @override
  final StockManageStateData? data;

  @override
  String toString() {
    return 'StockManageState.isCategoryScreen(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsCategoryScreen &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsCategoryScreenCopyWith<_$IsCategoryScreen> get copyWith =>
      __$$IsCategoryScreenCopyWithImpl<_$IsCategoryScreen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StockManageStateData? data) initial,
    required TResult Function(StockManageStateData? data) getReportStockManages,
    required TResult Function(StockManageStateData? data) isOpenSearch,
    required TResult Function(StockManageStateData? data) isCategoryScreen,
    required TResult Function(StockManageStateData? data) status,
  }) {
    return isCategoryScreen(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StockManageStateData? data)? initial,
    TResult? Function(StockManageStateData? data)? getReportStockManages,
    TResult? Function(StockManageStateData? data)? isOpenSearch,
    TResult? Function(StockManageStateData? data)? isCategoryScreen,
    TResult? Function(StockManageStateData? data)? status,
  }) {
    return isCategoryScreen?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StockManageStateData? data)? initial,
    TResult Function(StockManageStateData? data)? getReportStockManages,
    TResult Function(StockManageStateData? data)? isOpenSearch,
    TResult Function(StockManageStateData? data)? isCategoryScreen,
    TResult Function(StockManageStateData? data)? status,
    required TResult orElse(),
  }) {
    if (isCategoryScreen != null) {
      return isCategoryScreen(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(GetReportStockManages value)
        getReportStockManages,
    required TResult Function(IsOpenSearch value) isOpenSearch,
    required TResult Function(IsCategoryScreen value) isCategoryScreen,
    required TResult Function(Status value) status,
  }) {
    return isCategoryScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetReportStockManages value)? getReportStockManages,
    TResult? Function(IsOpenSearch value)? isOpenSearch,
    TResult? Function(IsCategoryScreen value)? isCategoryScreen,
    TResult? Function(Status value)? status,
  }) {
    return isCategoryScreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetReportStockManages value)? getReportStockManages,
    TResult Function(IsOpenSearch value)? isOpenSearch,
    TResult Function(IsCategoryScreen value)? isCategoryScreen,
    TResult Function(Status value)? status,
    required TResult orElse(),
  }) {
    if (isCategoryScreen != null) {
      return isCategoryScreen(this);
    }
    return orElse();
  }
}

abstract class IsCategoryScreen implements StockManageState {
  const factory IsCategoryScreen({final StockManageStateData? data}) =
      _$IsCategoryScreen;

  @override
  StockManageStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$IsCategoryScreenCopyWith<_$IsCategoryScreen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusCopyWith<$Res>
    implements $StockManageStateCopyWith<$Res> {
  factory _$$StatusCopyWith(_$Status value, $Res Function(_$Status) then) =
      __$$StatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StockManageStateData? data});

  @override
  $StockManageStateDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$StatusCopyWithImpl<$Res>
    extends _$StockManageStateCopyWithImpl<$Res, _$Status>
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
              as StockManageStateData?,
    ));
  }
}

/// @nodoc

class _$Status implements Status {
  const _$Status({this.data});

  @override
  final StockManageStateData? data;

  @override
  String toString() {
    return 'StockManageState.status(data: $data)';
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
    required TResult Function(StockManageStateData? data) initial,
    required TResult Function(StockManageStateData? data) getReportStockManages,
    required TResult Function(StockManageStateData? data) isOpenSearch,
    required TResult Function(StockManageStateData? data) isCategoryScreen,
    required TResult Function(StockManageStateData? data) status,
  }) {
    return status(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StockManageStateData? data)? initial,
    TResult? Function(StockManageStateData? data)? getReportStockManages,
    TResult? Function(StockManageStateData? data)? isOpenSearch,
    TResult? Function(StockManageStateData? data)? isCategoryScreen,
    TResult? Function(StockManageStateData? data)? status,
  }) {
    return status?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StockManageStateData? data)? initial,
    TResult Function(StockManageStateData? data)? getReportStockManages,
    TResult Function(StockManageStateData? data)? isOpenSearch,
    TResult Function(StockManageStateData? data)? isCategoryScreen,
    TResult Function(StockManageStateData? data)? status,
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
    required TResult Function(GetReportStockManages value)
        getReportStockManages,
    required TResult Function(IsOpenSearch value) isOpenSearch,
    required TResult Function(IsCategoryScreen value) isCategoryScreen,
    required TResult Function(Status value) status,
  }) {
    return status(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(GetReportStockManages value)? getReportStockManages,
    TResult? Function(IsOpenSearch value)? isOpenSearch,
    TResult? Function(IsCategoryScreen value)? isCategoryScreen,
    TResult? Function(Status value)? status,
  }) {
    return status?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(GetReportStockManages value)? getReportStockManages,
    TResult Function(IsOpenSearch value)? isOpenSearch,
    TResult Function(IsCategoryScreen value)? isCategoryScreen,
    TResult Function(Status value)? status,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this);
    }
    return orElse();
  }
}

abstract class Status implements StockManageState {
  const factory Status({final StockManageStateData? data}) = _$Status;

  @override
  StockManageStateData? get data;
  @override
  @JsonKey(ignore: true)
  _$$StatusCopyWith<_$Status> get copyWith =>
      throw _privateConstructorUsedError;
}
