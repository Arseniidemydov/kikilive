// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DepositRecord> _$depositRecordSerializer =
    new _$DepositRecordSerializer();

class _$DepositRecordSerializer implements StructuredSerializer<DepositRecord> {
  @override
  final Iterable<Type> types = const [DepositRecord, _$DepositRecord];
  @override
  final String wireName = 'DepositRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DepositRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.adminRef;
    if (value != null) {
      result
        ..add('adminRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.depositAmout;
    if (value != null) {
      result
        ..add('depositAmout')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.depositDate;
    if (value != null) {
      result
        ..add('depositDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.transactionID;
    if (value != null) {
      result
        ..add('transactionID')
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
  DepositRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DepositRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'adminRef':
          result.adminRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'depositAmout':
          result.depositAmout = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'depositDate':
          result.depositDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'transactionID':
          result.transactionID = serializers.deserialize(value,
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

class _$DepositRecord extends DepositRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? adminRef;
  @override
  final double? depositAmout;
  @override
  final DateTime? depositDate;
  @override
  final String? transactionID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DepositRecord([void Function(DepositRecordBuilder)? updates]) =>
      (new DepositRecordBuilder()..update(updates))._build();

  _$DepositRecord._(
      {this.userRef,
      this.adminRef,
      this.depositAmout,
      this.depositDate,
      this.transactionID,
      this.ffRef})
      : super._();

  @override
  DepositRecord rebuild(void Function(DepositRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DepositRecordBuilder toBuilder() => new DepositRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DepositRecord &&
        userRef == other.userRef &&
        adminRef == other.adminRef &&
        depositAmout == other.depositAmout &&
        depositDate == other.depositDate &&
        transactionID == other.transactionID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, userRef.hashCode), adminRef.hashCode),
                    depositAmout.hashCode),
                depositDate.hashCode),
            transactionID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DepositRecord')
          ..add('userRef', userRef)
          ..add('adminRef', adminRef)
          ..add('depositAmout', depositAmout)
          ..add('depositDate', depositDate)
          ..add('transactionID', transactionID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DepositRecordBuilder
    implements Builder<DepositRecord, DepositRecordBuilder> {
  _$DepositRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _adminRef;
  DocumentReference<Object?>? get adminRef => _$this._adminRef;
  set adminRef(DocumentReference<Object?>? adminRef) =>
      _$this._adminRef = adminRef;

  double? _depositAmout;
  double? get depositAmout => _$this._depositAmout;
  set depositAmout(double? depositAmout) => _$this._depositAmout = depositAmout;

  DateTime? _depositDate;
  DateTime? get depositDate => _$this._depositDate;
  set depositDate(DateTime? depositDate) => _$this._depositDate = depositDate;

  String? _transactionID;
  String? get transactionID => _$this._transactionID;
  set transactionID(String? transactionID) =>
      _$this._transactionID = transactionID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DepositRecordBuilder() {
    DepositRecord._initializeBuilder(this);
  }

  DepositRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _adminRef = $v.adminRef;
      _depositAmout = $v.depositAmout;
      _depositDate = $v.depositDate;
      _transactionID = $v.transactionID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DepositRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DepositRecord;
  }

  @override
  void update(void Function(DepositRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DepositRecord build() => _build();

  _$DepositRecord _build() {
    final _$result = _$v ??
        new _$DepositRecord._(
            userRef: userRef,
            adminRef: adminRef,
            depositAmout: depositAmout,
            depositDate: depositDate,
            transactionID: transactionID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
