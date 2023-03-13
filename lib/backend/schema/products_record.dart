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

  @BuiltValueField(wireName: 'product_status')
  String? get productStatus;

  @BuiltValueField(wireName: 'product_seller_reference')
  DocumentReference? get productSellerReference;

  @BuiltValueField(wireName: 'product_inventory')
  int? get productInventory;

  @BuiltValueField(wireName: 'product_sku')
  String? get productSku;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'product_category')
  String? get productCategory;

  @BuiltValueField(wireName: 'product_sub_category')
  String? get productSubCategory;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..productName = ''
    ..productPrice = 0.0
    ..productDesc = ''
    ..productPhoto = ''
    ..productStatus = ''
    ..productInventory = 0
    ..productSku = ''
    ..productCategory = ''
    ..productSubCategory = '';

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
          ..productStatus = snapshot.data['product_status']
          ..productSellerReference =
              safeGet(() => toRef(snapshot.data['product_seller_reference']))
          ..productInventory = snapshot.data['product_inventory']?.round()
          ..productSku = snapshot.data['product_sku']
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..productCategory = snapshot.data['product_category']
          ..productSubCategory = snapshot.data['product_sub_category']
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
  String? productStatus,
  DocumentReference? productSellerReference,
  int? productInventory,
  String? productSku,
  DateTime? createdAt,
  String? productCategory,
  String? productSubCategory,
}) {
  final firestoreData = serializers.toFirestore(
    ProductsRecord.serializer,
    ProductsRecord(
      (p) => p
        ..productName = productName
        ..productPrice = productPrice
        ..productDesc = productDesc
        ..productPhoto = productPhoto
        ..productStatus = productStatus
        ..productSellerReference = productSellerReference
        ..productInventory = productInventory
        ..productSku = productSku
        ..createdAt = createdAt
        ..productCategory = productCategory
        ..productSubCategory = productSubCategory,
    ),
  );

  return firestoreData;
}
