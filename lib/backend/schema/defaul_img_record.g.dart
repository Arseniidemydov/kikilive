// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defaul_img_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DefaulImgRecord> _$defaulImgRecordSerializer =
    new _$DefaulImgRecordSerializer();

class _$DefaulImgRecordSerializer
    implements StructuredSerializer<DefaulImgRecord> {
  @override
  final Iterable<Type> types = const [DefaulImgRecord, _$DefaulImgRecord];
  @override
  final String wireName = 'DefaulImgRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DefaulImgRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.defaultImg;
    if (value != null) {
      result
        ..add('default_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DefaulImgRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DefaulImgRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'default_img':
          result.defaultImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DefaulImgRecord extends DefaulImgRecord {
  @override
  final String? defaultImg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DefaulImgRecord([void Function(DefaulImgRecordBuilder)? updates]) =>
      (new DefaulImgRecordBuilder()..update(updates))._build();

  _$DefaulImgRecord._({this.defaultImg, this.ffRef}) : super._();

  @override
  DefaulImgRecord rebuild(void Function(DefaulImgRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DefaulImgRecordBuilder toBuilder() =>
      new DefaulImgRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DefaulImgRecord &&
        defaultImg == other.defaultImg &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, defaultImg.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DefaulImgRecord')
          ..add('defaultImg', defaultImg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DefaulImgRecordBuilder
    implements Builder<DefaulImgRecord, DefaulImgRecordBuilder> {
  _$DefaulImgRecord? _$v;

  String? _defaultImg;
  String? get defaultImg => _$this._defaultImg;
  set defaultImg(String? defaultImg) => _$this._defaultImg = defaultImg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DefaulImgRecordBuilder() {
    DefaulImgRecord._initializeBuilder(this);
  }

  DefaulImgRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _defaultImg = $v.defaultImg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DefaulImgRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DefaulImgRecord;
  }

  @override
  void update(void Function(DefaulImgRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DefaulImgRecord build() => _build();

  _$DefaulImgRecord _build() {
    final _$result =
        _$v ?? new _$DefaulImgRecord._(defaultImg: defaultImg, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
