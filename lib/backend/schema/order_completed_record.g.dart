// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_completed_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderCompletedRecord> _$orderCompletedRecordSerializer =
    new _$OrderCompletedRecordSerializer();

class _$OrderCompletedRecordSerializer
    implements StructuredSerializer<OrderCompletedRecord> {
  @override
  final Iterable<Type> types = const [
    OrderCompletedRecord,
    _$OrderCompletedRecord
  ];
  @override
  final String wireName = 'OrderCompletedRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrderCompletedRecord object,
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
    value = object.orderNumber;
    if (value != null) {
      result
        ..add('order_number')
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
    value = object.shippingNo;
    if (value != null) {
      result
        ..add('shipping_no')
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
    value = object.shopName;
    if (value != null) {
      result
        ..add('shop_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subOrder;
    if (value != null) {
      result
        ..add('sub_order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.finalTotal;
    if (value != null) {
      result
        ..add('final_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('product_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shopRef;
    if (value != null) {
      result
        ..add('shop_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
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
  OrderCompletedRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderCompletedRecordBuilder();

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
        case 'order_number':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transaction_id':
          result.transactionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shipping_company':
          result.shippingCompany = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shipping_no':
          result.shippingNo = serializers.deserialize(value,
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
        case 'shop_name':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sub_order':
          result.subOrder = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'final_total':
          result.finalTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'product_image':
          result.productImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shop_ref':
          result.shopRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
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

class _$OrderCompletedRecord extends OrderCompletedRecord {
  @override
  final DateTime? orderDate;
  @override
  final String? orderNumber;
  @override
  final String? transactionId;
  @override
  final String? status;
  @override
  final String? shippingCompany;
  @override
  final String? shippingNo;
  @override
  final String? productName;
  @override
  final int? productQty;
  @override
  final double? productPrice;
  @override
  final double? productSubtotal;
  @override
  final String? shopName;
  @override
  final String? subOrder;
  @override
  final double? finalTotal;
  @override
  final String? productImage;
  @override
  final DocumentReference<Object?>? shopRef;
  @override
  final String? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderCompletedRecord(
          [void Function(OrderCompletedRecordBuilder)? updates]) =>
      (new OrderCompletedRecordBuilder()..update(updates))._build();

  _$OrderCompletedRecord._(
      {this.orderDate,
      this.orderNumber,
      this.transactionId,
      this.status,
      this.shippingCompany,
      this.shippingNo,
      this.productName,
      this.productQty,
      this.productPrice,
      this.productSubtotal,
      this.shopName,
      this.subOrder,
      this.finalTotal,
      this.productImage,
      this.shopRef,
      this.date,
      this.ffRef})
      : super._();

  @override
  OrderCompletedRecord rebuild(
          void Function(OrderCompletedRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderCompletedRecordBuilder toBuilder() =>
      new OrderCompletedRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderCompletedRecord &&
        orderDate == other.orderDate &&
        orderNumber == other.orderNumber &&
        transactionId == other.transactionId &&
        status == other.status &&
        shippingCompany == other.shippingCompany &&
        shippingNo == other.shippingNo &&
        productName == other.productName &&
        productQty == other.productQty &&
        productPrice == other.productPrice &&
        productSubtotal == other.productSubtotal &&
        shopName == other.shopName &&
        subOrder == other.subOrder &&
        finalTotal == other.finalTotal &&
        productImage == other.productImage &&
        shopRef == other.shopRef &&
        date == other.date &&
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
                                                                        0,
                                                                        orderDate
                                                                            .hashCode),
                                                                    orderNumber
                                                                        .hashCode),
                                                                transactionId
                                                                    .hashCode),
                                                            status.hashCode),
                                                        shippingCompany
                                                            .hashCode),
                                                    shippingNo.hashCode),
                                                productName.hashCode),
                                            productQty.hashCode),
                                        productPrice.hashCode),
                                    productSubtotal.hashCode),
                                shopName.hashCode),
                            subOrder.hashCode),
                        finalTotal.hashCode),
                    productImage.hashCode),
                shopRef.hashCode),
            date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderCompletedRecord')
          ..add('orderDate', orderDate)
          ..add('orderNumber', orderNumber)
          ..add('transactionId', transactionId)
          ..add('status', status)
          ..add('shippingCompany', shippingCompany)
          ..add('shippingNo', shippingNo)
          ..add('productName', productName)
          ..add('productQty', productQty)
          ..add('productPrice', productPrice)
          ..add('productSubtotal', productSubtotal)
          ..add('shopName', shopName)
          ..add('subOrder', subOrder)
          ..add('finalTotal', finalTotal)
          ..add('productImage', productImage)
          ..add('shopRef', shopRef)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderCompletedRecordBuilder
    implements Builder<OrderCompletedRecord, OrderCompletedRecordBuilder> {
  _$OrderCompletedRecord? _$v;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _shippingCompany;
  String? get shippingCompany => _$this._shippingCompany;
  set shippingCompany(String? shippingCompany) =>
      _$this._shippingCompany = shippingCompany;

  String? _shippingNo;
  String? get shippingNo => _$this._shippingNo;
  set shippingNo(String? shippingNo) => _$this._shippingNo = shippingNo;

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

  String? _shopName;
  String? get shopName => _$this._shopName;
  set shopName(String? shopName) => _$this._shopName = shopName;

  String? _subOrder;
  String? get subOrder => _$this._subOrder;
  set subOrder(String? subOrder) => _$this._subOrder = subOrder;

  double? _finalTotal;
  double? get finalTotal => _$this._finalTotal;
  set finalTotal(double? finalTotal) => _$this._finalTotal = finalTotal;

  String? _productImage;
  String? get productImage => _$this._productImage;
  set productImage(String? productImage) => _$this._productImage = productImage;

  DocumentReference<Object?>? _shopRef;
  DocumentReference<Object?>? get shopRef => _$this._shopRef;
  set shopRef(DocumentReference<Object?>? shopRef) => _$this._shopRef = shopRef;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderCompletedRecordBuilder() {
    OrderCompletedRecord._initializeBuilder(this);
  }

  OrderCompletedRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderDate = $v.orderDate;
      _orderNumber = $v.orderNumber;
      _transactionId = $v.transactionId;
      _status = $v.status;
      _shippingCompany = $v.shippingCompany;
      _shippingNo = $v.shippingNo;
      _productName = $v.productName;
      _productQty = $v.productQty;
      _productPrice = $v.productPrice;
      _productSubtotal = $v.productSubtotal;
      _shopName = $v.shopName;
      _subOrder = $v.subOrder;
      _finalTotal = $v.finalTotal;
      _productImage = $v.productImage;
      _shopRef = $v.shopRef;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderCompletedRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderCompletedRecord;
  }

  @override
  void update(void Function(OrderCompletedRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderCompletedRecord build() => _build();

  _$OrderCompletedRecord _build() {
    final _$result = _$v ??
        new _$OrderCompletedRecord._(
            orderDate: orderDate,
            orderNumber: orderNumber,
            transactionId: transactionId,
            status: status,
            shippingCompany: shippingCompany,
            shippingNo: shippingNo,
            productName: productName,
            productQty: productQty,
            productPrice: productPrice,
            productSubtotal: productSubtotal,
            shopName: shopName,
            subOrder: subOrder,
            finalTotal: finalTotal,
            productImage: productImage,
            shopRef: shopRef,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
