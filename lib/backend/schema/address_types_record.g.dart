// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_types_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddressTypesRecord> _$addressTypesRecordSerializer =
    new _$AddressTypesRecordSerializer();

class _$AddressTypesRecordSerializer
    implements StructuredSerializer<AddressTypesRecord> {
  @override
  final Iterable<Type> types = const [AddressTypesRecord, _$AddressTypesRecord];
  @override
  final String wireName = 'AddressTypesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AddressTypesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.addressName;
    if (value != null) {
      result
        ..add('address_name')
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
  AddressTypesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressTypesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address_name':
          result.addressName = serializers.deserialize(value,
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

class _$AddressTypesRecord extends AddressTypesRecord {
  @override
  final String? addressName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddressTypesRecord(
          [void Function(AddressTypesRecordBuilder)? updates]) =>
      (new AddressTypesRecordBuilder()..update(updates))._build();

  _$AddressTypesRecord._({this.addressName, this.ffRef}) : super._();

  @override
  AddressTypesRecord rebuild(
          void Function(AddressTypesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressTypesRecordBuilder toBuilder() =>
      new AddressTypesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressTypesRecord &&
        addressName == other.addressName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, addressName.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressTypesRecord')
          ..add('addressName', addressName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddressTypesRecordBuilder
    implements Builder<AddressTypesRecord, AddressTypesRecordBuilder> {
  _$AddressTypesRecord? _$v;

  String? _addressName;
  String? get addressName => _$this._addressName;
  set addressName(String? addressName) => _$this._addressName = addressName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddressTypesRecordBuilder() {
    AddressTypesRecord._initializeBuilder(this);
  }

  AddressTypesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressName = $v.addressName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressTypesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressTypesRecord;
  }

  @override
  void update(void Function(AddressTypesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressTypesRecord build() => _build();

  _$AddressTypesRecord _build() {
    final _$result = _$v ??
        new _$AddressTypesRecord._(addressName: addressName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
