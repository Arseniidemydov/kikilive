// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_join_payment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChannelJoinPaymentRecord> _$channelJoinPaymentRecordSerializer =
    new _$ChannelJoinPaymentRecordSerializer();

class _$ChannelJoinPaymentRecordSerializer
    implements StructuredSerializer<ChannelJoinPaymentRecord> {
  @override
  final Iterable<Type> types = const [
    ChannelJoinPaymentRecord,
    _$ChannelJoinPaymentRecord
  ];
  @override
  final String wireName = 'ChannelJoinPaymentRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChannelJoinPaymentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.channelJoinAt;
    if (value != null) {
      result
        ..add('channel_join_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.channelJoinUserReference;
    if (value != null) {
      result
        ..add('channel_join_user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.channelJoinReference;
    if (value != null) {
      result
        ..add('channel_join_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.channelJoinPaymentId;
    if (value != null) {
      result
        ..add('channel_join_payment_id')
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
  ChannelJoinPaymentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChannelJoinPaymentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'channel_join_at':
          result.channelJoinAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'channel_join_user_reference':
          result.channelJoinUserReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'channel_join_reference':
          result.channelJoinReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'channel_join_payment_id':
          result.channelJoinPaymentId = serializers.deserialize(value,
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

class _$ChannelJoinPaymentRecord extends ChannelJoinPaymentRecord {
  @override
  final DateTime? channelJoinAt;
  @override
  final DocumentReference<Object?>? channelJoinUserReference;
  @override
  final DocumentReference<Object?>? channelJoinReference;
  @override
  final String? channelJoinPaymentId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChannelJoinPaymentRecord(
          [void Function(ChannelJoinPaymentRecordBuilder)? updates]) =>
      (new ChannelJoinPaymentRecordBuilder()..update(updates))._build();

  _$ChannelJoinPaymentRecord._(
      {this.channelJoinAt,
      this.channelJoinUserReference,
      this.channelJoinReference,
      this.channelJoinPaymentId,
      this.ffRef})
      : super._();

  @override
  ChannelJoinPaymentRecord rebuild(
          void Function(ChannelJoinPaymentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelJoinPaymentRecordBuilder toBuilder() =>
      new ChannelJoinPaymentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelJoinPaymentRecord &&
        channelJoinAt == other.channelJoinAt &&
        channelJoinUserReference == other.channelJoinUserReference &&
        channelJoinReference == other.channelJoinReference &&
        channelJoinPaymentId == other.channelJoinPaymentId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc(0, channelJoinAt.hashCode),
                    channelJoinUserReference.hashCode),
                channelJoinReference.hashCode),
            channelJoinPaymentId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChannelJoinPaymentRecord')
          ..add('channelJoinAt', channelJoinAt)
          ..add('channelJoinUserReference', channelJoinUserReference)
          ..add('channelJoinReference', channelJoinReference)
          ..add('channelJoinPaymentId', channelJoinPaymentId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChannelJoinPaymentRecordBuilder
    implements
        Builder<ChannelJoinPaymentRecord, ChannelJoinPaymentRecordBuilder> {
  _$ChannelJoinPaymentRecord? _$v;

  DateTime? _channelJoinAt;
  DateTime? get channelJoinAt => _$this._channelJoinAt;
  set channelJoinAt(DateTime? channelJoinAt) =>
      _$this._channelJoinAt = channelJoinAt;

  DocumentReference<Object?>? _channelJoinUserReference;
  DocumentReference<Object?>? get channelJoinUserReference =>
      _$this._channelJoinUserReference;
  set channelJoinUserReference(
          DocumentReference<Object?>? channelJoinUserReference) =>
      _$this._channelJoinUserReference = channelJoinUserReference;

  DocumentReference<Object?>? _channelJoinReference;
  DocumentReference<Object?>? get channelJoinReference =>
      _$this._channelJoinReference;
  set channelJoinReference(DocumentReference<Object?>? channelJoinReference) =>
      _$this._channelJoinReference = channelJoinReference;

  String? _channelJoinPaymentId;
  String? get channelJoinPaymentId => _$this._channelJoinPaymentId;
  set channelJoinPaymentId(String? channelJoinPaymentId) =>
      _$this._channelJoinPaymentId = channelJoinPaymentId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChannelJoinPaymentRecordBuilder() {
    ChannelJoinPaymentRecord._initializeBuilder(this);
  }

  ChannelJoinPaymentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _channelJoinAt = $v.channelJoinAt;
      _channelJoinUserReference = $v.channelJoinUserReference;
      _channelJoinReference = $v.channelJoinReference;
      _channelJoinPaymentId = $v.channelJoinPaymentId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelJoinPaymentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChannelJoinPaymentRecord;
  }

  @override
  void update(void Function(ChannelJoinPaymentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChannelJoinPaymentRecord build() => _build();

  _$ChannelJoinPaymentRecord _build() {
    final _$result = _$v ??
        new _$ChannelJoinPaymentRecord._(
            channelJoinAt: channelJoinAt,
            channelJoinUserReference: channelJoinUserReference,
            channelJoinReference: channelJoinReference,
            channelJoinPaymentId: channelJoinPaymentId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
