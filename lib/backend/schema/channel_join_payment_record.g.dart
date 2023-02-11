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
    value = object.joinAt;
    if (value != null) {
      result
        ..add('joinAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.channelRef;
    if (value != null) {
      result
        ..add('channelRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.paymentID;
    if (value != null) {
      result
        ..add('paymentID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pricePaid;
    if (value != null) {
      result
        ..add('PricePaid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
        case 'joinAt':
          result.joinAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'channelRef':
          result.channelRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'paymentID':
          result.paymentID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PricePaid':
          result.pricePaid = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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
  final DateTime? joinAt;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? channelRef;
  @override
  final String? paymentID;
  @override
  final double? pricePaid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChannelJoinPaymentRecord(
          [void Function(ChannelJoinPaymentRecordBuilder)? updates]) =>
      (new ChannelJoinPaymentRecordBuilder()..update(updates))._build();

  _$ChannelJoinPaymentRecord._(
      {this.joinAt,
      this.userRef,
      this.channelRef,
      this.paymentID,
      this.pricePaid,
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
        joinAt == other.joinAt &&
        userRef == other.userRef &&
        channelRef == other.channelRef &&
        paymentID == other.paymentID &&
        pricePaid == other.pricePaid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, joinAt.hashCode), userRef.hashCode),
                    channelRef.hashCode),
                paymentID.hashCode),
            pricePaid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChannelJoinPaymentRecord')
          ..add('joinAt', joinAt)
          ..add('userRef', userRef)
          ..add('channelRef', channelRef)
          ..add('paymentID', paymentID)
          ..add('pricePaid', pricePaid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChannelJoinPaymentRecordBuilder
    implements
        Builder<ChannelJoinPaymentRecord, ChannelJoinPaymentRecordBuilder> {
  _$ChannelJoinPaymentRecord? _$v;

  DateTime? _joinAt;
  DateTime? get joinAt => _$this._joinAt;
  set joinAt(DateTime? joinAt) => _$this._joinAt = joinAt;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _channelRef;
  DocumentReference<Object?>? get channelRef => _$this._channelRef;
  set channelRef(DocumentReference<Object?>? channelRef) =>
      _$this._channelRef = channelRef;

  String? _paymentID;
  String? get paymentID => _$this._paymentID;
  set paymentID(String? paymentID) => _$this._paymentID = paymentID;

  double? _pricePaid;
  double? get pricePaid => _$this._pricePaid;
  set pricePaid(double? pricePaid) => _$this._pricePaid = pricePaid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChannelJoinPaymentRecordBuilder() {
    ChannelJoinPaymentRecord._initializeBuilder(this);
  }

  ChannelJoinPaymentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _joinAt = $v.joinAt;
      _userRef = $v.userRef;
      _channelRef = $v.channelRef;
      _paymentID = $v.paymentID;
      _pricePaid = $v.pricePaid;
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
            joinAt: joinAt,
            userRef: userRef,
            channelRef: channelRef,
            paymentID: paymentID,
            pricePaid: pricePaid,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
