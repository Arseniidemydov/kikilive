// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_no_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderNoRecord> _$orderNoRecordSerializer =
    new _$OrderNoRecordSerializer();

class _$OrderNoRecordSerializer implements StructuredSerializer<OrderNoRecord> {
  @override
  final Iterable<Type> types = const [OrderNoRecord, _$OrderNoRecord];
  @override
  final String wireName = 'OrderNoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderNoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderNo;
    if (value != null) {
      result
        ..add('orderNo')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  OrderNoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderNoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'orderNo':
          result.orderNo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$OrderNoRecord extends OrderNoRecord {
  @override
  final int? orderNo;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderNoRecord([void Function(OrderNoRecordBuilder)? updates]) =>
      (new OrderNoRecordBuilder()..update(updates))._build();

  _$OrderNoRecord._({this.orderNo, this.ffRef}) : super._();

  @override
  OrderNoRecord rebuild(void Function(OrderNoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderNoRecordBuilder toBuilder() => new OrderNoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderNoRecord &&
        orderNo == other.orderNo &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, orderNo.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderNoRecord')
          ..add('orderNo', orderNo)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderNoRecordBuilder
    implements Builder<OrderNoRecord, OrderNoRecordBuilder> {
  _$OrderNoRecord? _$v;

  int? _orderNo;
  int? get orderNo => _$this._orderNo;
  set orderNo(int? orderNo) => _$this._orderNo = orderNo;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderNoRecordBuilder() {
    OrderNoRecord._initializeBuilder(this);
  }

  OrderNoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderNo = $v.orderNo;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderNoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderNoRecord;
  }

  @override
  void update(void Function(OrderNoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderNoRecord build() => _build();

  _$OrderNoRecord _build() {
    final _$result =
        _$v ?? new _$OrderNoRecord._(orderNo: orderNo, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
