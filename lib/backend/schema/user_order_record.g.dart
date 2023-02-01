// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserOrderRecord> _$userOrderRecordSerializer =
    new _$UserOrderRecordSerializer();

class _$UserOrderRecordSerializer
    implements StructuredSerializer<UserOrderRecord> {
  @override
  final Iterable<Type> types = const [UserOrderRecord, _$UserOrderRecord];
  @override
  final String wireName = 'UserOrderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserOrderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.shopName;
    if (value != null) {
      result
        ..add('shopName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productName;
    if (value != null) {
      result
        ..add('productName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productPrice;
    if (value != null) {
      result
        ..add('productPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.productQuantity;
    if (value != null) {
      result
        ..add('productQuantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subtotal;
    if (value != null) {
      result
        ..add('subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('productImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderNumber;
    if (value != null) {
      result
        ..add('order_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tax;
    if (value != null) {
      result
        ..add('tax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.shipping;
    if (value != null) {
      result
        ..add('shipping')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.finalTotal;
    if (value != null) {
      result
        ..add('finalTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.subOrder;
    if (value != null) {
      result
        ..add('sub_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sku;
    if (value != null) {
      result
        ..add('sku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shopRef;
    if (value != null) {
      result
        ..add('shop_ref')
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
  UserOrderRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserOrderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'shopName':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'productName':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'productPrice':
          result.productPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'productQuantity':
          result.productQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'productImage':
          result.productImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_number':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tax':
          result.tax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'shipping':
          result.shipping = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'finalTotal':
          result.finalTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sub_order':
          result.subOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sku':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'shop_ref':
          result.shopRef = serializers.deserialize(value,
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

class _$UserOrderRecord extends UserOrderRecord {
  @override
  final String? shopName;
  @override
  final String? productName;
  @override
  final double? productPrice;
  @override
  final int? productQuantity;
  @override
  final double? subtotal;
  @override
  final DateTime? timestamp;
  @override
  final String? productImage;
  @override
  final String? orderNumber;
  @override
  final double? tax;
  @override
  final double? shipping;
  @override
  final double? finalTotal;
  @override
  final int? subOrder;
  @override
  final String? sku;
  @override
  final int? phone;
  @override
  final DocumentReference<Object?>? shopRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserOrderRecord([void Function(UserOrderRecordBuilder)? updates]) =>
      (new UserOrderRecordBuilder()..update(updates))._build();

  _$UserOrderRecord._(
      {this.shopName,
      this.productName,
      this.productPrice,
      this.productQuantity,
      this.subtotal,
      this.timestamp,
      this.productImage,
      this.orderNumber,
      this.tax,
      this.shipping,
      this.finalTotal,
      this.subOrder,
      this.sku,
      this.phone,
      this.shopRef,
      this.ffRef})
      : super._();

  @override
  UserOrderRecord rebuild(void Function(UserOrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserOrderRecordBuilder toBuilder() =>
      new UserOrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserOrderRecord &&
        shopName == other.shopName &&
        productName == other.productName &&
        productPrice == other.productPrice &&
        productQuantity == other.productQuantity &&
        subtotal == other.subtotal &&
        timestamp == other.timestamp &&
        productImage == other.productImage &&
        orderNumber == other.orderNumber &&
        tax == other.tax &&
        shipping == other.shipping &&
        finalTotal == other.finalTotal &&
        subOrder == other.subOrder &&
        sku == other.sku &&
        phone == other.phone &&
        shopRef == other.shopRef &&
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
                                                                    0,
                                                                    shopName
                                                                        .hashCode),
                                                                productName
                                                                    .hashCode),
                                                            productPrice
                                                                .hashCode),
                                                        productQuantity
                                                            .hashCode),
                                                    subtotal.hashCode),
                                                timestamp.hashCode),
                                            productImage.hashCode),
                                        orderNumber.hashCode),
                                    tax.hashCode),
                                shipping.hashCode),
                            finalTotal.hashCode),
                        subOrder.hashCode),
                    sku.hashCode),
                phone.hashCode),
            shopRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserOrderRecord')
          ..add('shopName', shopName)
          ..add('productName', productName)
          ..add('productPrice', productPrice)
          ..add('productQuantity', productQuantity)
          ..add('subtotal', subtotal)
          ..add('timestamp', timestamp)
          ..add('productImage', productImage)
          ..add('orderNumber', orderNumber)
          ..add('tax', tax)
          ..add('shipping', shipping)
          ..add('finalTotal', finalTotal)
          ..add('subOrder', subOrder)
          ..add('sku', sku)
          ..add('phone', phone)
          ..add('shopRef', shopRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserOrderRecordBuilder
    implements Builder<UserOrderRecord, UserOrderRecordBuilder> {
  _$UserOrderRecord? _$v;

  String? _shopName;
  String? get shopName => _$this._shopName;
  set shopName(String? shopName) => _$this._shopName = shopName;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  double? _productPrice;
  double? get productPrice => _$this._productPrice;
  set productPrice(double? productPrice) => _$this._productPrice = productPrice;

  int? _productQuantity;
  int? get productQuantity => _$this._productQuantity;
  set productQuantity(int? productQuantity) =>
      _$this._productQuantity = productQuantity;

  double? _subtotal;
  double? get subtotal => _$this._subtotal;
  set subtotal(double? subtotal) => _$this._subtotal = subtotal;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _productImage;
  String? get productImage => _$this._productImage;
  set productImage(String? productImage) => _$this._productImage = productImage;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  double? _tax;
  double? get tax => _$this._tax;
  set tax(double? tax) => _$this._tax = tax;

  double? _shipping;
  double? get shipping => _$this._shipping;
  set shipping(double? shipping) => _$this._shipping = shipping;

  double? _finalTotal;
  double? get finalTotal => _$this._finalTotal;
  set finalTotal(double? finalTotal) => _$this._finalTotal = finalTotal;

  int? _subOrder;
  int? get subOrder => _$this._subOrder;
  set subOrder(int? subOrder) => _$this._subOrder = subOrder;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  int? _phone;
  int? get phone => _$this._phone;
  set phone(int? phone) => _$this._phone = phone;

  DocumentReference<Object?>? _shopRef;
  DocumentReference<Object?>? get shopRef => _$this._shopRef;
  set shopRef(DocumentReference<Object?>? shopRef) => _$this._shopRef = shopRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserOrderRecordBuilder() {
    UserOrderRecord._initializeBuilder(this);
  }

  UserOrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shopName = $v.shopName;
      _productName = $v.productName;
      _productPrice = $v.productPrice;
      _productQuantity = $v.productQuantity;
      _subtotal = $v.subtotal;
      _timestamp = $v.timestamp;
      _productImage = $v.productImage;
      _orderNumber = $v.orderNumber;
      _tax = $v.tax;
      _shipping = $v.shipping;
      _finalTotal = $v.finalTotal;
      _subOrder = $v.subOrder;
      _sku = $v.sku;
      _phone = $v.phone;
      _shopRef = $v.shopRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserOrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserOrderRecord;
  }

  @override
  void update(void Function(UserOrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserOrderRecord build() => _build();

  _$UserOrderRecord _build() {
    final _$result = _$v ??
        new _$UserOrderRecord._(
            shopName: shopName,
            productName: productName,
            productPrice: productPrice,
            productQuantity: productQuantity,
            subtotal: subtotal,
            timestamp: timestamp,
            productImage: productImage,
            orderNumber: orderNumber,
            tax: tax,
            shipping: shipping,
            finalTotal: finalTotal,
            subOrder: subOrder,
            sku: sku,
            phone: phone,
            shopRef: shopRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
