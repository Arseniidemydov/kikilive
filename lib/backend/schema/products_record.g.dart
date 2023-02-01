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
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.shopName;
    if (value != null) {
      result
        ..add('shop_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.itemTotal;
    if (value != null) {
      result
        ..add('item_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sku;
    if (value != null) {
      result
        ..add('sku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subCategory;
    if (value != null) {
      result
        ..add('sub_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('category_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subCat;
    if (value != null) {
      result
        ..add('sub_cat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.inventory;
    if (value != null) {
      result
        ..add('inventory')
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
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'shop_name':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'item_total':
          result.itemTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sku':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sub_category':
          result.subCategory = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shop_ref':
          result.shopRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sub_cat':
          result.subCat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'inventory':
          result.inventory = serializers.deserialize(value,
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
  final DateTime? createdAt;
  @override
  final String? shopName;
  @override
  final double? itemTotal;
  @override
  final String? sku;
  @override
  final DocumentReference<Object?>? subCategory;
  @override
  final DocumentReference<Object?>? categoryName;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? shopRef;
  @override
  final String? category;
  @override
  final String? subCat;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final int? inventory;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder)? updates]) =>
      (new ProductsRecordBuilder()..update(updates))._build();

  _$ProductsRecord._(
      {this.productName,
      this.productPrice,
      this.productDesc,
      this.productPhoto,
      this.createdAt,
      this.shopName,
      this.itemTotal,
      this.sku,
      this.subCategory,
      this.categoryName,
      this.status,
      this.shopRef,
      this.category,
      this.subCat,
      this.userRef,
      this.inventory,
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
        createdAt == other.createdAt &&
        shopName == other.shopName &&
        itemTotal == other.itemTotal &&
        sku == other.sku &&
        subCategory == other.subCategory &&
        categoryName == other.categoryName &&
        status == other.status &&
        shopRef == other.shopRef &&
        category == other.category &&
        subCat == other.subCat &&
        userRef == other.userRef &&
        inventory == other.inventory &&
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
                                                                        productName
                                                                            .hashCode),
                                                                    productPrice
                                                                        .hashCode),
                                                                productDesc
                                                                    .hashCode),
                                                            productPhoto
                                                                .hashCode),
                                                        createdAt.hashCode),
                                                    shopName.hashCode),
                                                itemTotal.hashCode),
                                            sku.hashCode),
                                        subCategory.hashCode),
                                    categoryName.hashCode),
                                status.hashCode),
                            shopRef.hashCode),
                        category.hashCode),
                    subCat.hashCode),
                userRef.hashCode),
            inventory.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsRecord')
          ..add('productName', productName)
          ..add('productPrice', productPrice)
          ..add('productDesc', productDesc)
          ..add('productPhoto', productPhoto)
          ..add('createdAt', createdAt)
          ..add('shopName', shopName)
          ..add('itemTotal', itemTotal)
          ..add('sku', sku)
          ..add('subCategory', subCategory)
          ..add('categoryName', categoryName)
          ..add('status', status)
          ..add('shopRef', shopRef)
          ..add('category', category)
          ..add('subCat', subCat)
          ..add('userRef', userRef)
          ..add('inventory', inventory)
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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _shopName;
  String? get shopName => _$this._shopName;
  set shopName(String? shopName) => _$this._shopName = shopName;

  double? _itemTotal;
  double? get itemTotal => _$this._itemTotal;
  set itemTotal(double? itemTotal) => _$this._itemTotal = itemTotal;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  DocumentReference<Object?>? _subCategory;
  DocumentReference<Object?>? get subCategory => _$this._subCategory;
  set subCategory(DocumentReference<Object?>? subCategory) =>
      _$this._subCategory = subCategory;

  DocumentReference<Object?>? _categoryName;
  DocumentReference<Object?>? get categoryName => _$this._categoryName;
  set categoryName(DocumentReference<Object?>? categoryName) =>
      _$this._categoryName = categoryName;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _shopRef;
  DocumentReference<Object?>? get shopRef => _$this._shopRef;
  set shopRef(DocumentReference<Object?>? shopRef) => _$this._shopRef = shopRef;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _subCat;
  String? get subCat => _$this._subCat;
  set subCat(String? subCat) => _$this._subCat = subCat;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  int? _inventory;
  int? get inventory => _$this._inventory;
  set inventory(int? inventory) => _$this._inventory = inventory;

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
      _createdAt = $v.createdAt;
      _shopName = $v.shopName;
      _itemTotal = $v.itemTotal;
      _sku = $v.sku;
      _subCategory = $v.subCategory;
      _categoryName = $v.categoryName;
      _status = $v.status;
      _shopRef = $v.shopRef;
      _category = $v.category;
      _subCat = $v.subCat;
      _userRef = $v.userRef;
      _inventory = $v.inventory;
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
            createdAt: createdAt,
            shopName: shopName,
            itemTotal: itemTotal,
            sku: sku,
            subCategory: subCategory,
            categoryName: categoryName,
            status: status,
            shopRef: shopRef,
            category: category,
            subCat: subCat,
            userRef: userRef,
            inventory: inventory,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
