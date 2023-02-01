// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_s_k_u_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GenerateSKURecord> _$generateSKURecordSerializer =
    new _$GenerateSKURecordSerializer();

class _$GenerateSKURecordSerializer
    implements StructuredSerializer<GenerateSKURecord> {
  @override
  final Iterable<Type> types = const [GenerateSKURecord, _$GenerateSKURecord];
  @override
  final String wireName = 'GenerateSKURecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GenerateSKURecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sku;
    if (value != null) {
      result
        ..add('SKU')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  GenerateSKURecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GenerateSKURecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'SKU':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$GenerateSKURecord extends GenerateSKURecord {
  @override
  final int? sku;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GenerateSKURecord(
          [void Function(GenerateSKURecordBuilder)? updates]) =>
      (new GenerateSKURecordBuilder()..update(updates))._build();

  _$GenerateSKURecord._({this.sku, this.ffRef}) : super._();

  @override
  GenerateSKURecord rebuild(void Function(GenerateSKURecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateSKURecordBuilder toBuilder() =>
      new GenerateSKURecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateSKURecord &&
        sku == other.sku &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sku.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenerateSKURecord')
          ..add('sku', sku)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GenerateSKURecordBuilder
    implements Builder<GenerateSKURecord, GenerateSKURecordBuilder> {
  _$GenerateSKURecord? _$v;

  int? _sku;
  int? get sku => _$this._sku;
  set sku(int? sku) => _$this._sku = sku;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GenerateSKURecordBuilder() {
    GenerateSKURecord._initializeBuilder(this);
  }

  GenerateSKURecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sku = $v.sku;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenerateSKURecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenerateSKURecord;
  }

  @override
  void update(void Function(GenerateSKURecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenerateSKURecord build() => _build();

  _$GenerateSKURecord _build() {
    final _$result = _$v ?? new _$GenerateSKURecord._(sku: sku, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
