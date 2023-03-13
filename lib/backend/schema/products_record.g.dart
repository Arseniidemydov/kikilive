// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsRecord> _$productsRecordSerializer =
    new _$ProductsRecordSerializer();

class _$ProductsRecordSerializer
    implements StructuredSerializer<ProductsRecord> {
  @override
  final Iterable<Type> types = const [ProductsRecord, _$ProductsRecord];
  @override
  final String wireName = 'ProductsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.productName;
    if (value != null) {
      result
        ..add('product_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productPrice;
    if (value != null) {
      result
        ..add('product_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.productDesc;
    if (value != null) {
      result
        ..add('product_desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productPhoto;
    if (value != null) {
      result
        ..add('product_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productStatus;
    if (value != null) {
      result
        ..add('product_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productSellerReference;
    if (value != null) {
      result
        ..add('product_seller_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.productInventory;
    if (value != null) {
      result
        ..add('product_inventory')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productSku;
    if (value != null) {
      result
        ..add('product_sku')
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
    value = object.productCategory;
    if (value != null) {
      result
        ..add('product_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productSubCategory;
    if (value != null) {
      result
        ..add('product_sub_category')
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
  ProductsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product_name':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_price':
          result.productPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'product_desc':
          result.productDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_photo':
          result.productPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_status':
          result.productStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_seller_reference':
          result.productSellerReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'product_inventory':
          result.productInventory = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'product_sku':
          result.productSku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'product_category':
          result.productCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_sub_category':
          result.productSubCategory = serializers.deserialize(value,
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

class _$ProductsRecord extends ProductsRecord {
  @override
  final String? productName;
  @override
  final double? productPrice;
  @override
  final String? productDesc;
  @override
  final String? productPhoto;
  @override
  final String? productStatus;
  @override
  final DocumentReference<Object?>? productSellerReference;
  @override
  final int? productInventory;
  @override
  final String? productSku;
  @override
  final DateTime? createdAt;
  @override
  final String? productCategory;
  @override
  final String? productSubCategory;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder)? updates]) =>
      (new ProductsRecordBuilder()..update(updates))._build();

  _$ProductsRecord._(
      {this.productName,
      this.productPrice,
      this.productDesc,
      this.productPhoto,
      this.productStatus,
      this.productSellerReference,
      this.productInventory,
      this.productSku,
      this.createdAt,
      this.productCategory,
      this.productSubCategory,
      this.ffRef})
      : super._();

  @override
  ProductsRecord rebuild(void Function(ProductsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsRecordBuilder toBuilder() =>
      new ProductsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsRecord &&
        productName == other.productName &&
        productPrice == other.productPrice &&
        productDesc == other.productDesc &&
        productPhoto == other.productPhoto &&
        productStatus == other.productStatus &&
        productSellerReference == other.productSellerReference &&
        productInventory == other.productInventory &&
        productSku == other.productSku &&
        createdAt == other.createdAt &&
        productCategory == other.productCategory &&
        productSubCategory == other.productSubCategory &&
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
                                            $jc($jc(0, productName.hashCode),
                                                productPrice.hashCode),
                                            productDesc.hashCode),
                                        productPhoto.hashCode),
                                    productStatus.hashCode),
                                productSellerReference.hashCode),
                            productInventory.hashCode),
                        productSku.hashCode),
                    createdAt.hashCode),
                productCategory.hashCode),
            productSubCategory.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsRecord')
          ..add('productName', productName)
          ..add('productPrice', productPrice)
          ..add('productDesc', productDesc)
          ..add('productPhoto', productPhoto)
          ..add('productStatus', productStatus)
          ..add('productSellerReference', productSellerReference)
          ..add('productInventory', productInventory)
          ..add('productSku', productSku)
          ..add('createdAt', createdAt)
          ..add('productCategory', productCategory)
          ..add('productSubCategory', productSubCategory)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProductsRecordBuilder
    implements Builder<ProductsRecord, ProductsRecordBuilder> {
  _$ProductsRecord? _$v;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  double? _productPrice;
  double? get productPrice => _$this._productPrice;
  set productPrice(double? productPrice) => _$this._productPrice = productPrice;

  String? _productDesc;
  String? get productDesc => _$this._productDesc;
  set productDesc(String? productDesc) => _$this._productDesc = productDesc;

  String? _productPhoto;
  String? get productPhoto => _$this._productPhoto;
  set productPhoto(String? productPhoto) => _$this._productPhoto = productPhoto;

  String? _productStatus;
  String? get productStatus => _$this._productStatus;
  set productStatus(String? productStatus) =>
      _$this._productStatus = productStatus;

  DocumentReference<Object?>? _productSellerReference;
  DocumentReference<Object?>? get productSellerReference =>
      _$this._productSellerReference;
  set productSellerReference(
          DocumentReference<Object?>? productSellerReference) =>
      _$this._productSellerReference = productSellerReference;

  int? _productInventory;
  int? get productInventory => _$this._productInventory;
  set productInventory(int? productInventory) =>
      _$this._productInventory = productInventory;

  String? _productSku;
  String? get productSku => _$this._productSku;
  set productSku(String? productSku) => _$this._productSku = productSku;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _productCategory;
  String? get productCategory => _$this._productCategory;
  set productCategory(String? productCategory) =>
      _$this._productCategory = productCategory;

  String? _productSubCategory;
  String? get productSubCategory => _$this._productSubCategory;
  set productSubCategory(String? productSubCategory) =>
      _$this._productSubCategory = productSubCategory;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProductsRecordBuilder() {
    ProductsRecord._initializeBuilder(this);
  }

  ProductsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productName = $v.productName;
      _productPrice = $v.productPrice;
      _productDesc = $v.productDesc;
      _productPhoto = $v.productPhoto;
      _productStatus = $v.productStatus;
      _productSellerReference = $v.productSellerReference;
      _productInventory = $v.productInventory;
      _productSku = $v.productSku;
      _createdAt = $v.createdAt;
      _productCategory = $v.productCategory;
      _productSubCategory = $v.productSubCategory;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsRecord;
  }

  @override
  void update(void Function(ProductsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsRecord build() => _build();

  _$ProductsRecord _build() {
    final _$result = _$v ??
        new _$ProductsRecord._(
            productName: productName,
            productPrice: productPrice,
            productDesc: productDesc,
            productPhoto: productPhoto,
            productStatus: productStatus,
            productSellerReference: productSellerReference,
            productInventory: productInventory,
            productSku: productSku,
            createdAt: createdAt,
            productCategory: productCategory,
            productSubCategory: productSubCategory,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
