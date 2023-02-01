import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'categories_record.g.dart';

abstract class CategoriesRecord
    implements Built<CategoriesRecord, CategoriesRecordBuilder> {
  static Serializer<CategoriesRecord> get serializer =>
      _$categoriesRecordSerializer;

  @BuiltValueField(wireName: 'category_name')
  String? get categoryName;

  @BuiltValueField(wireName: 'category_image')
  String? get categoryImage;

  @BuiltValueField(wireName: 'sr_no')
  int? get srNo;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoriesRecordBuilder builder) => builder
    ..categoryName = ''
    ..categoryImage = ''
    ..srNo = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CategoriesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CategoriesRecord(
        (c) => c
          ..categoryName = snapshot.data['category_name']
          ..categoryImage = snapshot.data['category_image']
          ..srNo = snapshot.data['sr_no']?.round()
          ..ffRef = CategoriesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CategoriesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'categories',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CategoriesRecord._();
  factory CategoriesRecord([void Function(CategoriesRecordBuilder) updates]) =
      _$CategoriesRecord;

  static CategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  String? categoryImage,
  int? srNo,
}) {
  final firestoreData = serializers.toFirestore(
    CategoriesRecord.serializer,
    CategoriesRecord(
      (c) => c
        ..categoryName = categoryName
        ..categoryImage = categoryImage
        ..srNo = srNo,
    ),
  );

  return firestoreData;
}
