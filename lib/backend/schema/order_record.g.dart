// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderRecord> _$orderRecordSerializer = new _$OrderRecordSerializer();

class _$OrderRecordSerializer implements StructuredSerializer<OrderRecord> {
  @override
  final Iterable<Type> types = const [OrderRecord, _$OrderRecord];
  @override
  final String wireName = 'OrderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderDate;
    if (value != null) {
      result
        ..add('order_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orderSellerReference;
    if (value != null) {
      result
        ..add('order_seller_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderShippingNumber;
    if (value != null) {
      result
        ..add('order_shipping_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderShippingCompany;
    if (value != null) {
      result
        ..add('order_shipping_company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderProductReference;
    if (value != null) {
      result
        ..add('order_product_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderStatus;
    if (value != null) {
      result
        ..add('order_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderUserReference;
    if (value != null) {
      result
        ..add('order_user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderListReference;
    if (value != null) {
      result
        ..add('order_list_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderFromListNumber;
    if (value != null) {
      result
        ..add('order_from_list_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.orderProductPrice;
    if (value != null) {
      result
        ..add('order_product_price')
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
  OrderRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'order_date':
          result.orderDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'order_seller_reference':
          result.orderSellerReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_shipping_number':
          result.orderShippingNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_shipping_company':
          result.orderShippingCompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_product_reference':
          result.orderProductReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_status':
          result.orderStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_user_reference':
          result.orderUserReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_list_reference':
          result.orderListReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_from_list_number':
          result.orderFromListNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'order_product_price':
          result.orderProductPrice = serializers.deserialize(value,
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

class _$OrderRecord extends OrderRecord {
  @override
  final DateTime? orderDate;
  @override
  final DocumentReference<Object?>? orderSellerReference;
  @override
  final String? orderShippingNumber;
  @override
  final String? orderShippingCompany;
  @override
  final DocumentReference<Object?>? orderProductReference;
  @override
  final String? orderStatus;
  @override
  final DocumentReference<Object?>? orderUserReference;
  @override
  final DocumentReference<Object?>? orderListReference;
  @override
  final int? orderFromListNumber;
  @override
  final double? orderProductPrice;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderRecord([void Function(OrderRecordBuilder)? updates]) =>
      (new OrderRecordBuilder()..update(updates))._build();

  _$OrderRecord._(
      {this.orderDate,
      this.orderSellerReference,
      this.orderShippingNumber,
      this.orderShippingCompany,
      this.orderProductReference,
      this.orderStatus,
      this.orderUserReference,
      this.orderListReference,
      this.orderFromListNumber,
      this.orderProductPrice,
      this.ffRef})
      : super._();

  @override
  OrderRecord rebuild(void Function(OrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRecordBuilder toBuilder() => new OrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRecord &&
        orderDate == other.orderDate &&
        orderSellerReference == other.orderSellerReference &&
        orderShippingNumber == other.orderShippingNumber &&
        orderShippingCompany == other.orderShippingCompany &&
        orderProductReference == other.orderProductReference &&
        orderStatus == other.orderStatus &&
        orderUserReference == other.orderUserReference &&
        orderListReference == other.orderListReference &&
        orderFromListNumber == other.orderFromListNumber &&
        orderProductPrice == other.orderProductPrice &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, orderDate.hashCode),
                                            orderSellerReference.hashCode),
                                        orderShippingNumber.hashCode),
                                    orderShippingCompany.hashCode),
                                orderProductReference.hashCode),
                            orderStatus.hashCode),
                        orderUserReference.hashCode),
                    orderListReference.hashCode),
                orderFromListNumber.hashCode),
            orderProductPrice.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderRecord')
          ..add('orderDate', orderDate)
          ..add('orderSellerReference', orderSellerReference)
          ..add('orderShippingNumber', orderShippingNumber)
          ..add('orderShippingCompany', orderShippingCompany)
          ..add('orderProductReference', orderProductReference)
          ..add('orderStatus', orderStatus)
          ..add('orderUserReference', orderUserReference)
          ..add('orderListReference', orderListReference)
          ..add('orderFromListNumber', orderFromListNumber)
          ..add('orderProductPrice', orderProductPrice)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderRecordBuilder implements Builder<OrderRecord, OrderRecordBuilder> {
  _$OrderRecord? _$v;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  DocumentReference<Object?>? _orderSellerReference;
  DocumentReference<Object?>? get orderSellerReference =>
      _$this._orderSellerReference;
  set orderSellerReference(DocumentReference<Object?>? orderSellerReference) =>
      _$this._orderSellerReference = orderSellerReference;

  String? _orderShippingNumber;
  String? get orderShippingNumber => _$this._orderShippingNumber;
  set orderShippingNumber(String? orderShippingNumber) =>
      _$this._orderShippingNumber = orderShippingNumber;

  String? _orderShippingCompany;
  String? get orderShippingCompany => _$this._orderShippingCompany;
  set orderShippingCompany(String? orderShippingCompany) =>
      _$this._orderShippingCompany = orderShippingCompany;

  DocumentReference<Object?>? _orderProductReference;
  DocumentReference<Object?>? get orderProductReference =>
      _$this._orderProductReference;
  set orderProductReference(
          DocumentReference<Object?>? orderProductReference) =>
      _$this._orderProductReference = orderProductReference;

  String? _orderStatus;
  String? get orderStatus => _$this._orderStatus;
  set orderStatus(String? orderStatus) => _$this._orderStatus = orderStatus;

  DocumentReference<Object?>? _orderUserReference;
  DocumentReference<Object?>? get orderUserReference =>
      _$this._orderUserReference;
  set orderUserReference(DocumentReference<Object?>? orderUserReference) =>
      _$this._orderUserReference = orderUserReference;

  DocumentReference<Object?>? _orderListReference;
  DocumentReference<Object?>? get orderListReference =>
      _$this._orderListReference;
  set orderListReference(DocumentReference<Object?>? orderListReference) =>
      _$this._orderListReference = orderListReference;

  int? _orderFromListNumber;
  int? get orderFromListNumber => _$this._orderFromListNumber;
  set orderFromListNumber(int? orderFromListNumber) =>
      _$this._orderFromListNumber = orderFromListNumber;

  double? _orderProductPrice;
  double? get orderProductPrice => _$this._orderProductPrice;
  set orderProductPrice(double? orderProductPrice) =>
      _$this._orderProductPrice = orderProductPrice;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderRecordBuilder() {
    OrderRecord._initializeBuilder(this);
  }

  OrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderDate = $v.orderDate;
      _orderSellerReference = $v.orderSellerReference;
      _orderShippingNumber = $v.orderShippingNumber;
      _orderShippingCompany = $v.orderShippingCompany;
      _orderProductReference = $v.orderProductReference;
      _orderStatus = $v.orderStatus;
      _orderUserReference = $v.orderUserReference;
      _orderListReference = $v.orderListReference;
      _orderFromListNumber = $v.orderFromListNumber;
      _orderProductPrice = $v.orderProductPrice;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderRecord;
  }

  @override
  void update(void Function(OrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderRecord build() => _build();

  _$OrderRecord _build() {
    final _$result = _$v ??
        new _$OrderRecord._(
            orderDate: orderDate,
            orderSellerReference: orderSellerReference,
            orderShippingNumber: orderShippingNumber,
            orderShippingCompany: orderShippingCompany,
            orderProductReference: orderProductReference,
            orderStatus: orderStatus,
            orderUserReference: orderUserReference,
            orderListReference: orderListReference,
            orderFromListNumber: orderFromListNumber,
            orderProductPrice: orderProductPrice,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
