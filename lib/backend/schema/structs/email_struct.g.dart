// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmailStruct> _$emailStructSerializer = new _$EmailStructSerializer();

class _$EmailStructSerializer implements StructuredSerializer<EmailStruct> {
  @override
  final Iterable<Type> types = const [EmailStruct, _$EmailStruct];
  @override
  final String wireName = 'EmailStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, EmailStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EmailStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmailStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$EmailStruct extends EmailStruct {
  @override
  final String? email;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$EmailStruct([void Function(EmailStructBuilder)? updates]) =>
      (new EmailStructBuilder()..update(updates))._build();

  _$EmailStruct._({this.email, required this.firestoreUtilData}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'EmailStruct', 'firestoreUtilData');
  }

  @override
  EmailStruct rebuild(void Function(EmailStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailStructBuilder toBuilder() => new EmailStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailStruct &&
        email == other.email &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmailStruct')
          ..add('email', email)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class EmailStructBuilder implements Builder<EmailStruct, EmailStructBuilder> {
  _$EmailStruct? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  EmailStructBuilder() {
    EmailStruct._initializeBuilder(this);
  }

  EmailStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmailStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmailStruct;
  }

  @override
  void update(void Function(EmailStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmailStruct build() => _build();

  _$EmailStruct _build() {
    final _$result = _$v ??
        new _$EmailStruct._(
            email: email,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'EmailStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
