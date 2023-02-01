// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaxesRecord> _$taxesRecordSerializer = new _$TaxesRecordSerializer();

class _$TaxesRecordSerializer implements StructuredSerializer<TaxesRecord> {
  @override
  final Iterable<Type> types = const [TaxesRecord, _$TaxesRecord];
  @override
  final String wireName = 'TaxesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaxesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.taxName;
    if (value != null) {
      result
        ..add('tax_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taxValue;
    if (value != null) {
      result
        ..add('tax_value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
  TaxesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaxesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tax_name':
          result.taxName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tax_value':
          result.taxValue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$TaxesRecord extends TaxesRecord {
  @override
  final String? taxName;
  @override
  final double? taxValue;
  @override
  final bool? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaxesRecord([void Function(TaxesRecordBuilder)? updates]) =>
      (new TaxesRecordBuilder()..update(updates))._build();

  _$TaxesRecord._({this.taxName, this.taxValue, this.status, this.ffRef})
      : super._();

  @override
  TaxesRecord rebuild(void Function(TaxesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaxesRecordBuilder toBuilder() => new TaxesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaxesRecord &&
        taxName == other.taxName &&
        taxValue == other.taxValue &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, taxName.hashCode), taxValue.hashCode), status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaxesRecord')
          ..add('taxName', taxName)
          ..add('taxValue', taxValue)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaxesRecordBuilder implements Builder<TaxesRecord, TaxesRecordBuilder> {
  _$TaxesRecord? _$v;

  String? _taxName;
  String? get taxName => _$this._taxName;
  set taxName(String? taxName) => _$this._taxName = taxName;

  double? _taxValue;
  double? get taxValue => _$this._taxValue;
  set taxValue(double? taxValue) => _$this._taxValue = taxValue;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaxesRecordBuilder() {
    TaxesRecord._initializeBuilder(this);
  }

  TaxesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _taxName = $v.taxName;
      _taxValue = $v.taxValue;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaxesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaxesRecord;
  }

  @override
  void update(void Function(TaxesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaxesRecord build() => _build();

  _$TaxesRecord _build() {
    final _$result = _$v ??
        new _$TaxesRecord._(
            taxName: taxName, taxValue: taxValue, status: status, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
