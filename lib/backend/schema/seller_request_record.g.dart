// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_request_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SellerRequestRecord> _$sellerRequestRecordSerializer =
    new _$SellerRequestRecordSerializer();

class _$SellerRequestRecordSerializer
    implements StructuredSerializer<SellerRequestRecord> {
  @override
  final Iterable<Type> types = const [
    SellerRequestRecord,
    _$SellerRequestRecord
  ];
  @override
  final String wireName = 'SellerRequestRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SellerRequestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.requestUserReference;
    if (value != null) {
      result
        ..add('request_user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.requestUserName;
    if (value != null) {
      result
        ..add('request_user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requestStatus;
    if (value != null) {
      result
        ..add('request_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requestMessage;
    if (value != null) {
      result
        ..add('request_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  SellerRequestRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SellerRequestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'request_user_reference':
          result.requestUserReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'request_user_name':
          result.requestUserName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'request_status':
          result.requestStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'request_message':
          result.requestMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$SellerRequestRecord extends SellerRequestRecord {
  @override
  final DocumentReference<Object?>? requestUserReference;
  @override
  final String? requestUserName;
  @override
  final String? requestStatus;
  @override
  final String? requestMessage;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SellerRequestRecord(
          [void Function(SellerRequestRecordBuilder)? updates]) =>
      (new SellerRequestRecordBuilder()..update(updates))._build();

  _$SellerRequestRecord._(
      {this.requestUserReference,
      this.requestUserName,
      this.requestStatus,
      this.requestMessage,
      this.createdAt,
      this.ffRef})
      : super._();

  @override
  SellerRequestRecord rebuild(
          void Function(SellerRequestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SellerRequestRecordBuilder toBuilder() =>
      new SellerRequestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SellerRequestRecord &&
        requestUserReference == other.requestUserReference &&
        requestUserName == other.requestUserName &&
        requestStatus == other.requestStatus &&
        requestMessage == other.requestMessage &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, requestUserReference.hashCode),
                        requestUserName.hashCode),
                    requestStatus.hashCode),
                requestMessage.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SellerRequestRecord')
          ..add('requestUserReference', requestUserReference)
          ..add('requestUserName', requestUserName)
          ..add('requestStatus', requestStatus)
          ..add('requestMessage', requestMessage)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SellerRequestRecordBuilder
    implements Builder<SellerRequestRecord, SellerRequestRecordBuilder> {
  _$SellerRequestRecord? _$v;

  DocumentReference<Object?>? _requestUserReference;
  DocumentReference<Object?>? get requestUserReference =>
      _$this._requestUserReference;
  set requestUserReference(DocumentReference<Object?>? requestUserReference) =>
      _$this._requestUserReference = requestUserReference;

  String? _requestUserName;
  String? get requestUserName => _$this._requestUserName;
  set requestUserName(String? requestUserName) =>
      _$this._requestUserName = requestUserName;

  String? _requestStatus;
  String? get requestStatus => _$this._requestStatus;
  set requestStatus(String? requestStatus) =>
      _$this._requestStatus = requestStatus;

  String? _requestMessage;
  String? get requestMessage => _$this._requestMessage;
  set requestMessage(String? requestMessage) =>
      _$this._requestMessage = requestMessage;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SellerRequestRecordBuilder() {
    SellerRequestRecord._initializeBuilder(this);
  }

  SellerRequestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestUserReference = $v.requestUserReference;
      _requestUserName = $v.requestUserName;
      _requestStatus = $v.requestStatus;
      _requestMessage = $v.requestMessage;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SellerRequestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SellerRequestRecord;
  }

  @override
  void update(void Function(SellerRequestRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SellerRequestRecord build() => _build();

  _$SellerRequestRecord _build() {
    final _$result = _$v ??
        new _$SellerRequestRecord._(
            requestUserReference: requestUserReference,
            requestUserName: requestUserName,
            requestStatus: requestStatus,
            requestMessage: requestMessage,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
