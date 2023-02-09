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
    value = object.orderNo;
    if (value != null) {
      result
        ..add('order_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderDate;
    if (value != null) {
      result
        ..add('order_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orderTotal;
    if (value != null) {
      result
        ..add('order_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.shopRef;
    if (value != null) {
      result
        ..add('shop_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.addressRef;
    if (value != null) {
      result
        ..add('addressRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.productsList;
    if (value != null) {
      result
        ..add('productsList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.isPaid;
    if (value != null) {
      result
        ..add('isPaid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.productsListUnique;
    if (value != null) {
      result
        ..add('productsListUnique')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.shippingTotal;
    if (value != null) {
      result
        ..add('shippingTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.paymentID;
    if (value != null) {
      result
        ..add('PaymentID')
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
        case 'order_no':
          result.orderNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_date':
          result.orderDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'order_total':
          result.orderTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'user_Ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'shop_Ref':
          result.shopRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'addressRef':
          result.addressRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'productsList':
          result.productsList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'isPaid':
          result.isPaid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'productsListUnique':
          result.productsListUnique.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'shippingTotal':
          result.shippingTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'PaymentID':
          result.paymentID = serializers.deserialize(value,
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

class _$OrderListRecord extends OrderListRecord {
  @override
  final String? orderNo;
  @override
  final DateTime? orderDate;
  @override
  final double? orderTotal;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? shopRef;
  @override
  final DocumentReference<Object?>? addressRef;
  @override
  final BuiltList<DocumentReference<Object?>>? productsList;
  @override
  final bool? isPaid;
  @override
  final BuiltList<DocumentReference<Object?>>? productsListUnique;
  @override
  final double? shippingTotal;
  @override
  final String? paymentID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderListRecord([void Function(OrderListRecordBuilder)? updates]) =>
      (new OrderListRecordBuilder()..update(updates))._build();

  _$OrderListRecord._(
      {this.orderNo,
      this.orderDate,
      this.orderTotal,
      this.userRef,
      this.shopRef,
      this.addressRef,
      this.productsList,
      this.isPaid,
      this.productsListUnique,
      this.shippingTotal,
      this.paymentID,
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
        orderNo == other.orderNo &&
        orderDate == other.orderDate &&
        orderTotal == other.orderTotal &&
        userRef == other.userRef &&
        shopRef == other.shopRef &&
        addressRef == other.addressRef &&
        productsList == other.productsList &&
        isPaid == other.isPaid &&
        productsListUnique == other.productsListUnique &&
        shippingTotal == other.shippingTotal &&
        paymentID == other.paymentID &&
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
                                            $jc($jc(0, orderNo.hashCode),
                                                orderDate.hashCode),
                                            orderTotal.hashCode),
                                        userRef.hashCode),
                                    shopRef.hashCode),
                                addressRef.hashCode),
                            productsList.hashCode),
                        isPaid.hashCode),
                    productsListUnique.hashCode),
                shippingTotal.hashCode),
            paymentID.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderListRecord')
          ..add('orderNo', orderNo)
          ..add('orderDate', orderDate)
          ..add('orderTotal', orderTotal)
          ..add('userRef', userRef)
          ..add('shopRef', shopRef)
          ..add('addressRef', addressRef)
          ..add('productsList', productsList)
          ..add('isPaid', isPaid)
          ..add('productsListUnique', productsListUnique)
          ..add('shippingTotal', shippingTotal)
          ..add('paymentID', paymentID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderListRecordBuilder
    implements Builder<OrderListRecord, OrderListRecordBuilder> {
  _$OrderListRecord? _$v;

  String? _orderNo;
  String? get orderNo => _$this._orderNo;
  set orderNo(String? orderNo) => _$this._orderNo = orderNo;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  double? _orderTotal;
  double? get orderTotal => _$this._orderTotal;
  set orderTotal(double? orderTotal) => _$this._orderTotal = orderTotal;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _shopRef;
  DocumentReference<Object?>? get shopRef => _$this._shopRef;
  set shopRef(DocumentReference<Object?>? shopRef) => _$this._shopRef = shopRef;

  DocumentReference<Object?>? _addressRef;
  DocumentReference<Object?>? get addressRef => _$this._addressRef;
  set addressRef(DocumentReference<Object?>? addressRef) =>
      _$this._addressRef = addressRef;

  ListBuilder<DocumentReference<Object?>>? _productsList;
  ListBuilder<DocumentReference<Object?>> get productsList =>
      _$this._productsList ??= new ListBuilder<DocumentReference<Object?>>();
  set productsList(ListBuilder<DocumentReference<Object?>>? productsList) =>
      _$this._productsList = productsList;

  bool? _isPaid;
  bool? get isPaid => _$this._isPaid;
  set isPaid(bool? isPaid) => _$this._isPaid = isPaid;

  ListBuilder<DocumentReference<Object?>>? _productsListUnique;
  ListBuilder<DocumentReference<Object?>> get productsListUnique =>
      _$this._productsListUnique ??=
          new ListBuilder<DocumentReference<Object?>>();
  set productsListUnique(
          ListBuilder<DocumentReference<Object?>>? productsListUnique) =>
      _$this._productsListUnique = productsListUnique;

  double? _shippingTotal;
  double? get shippingTotal => _$this._shippingTotal;
  set shippingTotal(double? shippingTotal) =>
      _$this._shippingTotal = shippingTotal;

  String? _paymentID;
  String? get paymentID => _$this._paymentID;
  set paymentID(String? paymentID) => _$this._paymentID = paymentID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderListRecordBuilder() {
    OrderListRecord._initializeBuilder(this);
  }

  OrderListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderNo = $v.orderNo;
      _orderDate = $v.orderDate;
      _orderTotal = $v.orderTotal;
      _userRef = $v.userRef;
      _shopRef = $v.shopRef;
      _addressRef = $v.addressRef;
      _productsList = $v.productsList?.toBuilder();
      _isPaid = $v.isPaid;
      _productsListUnique = $v.productsListUnique?.toBuilder();
      _shippingTotal = $v.shippingTotal;
      _paymentID = $v.paymentID;
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
              orderNo: orderNo,
              orderDate: orderDate,
              orderTotal: orderTotal,
              userRef: userRef,
              shopRef: shopRef,
              addressRef: addressRef,
              productsList: _productsList?.build(),
              isPaid: isPaid,
              productsListUnique: _productsListUnique?.build(),
              shippingTotal: shippingTotal,
              paymentID: paymentID,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'productsList';
        _productsList?.build();

        _$failedField = 'productsListUnique';
        _productsListUnique?.build();
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
