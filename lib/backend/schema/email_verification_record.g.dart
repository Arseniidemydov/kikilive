// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EmailVerificationRecord> _$emailVerificationRecordSerializer =
    new _$EmailVerificationRecordSerializer();

class _$EmailVerificationRecordSerializer
    implements StructuredSerializer<EmailVerificationRecord> {
  @override
  final Iterable<Type> types = const [
    EmailVerificationRecord,
    _$EmailVerificationRecord
  ];
  @override
  final String wireName = 'EmailVerificationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EmailVerificationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.toEmail;
    if (value != null) {
      result
        ..add('toEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('subject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
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
  EmailVerificationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmailVerificationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'toEmail':
          result.toEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
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

class _$EmailVerificationRecord extends EmailVerificationRecord {
  @override
  final String? toEmail;
  @override
  final String? subject;
  @override
  final String? content;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EmailVerificationRecord(
          [void Function(EmailVerificationRecordBuilder)? updates]) =>
      (new EmailVerificationRecordBuilder()..update(updates))._build();

  _$EmailVerificationRecord._(
      {this.toEmail, this.subject, this.content, this.ffRef})
      : super._();

  @override
  EmailVerificationRecord rebuild(
          void Function(EmailVerificationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailVerificationRecordBuilder toBuilder() =>
      new EmailVerificationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailVerificationRecord &&
        toEmail == other.toEmail &&
        subject == other.subject &&
        content == other.content &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, toEmail.hashCode), subject.hashCode), content.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EmailVerificationRecord')
          ..add('toEmail', toEmail)
          ..add('subject', subject)
          ..add('content', content)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EmailVerificationRecordBuilder
    implements
        Builder<EmailVerificationRecord, EmailVerificationRecordBuilder> {
  _$EmailVerificationRecord? _$v;

  String? _toEmail;
  String? get toEmail => _$this._toEmail;
  set toEmail(String? toEmail) => _$this._toEmail = toEmail;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EmailVerificationRecordBuilder() {
    EmailVerificationRecord._initializeBuilder(this);
  }

  EmailVerificationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _toEmail = $v.toEmail;
      _subject = $v.subject;
      _content = $v.content;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmailVerificationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EmailVerificationRecord;
  }

  @override
  void update(void Function(EmailVerificationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EmailVerificationRecord build() => _build();

  _$EmailVerificationRecord _build() {
    final _$result = _$v ??
        new _$EmailVerificationRecord._(
            toEmail: toEmail, subject: subject, content: content, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
