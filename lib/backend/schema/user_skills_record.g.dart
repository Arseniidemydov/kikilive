// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_skills_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSkillsRecord> _$userSkillsRecordSerializer =
    new _$UserSkillsRecordSerializer();

class _$UserSkillsRecordSerializer
    implements StructuredSerializer<UserSkillsRecord> {
  @override
  final Iterable<Type> types = const [UserSkillsRecord, _$UserSkillsRecord];
  @override
  final String wireName = 'UserSkillsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserSkillsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.skillName;
    if (value != null) {
      result
        ..add('skill_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expertiseLevel;
    if (value != null) {
      result
        ..add('expertise_level')
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
  UserSkillsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSkillsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skill_name':
          result.skillName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expertise_level':
          result.expertiseLevel.replace(serializers.deserialize(value,
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

class _$UserSkillsRecord extends UserSkillsRecord {
  @override
  final String? skillName;
  @override
  final BuiltList<String>? expertiseLevel;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserSkillsRecord(
          [void Function(UserSkillsRecordBuilder)? updates]) =>
      (new UserSkillsRecordBuilder()..update(updates))._build();

  _$UserSkillsRecord._({this.skillName, this.expertiseLevel, this.ffRef})
      : super._();

  @override
  UserSkillsRecord rebuild(void Function(UserSkillsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSkillsRecordBuilder toBuilder() =>
      new UserSkillsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSkillsRecord &&
        skillName == other.skillName &&
        expertiseLevel == other.expertiseLevel &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, skillName.hashCode), expertiseLevel.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSkillsRecord')
          ..add('skillName', skillName)
          ..add('expertiseLevel', expertiseLevel)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserSkillsRecordBuilder
    implements Builder<UserSkillsRecord, UserSkillsRecordBuilder> {
  _$UserSkillsRecord? _$v;

  String? _skillName;
  String? get skillName => _$this._skillName;
  set skillName(String? skillName) => _$this._skillName = skillName;

  ListBuilder<String>? _expertiseLevel;
  ListBuilder<String> get expertiseLevel =>
      _$this._expertiseLevel ??= new ListBuilder<String>();
  set expertiseLevel(ListBuilder<String>? expertiseLevel) =>
      _$this._expertiseLevel = expertiseLevel;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserSkillsRecordBuilder() {
    UserSkillsRecord._initializeBuilder(this);
  }

  UserSkillsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skillName = $v.skillName;
      _expertiseLevel = $v.expertiseLevel?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSkillsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSkillsRecord;
  }

  @override
  void update(void Function(UserSkillsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSkillsRecord build() => _build();

  _$UserSkillsRecord _build() {
    _$UserSkillsRecord _$result;
    try {
      _$result = _$v ??
          new _$UserSkillsRecord._(
              skillName: skillName,
              expertiseLevel: _expertiseLevel?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expertiseLevel';
        _expertiseLevel?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserSkillsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
