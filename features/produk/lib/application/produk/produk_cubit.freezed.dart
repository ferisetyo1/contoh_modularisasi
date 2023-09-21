// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'produk_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProdukState {
  ResponseHandler<IList<Produk>> get list => throw _privateConstructorUsedError;
  ResponseHandler<Produk> get detail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProdukStateCopyWith<ProdukState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProdukStateCopyWith<$Res> {
  factory $ProdukStateCopyWith(
          ProdukState value, $Res Function(ProdukState) then) =
      _$ProdukStateCopyWithImpl<$Res, ProdukState>;
  @useResult
  $Res call(
      {ResponseHandler<IList<Produk>> list, ResponseHandler<Produk> detail});

  $ResponseHandlerCopyWith<IList<Produk>, $Res> get list;
  $ResponseHandlerCopyWith<Produk, $Res> get detail;
}

/// @nodoc
class _$ProdukStateCopyWithImpl<$Res, $Val extends ProdukState>
    implements $ProdukStateCopyWith<$Res> {
  _$ProdukStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? detail = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ResponseHandler<IList<Produk>>,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ResponseHandler<Produk>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseHandlerCopyWith<IList<Produk>, $Res> get list {
    return $ResponseHandlerCopyWith<IList<Produk>, $Res>(_value.list, (value) {
      return _then(_value.copyWith(list: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseHandlerCopyWith<Produk, $Res> get detail {
    return $ResponseHandlerCopyWith<Produk, $Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProdukStateCopyWith<$Res>
    implements $ProdukStateCopyWith<$Res> {
  factory _$$_ProdukStateCopyWith(
          _$_ProdukState value, $Res Function(_$_ProdukState) then) =
      __$$_ProdukStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseHandler<IList<Produk>> list, ResponseHandler<Produk> detail});

  @override
  $ResponseHandlerCopyWith<IList<Produk>, $Res> get list;
  @override
  $ResponseHandlerCopyWith<Produk, $Res> get detail;
}

/// @nodoc
class __$$_ProdukStateCopyWithImpl<$Res>
    extends _$ProdukStateCopyWithImpl<$Res, _$_ProdukState>
    implements _$$_ProdukStateCopyWith<$Res> {
  __$$_ProdukStateCopyWithImpl(
      _$_ProdukState _value, $Res Function(_$_ProdukState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? detail = null,
  }) {
    return _then(_$_ProdukState(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ResponseHandler<IList<Produk>>,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ResponseHandler<Produk>,
    ));
  }
}

/// @nodoc

class _$_ProdukState implements _ProdukState {
  const _$_ProdukState({required this.list, required this.detail});

  @override
  final ResponseHandler<IList<Produk>> list;
  @override
  final ResponseHandler<Produk> detail;

  @override
  String toString() {
    return 'ProdukState(list: $list, detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProdukState &&
            (identical(other.list, list) || other.list == list) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, list, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProdukStateCopyWith<_$_ProdukState> get copyWith =>
      __$$_ProdukStateCopyWithImpl<_$_ProdukState>(this, _$identity);
}

abstract class _ProdukState implements ProdukState {
  const factory _ProdukState(
      {required final ResponseHandler<IList<Produk>> list,
      required final ResponseHandler<Produk> detail}) = _$_ProdukState;

  @override
  ResponseHandler<IList<Produk>> get list;
  @override
  ResponseHandler<Produk> get detail;
  @override
  @JsonKey(ignore: true)
  _$$_ProdukStateCopyWith<_$_ProdukState> get copyWith =>
      throw _privateConstructorUsedError;
}
