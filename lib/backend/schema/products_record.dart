import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @BuiltValueField(wireName: 'product_name')
  String? get productName;

  @BuiltValueField(wireName: 'product_price')
  double? get productPrice;

  @BuiltValueField(wireName: 'product_desc')
  String? get productDesc;

  @BuiltValueField(wireName: 'product_photo')
  String? get productPhoto;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'shop_name')
  String? get shopName;

  @BuiltValueField(wireName: 'item_total')
  double? get itemTotal;

  String? get sku;

  @BuiltValueField(wireName: 'sub_category')
  DocumentReference? get subCategory;

  @BuiltValueField(wireName: 'category_name')
  DocumentReference? get categoryName;

  String? get status;

  @BuiltValueField(wireName: 'shop_ref')
  DocumentReference? get shopRef;

  String? get category;

  @BuiltValueField(wireName: 'sub_cat')
  String? get subCat;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  int? get inventory;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..productName = ''
    ..productPrice = 0.0
    ..productDesc = ''
    ..productPhoto = ''
    ..shopName = ''
    ..itemTotal = 0.0
    ..sku = ''
    ..status = ''
    ..category = ''
    ..subCat = ''
    ..inventory = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord(
        (c) => c
          ..productName = snapshot.data['product_name']
          ..productPrice = snapshot.data['product_price']?.toDouble()
          ..productDesc = snapshot.data['product_desc']
          ..productPhoto = snapshot.data['product_photo']
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..shopName = snapshot.data['shop_name']
          ..itemTotal = snapshot.data['item_total']?.toDouble()
          ..sku = snapshot.data['sku']
          ..subCategory = safeGet(() => toRef(snapshot.data['sub_category']))
          ..categoryName = safeGet(() => toRef(snapshot.data['category_name']))
          ..status = snapshot.data['status']
          ..shopRef = safeGet(() => toRef(snapshot.data['shop_ref']))
          ..category = snapshot.data['category']
          ..subCat = snapshot.data['sub_cat']
          ..userRef = safeGet(() => toRef(snapshot.data['user_ref']))
          ..inventory = snapshot.data['inventory']?.round()
          ..ffRef = ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductsRecordData({
  String? productName,
  double? productPrice,
  String? productDesc,
  String? productPhoto,
  DateTime? createdAt,
  String? shopName,
  double? itemTotal,
  String? sku,
  DocumentReference? subCategory,
  DocumentReference? categoryName,
  String? status,
  DocumentReference? shopRef,
  String? category,
  String? subCat,
  DocumentReference? userRef,
  int? inventory,
}) {
  final firestoreData = serializers.toFirestore(
    ProductsRecord.serializer,
    ProductsRecord(
      (p) => p
        ..productName = productName
        ..productPrice = productPrice
        ..productDesc = productDesc
        ..productPhoto = productPhoto
        ..createdAt = createdAt
        ..shopName = shopName
        ..itemTotal = itemTotal
        ..sku = sku
        ..subCategory = subCategory
        ..categoryName = categoryName
        ..status = status
        ..shopRef = shopRef
        ..category = category
        ..subCat = subCat
        ..userRef = userRef
        ..inventory = inventory,
    ),
  );

  return firestoreData;
}
