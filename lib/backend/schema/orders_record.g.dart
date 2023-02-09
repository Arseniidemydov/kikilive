// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersRecord> _$ordersRecordSerializer =
    new _$OrdersRecordSerializer();

class _$OrdersRecordSerializer implements StructuredSerializer<OrdersRecord> {
  @override
  final Iterable<Type> types = const [OrdersRecord, _$OrdersRecord];
  @override
  final String wireName = 'OrdersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrdersRecord object,
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
    value = object.shopRef;
    if (value != null) {
      result
        ..add('shop_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.shopName;
    if (value != null) {
      result
        ..add('shop_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingNo;
    if (value != null) {
      result
        ..add('shipping_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingCompany;
    if (value != null) {
      result
        ..add('shipping_company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productName;
    if (value != null) {
      result
        ..add('product_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productQty;
    if (value != null) {
      result
        ..add('product_qty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productPrice;
    if (value != null) {
      result
        ..add('product_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.productSubtotal;
    if (value != null) {
      result
        ..add('product_subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.finalTotal;
    if (value != null) {
      result
        ..add('final_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.orderStatus;
    if (value != null) {
      result
        ..add('order_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deposit;
    if (value != null) {
      result
        ..add('deposit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.subOrder;
    if (value != null) {
      result
        ..add('sub_order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.depostDate;
    if (value != null) {
      result
        ..add('depost_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderNumber;
    if (value != null) {
      result
        ..add('order_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('product_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionId;
    if (value != null) {
      result
        ..add('transaction_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderListRef;
    if (value != null) {
      result
        ..add('OrderListRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.productRef;
    if (value != null) {
      result
        ..add('ProductRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  OrdersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersRecordBuilder();

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
        case 'shop_ref':
          result.shopRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'shop_name':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shipping_no':
          result.shippingNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shipping_company':
          result.shippingCompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_name':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_qty':
          result.productQty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'product_price':
          result.productPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'product_subtotal':
          result.productSubtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'final_total':
          result.finalTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'order_status':
          result.orderStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deposit':
          result.deposit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sub_order':
          result.subOrder = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'depost_date':
          result.depostDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_number':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_image':
          result.productImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transaction_id':
          result.transactionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'OrderListRef':
          result.orderListRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'ProductRef':
          result.productRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$OrdersRecord extends OrdersRecord {
  @override
  final DateTime? orderDate;
  @override
  final DocumentReference<Object?>? shopRef;
  @override
  final String? shopName;
  @override
  final String? shippingNo;
  @override
  final String? shippingCompany;
  @override
  final String? productName;
  @override
  final int? productQty;
  @override
  final double? productPrice;
  @override
  final double? productSubtotal;
  @override
  final double? finalTotal;
  @override
  final String? orderStatus;
  @override
  final double? deposit;
  @override
  final String? subOrder;
  @override
  final DateTime? depostDate;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? orderNumber;
  @override
  final String? productImage;
  @override
  final String? transactionId;
  @override
  final String? date;
  @override
  final DocumentReference<Object?>? orderListRef;
  @override
  final DocumentReference<Object?>? productRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrdersRecord([void Function(OrdersRecordBuilder)? updates]) =>
      (new OrdersRecordBuilder()..update(updates))._build();

  _$OrdersRecord._(
      {this.orderDate,
      this.shopRef,
      this.shopName,
      this.shippingNo,
      this.shippingCompany,
      this.productName,
      this.productQty,
      this.productPrice,
      this.productSubtotal,
      this.finalTotal,
      this.orderStatus,
      this.deposit,
      this.subOrder,
      this.depostDate,
      this.userRef,
      this.orderNumber,
      this.productImage,
      this.transactionId,
      this.date,
      this.orderListRef,
      this.productRef,
      this.ffRef})
      : super._();

  @override
  OrdersRecord rebuild(void Function(OrdersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersRecordBuilder toBuilder() => new OrdersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersRecord &&
        orderDate == other.orderDate &&
        shopRef == other.shopRef &&
        shopName == other.shopName &&
        shippingNo == other.shippingNo &&
        shippingCompany == other.shippingCompany &&
        productName == other.productName &&
        productQty == other.productQty &&
        productPrice == other.productPrice &&
        productSubtotal == other.productSubtotal &&
        finalTotal == other.finalTotal &&
        orderStatus == other.orderStatus &&
        deposit == other.deposit &&
        subOrder == other.subOrder &&
        depostDate == other.depostDate &&
        userRef == other.userRef &&
        orderNumber == other.orderNumber &&
        productImage == other.productImage &&
        transactionId == other.transactionId &&
        date == other.date &&
        orderListRef == other.orderListRef &&
        productRef == other.productRef &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, orderDate.hashCode), shopRef.hashCode), shopName.hashCode),
                                                                                shippingNo.hashCode),
                                                                            shippingCompany.hashCode),
                                                                        productName.hashCode),
                                                                    productQty.hashCode),
                                                                productPrice.hashCode),
                                                            productSubtotal.hashCode),
                                                        finalTotal.hashCode),
                                                    orderStatus.hashCode),
                                                deposit.hashCode),
                                            subOrder.hashCode),
                                        depostDate.hashCode),
                                    userRef.hashCode),
                                orderNumber.hashCode),
                            productImage.hashCode),
                        transactionId.hashCode),
                    date.hashCode),
                orderListRef.hashCode),
            productRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrdersRecord')
          ..add('orderDate', orderDate)
          ..add('shopRef', shopRef)
          ..add('shopName', shopName)
          ..add('shippingNo', shippingNo)
          ..add('shippingCompany', shippingCompany)
          ..add('productName', productName)
          ..add('productQty', productQty)
          ..add('productPrice', productPrice)
          ..add('productSubtotal', productSubtotal)
          ..add('finalTotal', finalTotal)
          ..add('orderStatus', orderStatus)
          ..add('deposit', deposit)
          ..add('subOrder', subOrder)
          ..add('depostDate', depostDate)
          ..add('userRef', userRef)
          ..add('orderNumber', orderNumber)
          ..add('productImage', productImage)
          ..add('transactionId', transactionId)
          ..add('date', date)
          ..add('orderListRef', orderListRef)
          ..add('productRef', productRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrdersRecordBuilder
    implements Builder<OrdersRecord, OrdersRecordBuilder> {
  _$OrdersRecord? _$v;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  DocumentReference<Object?>? _shopRef;
  DocumentReference<Object?>? get shopRef => _$this._shopRef;
  set shopRef(DocumentReference<Object?>? shopRef) => _$this._shopRef = shopRef;

  String? _shopName;
  String? get shopName => _$this._shopName;
  set shopName(String? shopName) => _$this._shopName = shopName;

  String? _shippingNo;
  String? get shippingNo => _$this._shippingNo;
  set shippingNo(String? shippingNo) => _$this._shippingNo = shippingNo;

  String? _shippingCompany;
  String? get shippingCompany => _$this._shippingCompany;
  set shippingCompany(String? shippingCompany) =>
      _$this._shippingCompany = shippingCompany;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  int? _productQty;
  int? get productQty => _$this._productQty;
  set productQty(int? productQty) => _$this._productQty = productQty;

  double? _productPrice;
  double? get productPrice => _$this._productPrice;
  set productPrice(double? productPrice) => _$this._productPrice = productPrice;

  double? _productSubtotal;
  double? get productSubtotal => _$this._productSubtotal;
  set productSubtotal(double? productSubtotal) =>
      _$this._productSubtotal = productSubtotal;

  double? _finalTotal;
  double? get finalTotal => _$this._finalTotal;
  set finalTotal(double? finalTotal) => _$this._finalTotal = finalTotal;

  String? _orderStatus;
  String? get orderStatus => _$this._orderStatus;
  set orderStatus(String? orderStatus) => _$this._orderStatus = orderStatus;

  double? _deposit;
  double? get deposit => _$this._deposit;
  set deposit(double? deposit) => _$this._deposit = deposit;

  String? _subOrder;
  String? get subOrder => _$this._subOrder;
  set subOrder(String? subOrder) => _$this._subOrder = subOrder;

  DateTime? _depostDate;
  DateTime? get depostDate => _$this._depostDate;
  set depostDate(DateTime? depostDate) => _$this._depostDate = depostDate;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  String? _productImage;
  String? get productImage => _$this._productImage;
  set productImage(String? productImage) => _$this._productImage = productImage;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  DocumentReference<Object?>? _orderListRef;
  DocumentReference<Object?>? get orderListRef => _$this._orderListRef;
  set orderListRef(DocumentReference<Object?>? orderListRef) =>
      _$this._orderListRef = orderListRef;

  DocumentReference<Object?>? _productRef;
  DocumentReference<Object?>? get productRef => _$this._productRef;
  set productRef(DocumentReference<Object?>? productRef) =>
      _$this._productRef = productRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrdersRecordBuilder() {
    OrdersRecord._initializeBuilder(this);
  }

  OrdersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderDate = $v.orderDate;
      _shopRef = $v.shopRef;
      _shopName = $v.shopName;
      _shippingNo = $v.shippingNo;
      _shippingCompany = $v.shippingCompany;
      _productName = $v.productName;
      _productQty = $v.productQty;
      _productPrice = $v.productPrice;
      _productSubtotal = $v.productSubtotal;
      _finalTotal = $v.finalTotal;
      _orderStatus = $v.orderStatus;
      _deposit = $v.deposit;
      _subOrder = $v.subOrder;
      _depostDate = $v.depostDate;
      _userRef = $v.userRef;
      _orderNumber = $v.orderNumber;
      _productImage = $v.productImage;
      _transactionId = $v.transactionId;
      _date = $v.date;
      _orderListRef = $v.orderListRef;
      _productRef = $v.productRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersRecord;
  }

  @override
  void update(void Function(OrdersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrdersRecord build() => _build();

  _$OrdersRecord _build() {
    final _$result = _$v ??
        new _$OrdersRecord._(
            orderDate: orderDate,
            shopRef: shopRef,
            shopName: shopName,
            shippingNo: shippingNo,
            shippingCompany: shippingCompany,
            productName: productName,
            productQty: productQty,
            productPrice: productPrice,
            productSubtotal: productSubtotal,
            finalTotal: finalTotal,
            orderStatus: orderStatus,
            deposit: deposit,
            subOrder: subOrder,
            depostDate: depostDate,
            userRef: userRef,
            orderNumber: orderNumber,
            productImage: productImage,
            transactionId: transactionId,
            date: date,
            orderListRef: orderListRef,
            productRef: productRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
