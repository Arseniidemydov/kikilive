// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderListRecord> _$orderListRecordSerializer =
    new _$OrderListRecordSerializer();

class _$OrderListRecordSerializer
    implements StructuredSerializer<OrderListRecord> {
  @override
  final Iterable<Type> types = const [OrderListRecord, _$OrderListRecord];
  @override
  final String wireName = 'OrderListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderListNumber;
    if (value != null) {
      result
        ..add('order_list_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.orderListDate;
    if (value != null) {
      result
        ..add('order_list_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orderListTotal;
    if (value != null) {
      result
        ..add('order_list_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.orderListUserReference;
    if (value != null) {
      result
        ..add('order_list_user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderListAddressReference;
    if (value != null) {
      result
        ..add('order_list_address_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderListProductList;
    if (value != null) {
      result
        ..add('order_list_product_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.orderListProductListUnique;
    if (value != null) {
      result
        ..add('order_list_product_list_unique')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.orderListShippingTotal;
    if (value != null) {
      result
        ..add('order_list_shipping_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.orderListPaymentId;
    if (value != null) {
      result
        ..add('order_list_payment_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderListSellerReference;
    if (value != null) {
      result
        ..add('order_list_seller_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.orderListIsPaid;
    if (value != null) {
      result
        ..add('order_list_is_paid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  OrderListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'order_list_number':
          result.orderListNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'order_list_date':
          result.orderListDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'order_list_total':
          result.orderListTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'order_list_user_reference':
          result.orderListUserReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_list_address_reference':
          result.orderListAddressReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_list_product_list':
          result.orderListProductList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'order_list_product_list_unique':
          result.orderListProductListUnique
              .replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(DocumentReference,
                        const [const FullType.nullable(Object)])
                  ]))! as BuiltList<Object?>);
          break;
        case 'order_list_shipping_total':
          result.orderListShippingTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'order_list_payment_id':
          result.orderListPaymentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_list_seller_reference':
          result.orderListSellerReference.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'order_list_is_paid':
          result.orderListIsPaid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$OrderListRecord extends OrderListRecord {
  @override
  final int? orderListNumber;
  @override
  final DateTime? orderListDate;
  @override
  final double? orderListTotal;
  @override
  final DocumentReference<Object?>? orderListUserReference;
  @override
  final DocumentReference<Object?>? orderListAddressReference;
  @override
  final BuiltList<DocumentReference<Object?>>? orderListProductList;
  @override
  final BuiltList<DocumentReference<Object?>>? orderListProductListUnique;
  @override
  final double? orderListShippingTotal;
  @override
  final String? orderListPaymentId;
  @override
  final BuiltList<DocumentReference<Object?>>? orderListSellerReference;
  @override
  final bool? orderListIsPaid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderListRecord([void Function(OrderListRecordBuilder)? updates]) =>
      (new OrderListRecordBuilder()..update(updates))._build();

  _$OrderListRecord._(
      {this.orderListNumber,
      this.orderListDate,
      this.orderListTotal,
      this.orderListUserReference,
      this.orderListAddressReference,
      this.orderListProductList,
      this.orderListProductListUnique,
      this.orderListShippingTotal,
      this.orderListPaymentId,
      this.orderListSellerReference,
      this.orderListIsPaid,
      this.ffRef})
      : super._();

  @override
  OrderListRecord rebuild(void Function(OrderListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderListRecordBuilder toBuilder() =>
      new OrderListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderListRecord &&
        orderListNumber == other.orderListNumber &&
        orderListDate == other.orderListDate &&
        orderListTotal == other.orderListTotal &&
        orderListUserReference == other.orderListUserReference &&
        orderListAddressReference == other.orderListAddressReference &&
        orderListProductList == other.orderListProductList &&
        orderListProductListUnique == other.orderListProductListUnique &&
        orderListShippingTotal == other.orderListShippingTotal &&
        orderListPaymentId == other.orderListPaymentId &&
        orderListSellerReference == other.orderListSellerReference &&
        orderListIsPaid == other.orderListIsPaid &&
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
                                        $jc(
                                            $jc(
                                                $jc(0,
                                                    orderListNumber.hashCode),
                                                orderListDate.hashCode),
                                            orderListTotal.hashCode),
                                        orderListUserReference.hashCode),
                                    orderListAddressReference.hashCode),
                                orderListProductList.hashCode),
                            orderListProductListUnique.hashCode),
                        orderListShippingTotal.hashCode),
                    orderListPaymentId.hashCode),
                orderListSellerReference.hashCode),
            orderListIsPaid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderListRecord')
          ..add('orderListNumber', orderListNumber)
          ..add('orderListDate', orderListDate)
          ..add('orderListTotal', orderListTotal)
          ..add('orderListUserReference', orderListUserReference)
          ..add('orderListAddressReference', orderListAddressReference)
          ..add('orderListProductList', orderListProductList)
          ..add('orderListProductListUnique', orderListProductListUnique)
          ..add('orderListShippingTotal', orderListShippingTotal)
          ..add('orderListPaymentId', orderListPaymentId)
          ..add('orderListSellerReference', orderListSellerReference)
          ..add('orderListIsPaid', orderListIsPaid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderListRecordBuilder
    implements Builder<OrderListRecord, OrderListRecordBuilder> {
  _$OrderListRecord? _$v;

  int? _orderListNumber;
  int? get orderListNumber => _$this._orderListNumber;
  set orderListNumber(int? orderListNumber) =>
      _$this._orderListNumber = orderListNumber;

  DateTime? _orderListDate;
  DateTime? get orderListDate => _$this._orderListDate;
  set orderListDate(DateTime? orderListDate) =>
      _$this._orderListDate = orderListDate;

  double? _orderListTotal;
  double? get orderListTotal => _$this._orderListTotal;
  set orderListTotal(double? orderListTotal) =>
      _$this._orderListTotal = orderListTotal;

  DocumentReference<Object?>? _orderListUserReference;
  DocumentReference<Object?>? get orderListUserReference =>
      _$this._orderListUserReference;
  set orderListUserReference(
          DocumentReference<Object?>? orderListUserReference) =>
      _$this._orderListUserReference = orderListUserReference;

  DocumentReference<Object?>? _orderListAddressReference;
  DocumentReference<Object?>? get orderListAddressReference =>
      _$this._orderListAddressReference;
  set orderListAddressReference(
          DocumentReference<Object?>? orderListAddressReference) =>
      _$this._orderListAddressReference = orderListAddressReference;

  ListBuilder<DocumentReference<Object?>>? _orderListProductList;
  ListBuilder<DocumentReference<Object?>> get orderListProductList =>
      _$this._orderListProductList ??=
          new ListBuilder<DocumentReference<Object?>>();
  set orderListProductList(
          ListBuilder<DocumentReference<Object?>>? orderListProductList) =>
      _$this._orderListProductList = orderListProductList;

  ListBuilder<DocumentReference<Object?>>? _orderListProductListUnique;
  ListBuilder<DocumentReference<Object?>> get orderListProductListUnique =>
      _$this._orderListProductListUnique ??=
          new ListBuilder<DocumentReference<Object?>>();
  set orderListProductListUnique(
          ListBuilder<DocumentReference<Object?>>?
              orderListProductListUnique) =>
      _$this._orderListProductListUnique = orderListProductListUnique;

  double? _orderListShippingTotal;
  double? get orderListShippingTotal => _$this._orderListShippingTotal;
  set orderListShippingTotal(double? orderListShippingTotal) =>
      _$this._orderListShippingTotal = orderListShippingTotal;

  String? _orderListPaymentId;
  String? get orderListPaymentId => _$this._orderListPaymentId;
  set orderListPaymentId(String? orderListPaymentId) =>
      _$this._orderListPaymentId = orderListPaymentId;

  ListBuilder<DocumentReference<Object?>>? _orderListSellerReference;
  ListBuilder<DocumentReference<Object?>> get orderListSellerReference =>
      _$this._orderListSellerReference ??=
          new ListBuilder<DocumentReference<Object?>>();
  set orderListSellerReference(
          ListBuilder<DocumentReference<Object?>>? orderListSellerReference) =>
      _$this._orderListSellerReference = orderListSellerReference;

  bool? _orderListIsPaid;
  bool? get orderListIsPaid => _$this._orderListIsPaid;
  set orderListIsPaid(bool? orderListIsPaid) =>
      _$this._orderListIsPaid = orderListIsPaid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderListRecordBuilder() {
    OrderListRecord._initializeBuilder(this);
  }

  OrderListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderListNumber = $v.orderListNumber;
      _orderListDate = $v.orderListDate;
      _orderListTotal = $v.orderListTotal;
      _orderListUserReference = $v.orderListUserReference;
      _orderListAddressReference = $v.orderListAddressReference;
      _orderListProductList = $v.orderListProductList?.toBuilder();
      _orderListProductListUnique = $v.orderListProductListUnique?.toBuilder();
      _orderListShippingTotal = $v.orderListShippingTotal;
      _orderListPaymentId = $v.orderListPaymentId;
      _orderListSellerReference = $v.orderListSellerReference?.toBuilder();
      _orderListIsPaid = $v.orderListIsPaid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderListRecord;
  }

  @override
  void update(void Function(OrderListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderListRecord build() => _build();

  _$OrderListRecord _build() {
    _$OrderListRecord _$result;
    try {
      _$result = _$v ??
          new _$OrderListRecord._(
              orderListNumber: orderListNumber,
              orderListDate: orderListDate,
              orderListTotal: orderListTotal,
              orderListUserReference: orderListUserReference,
              orderListAddressReference: orderListAddressReference,
              orderListProductList: _orderListProductList?.build(),
              orderListProductListUnique: _orderListProductListUnique?.build(),
              orderListShippingTotal: orderListShippingTotal,
              orderListPaymentId: orderListPaymentId,
              orderListSellerReference: _orderListSellerReference?.build(),
              orderListIsPaid: orderListIsPaid,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderListProductList';
        _orderListProductList?.build();
        _$failedField = 'orderListProductListUnique';
        _orderListProductListUnique?.build();

        _$failedField = 'orderListSellerReference';
        _orderListSellerReference?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrderListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
