// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CountryCodeRecord> _$countryCodeRecordSerializer =
    new _$CountryCodeRecordSerializer();

class _$CountryCodeRecordSerializer
    implements StructuredSerializer<CountryCodeRecord> {
  @override
  final Iterable<Type> types = const [CountryCodeRecord, _$CountryCodeRecord];
  @override
  final String wireName = 'CountryCodeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CountryCodeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.countryCode;
    if (value != null) {
      result
        ..add('country_code')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  CountryCodeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountryCodeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'country_code':
          result.countryCode.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$CountryCodeRecord extends CountryCodeRecord {
  @override
  final BuiltList<String>? countryCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CountryCodeRecord(
          [void Function(CountryCodeRecordBuilder)? updates]) =>
      (new CountryCodeRecordBuilder()..update(updates))._build();

  _$CountryCodeRecord._({this.countryCode, this.ffRef}) : super._();

  @override
  CountryCodeRecord rebuild(void Function(CountryCodeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountryCodeRecordBuilder toBuilder() =>
      new CountryCodeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountryCodeRecord &&
        countryCode == other.countryCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, countryCode.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CountryCodeRecord')
          ..add('countryCode', countryCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CountryCodeRecordBuilder
    implements Builder<CountryCodeRecord, CountryCodeRecordBuilder> {
  _$CountryCodeRecord? _$v;

  ListBuilder<String>? _countryCode;
  ListBuilder<String> get countryCode =>
      _$this._countryCode ??= new ListBuilder<String>();
  set countryCode(ListBuilder<String>? countryCode) =>
      _$this._countryCode = countryCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CountryCodeRecordBuilder() {
    CountryCodeRecord._initializeBuilder(this);
  }

  CountryCodeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _countryCode = $v.countryCode?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountryCodeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CountryCodeRecord;
  }

  @override
  void update(void Function(CountryCodeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CountryCodeRecord build() => _build();

  _$CountryCodeRecord _build() {
    _$CountryCodeRecord _$result;
    try {
      _$result = _$v ??
          new _$CountryCodeRecord._(
              countryCode: _countryCode?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'countryCode';
        _countryCode?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CountryCodeRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
