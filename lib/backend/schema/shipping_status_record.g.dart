// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_status_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ShippingStatusRecord> _$shippingStatusRecordSerializer =
    new _$ShippingStatusRecordSerializer();

class _$ShippingStatusRecordSerializer
    implements StructuredSerializer<ShippingStatusRecord> {
  @override
  final Iterable<Type> types = const [
    ShippingStatusRecord,
    _$ShippingStatusRecord
  ];
  @override
  final String wireName = 'ShippingStatusRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ShippingStatusRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.statusName;
    if (value != null) {
      result
        ..add('status_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isActive;
    if (value != null) {
      result
        ..add('isActive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  ShippingStatusRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShippingStatusRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status_name':
          result.statusName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isActive':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$ShippingStatusRecord extends ShippingStatusRecord {
  @override
  final String? statusName;
  @override
  final bool? isActive;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ShippingStatusRecord(
          [void Function(ShippingStatusRecordBuilder)? updates]) =>
      (new ShippingStatusRecordBuilder()..update(updates))._build();

  _$ShippingStatusRecord._({this.statusName, this.isActive, this.ffRef})
      : super._();

  @override
  ShippingStatusRecord rebuild(
          void Function(ShippingStatusRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShippingStatusRecordBuilder toBuilder() =>
      new ShippingStatusRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShippingStatusRecord &&
        statusName == other.statusName &&
        isActive == other.isActive &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, statusName.hashCode), isActive.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShippingStatusRecord')
          ..add('statusName', statusName)
          ..add('isActive', isActive)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ShippingStatusRecordBuilder
    implements Builder<ShippingStatusRecord, ShippingStatusRecordBuilder> {
  _$ShippingStatusRecord? _$v;

  String? _statusName;
  String? get statusName => _$this._statusName;
  set statusName(String? statusName) => _$this._statusName = statusName;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ShippingStatusRecordBuilder() {
    ShippingStatusRecord._initializeBuilder(this);
  }

  ShippingStatusRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusName = $v.statusName;
      _isActive = $v.isActive;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShippingStatusRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShippingStatusRecord;
  }

  @override
  void update(void Function(ShippingStatusRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShippingStatusRecord build() => _build();

  _$ShippingStatusRecord _build() {
    final _$result = _$v ??
        new _$ShippingStatusRecord._(
            statusName: statusName, isActive: isActive, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
