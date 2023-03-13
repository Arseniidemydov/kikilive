// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposits_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DepositsRecord> _$depositsRecordSerializer =
    new _$DepositsRecordSerializer();

class _$DepositsRecordSerializer
    implements StructuredSerializer<DepositsRecord> {
  @override
  final Iterable<Type> types = const [DepositsRecord, _$DepositsRecord];
  @override
  final String wireName = 'DepositsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DepositsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.depositSellerReference;
    if (value != null) {
      result
        ..add('deposit_seller_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.depositAdminReference;
    if (value != null) {
      result
        ..add('deposit_admin_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.depositAmount;
    if (value != null) {
      result
        ..add('deposit_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.depositTransactionId;
    if (value != null) {
      result
        ..add('deposit_transaction_id')
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
  DepositsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DepositsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'deposit_seller_reference':
          result.depositSellerReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'deposit_admin_reference':
          result.depositAdminReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'deposit_amount':
          result.depositAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'deposit_transaction_id':
          result.depositTransactionId = serializers.deserialize(value,
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

class _$DepositsRecord extends DepositsRecord {
  @override
  final DocumentReference<Object?>? depositSellerReference;
  @override
  final DocumentReference<Object?>? depositAdminReference;
  @override
  final double? depositAmount;
  @override
  final String? depositTransactionId;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DepositsRecord([void Function(DepositsRecordBuilder)? updates]) =>
      (new DepositsRecordBuilder()..update(updates))._build();

  _$DepositsRecord._(
      {this.depositSellerReference,
      this.depositAdminReference,
      this.depositAmount,
      this.depositTransactionId,
      this.createdAt,
      this.ffRef})
      : super._();

  @override
  DepositsRecord rebuild(void Function(DepositsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DepositsRecordBuilder toBuilder() =>
      new DepositsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DepositsRecord &&
        depositSellerReference == other.depositSellerReference &&
        depositAdminReference == other.depositAdminReference &&
        depositAmount == other.depositAmount &&
        depositTransactionId == other.depositTransactionId &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, depositSellerReference.hashCode),
                        depositAdminReference.hashCode),
                    depositAmount.hashCode),
                depositTransactionId.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DepositsRecord')
          ..add('depositSellerReference', depositSellerReference)
          ..add('depositAdminReference', depositAdminReference)
          ..add('depositAmount', depositAmount)
          ..add('depositTransactionId', depositTransactionId)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DepositsRecordBuilder
    implements Builder<DepositsRecord, DepositsRecordBuilder> {
  _$DepositsRecord? _$v;

  DocumentReference<Object?>? _depositSellerReference;
  DocumentReference<Object?>? get depositSellerReference =>
      _$this._depositSellerReference;
  set depositSellerReference(
          DocumentReference<Object?>? depositSellerReference) =>
      _$this._depositSellerReference = depositSellerReference;

  DocumentReference<Object?>? _depositAdminReference;
  DocumentReference<Object?>? get depositAdminReference =>
      _$this._depositAdminReference;
  set depositAdminReference(
          DocumentReference<Object?>? depositAdminReference) =>
      _$this._depositAdminReference = depositAdminReference;

  double? _depositAmount;
  double? get depositAmount => _$this._depositAmount;
  set depositAmount(double? depositAmount) =>
      _$this._depositAmount = depositAmount;

  String? _depositTransactionId;
  String? get depositTransactionId => _$this._depositTransactionId;
  set depositTransactionId(String? depositTransactionId) =>
      _$this._depositTransactionId = depositTransactionId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DepositsRecordBuilder() {
    DepositsRecord._initializeBuilder(this);
  }

  DepositsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _depositSellerReference = $v.depositSellerReference;
      _depositAdminReference = $v.depositAdminReference;
      _depositAmount = $v.depositAmount;
      _depositTransactionId = $v.depositTransactionId;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DepositsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DepositsRecord;
  }

  @override
  void update(void Function(DepositsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DepositsRecord build() => _build();

  _$DepositsRecord _build() {
    final _$result = _$v ??
        new _$DepositsRecord._(
            depositSellerReference: depositSellerReference,
            depositAdminReference: depositAdminReference,
            depositAmount: depositAmount,
            depositTransactionId: depositTransactionId,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
