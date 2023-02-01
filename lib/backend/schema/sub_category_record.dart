import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sub_category_record.g.dart';

abstract class SubCategoryRecord
    implements Built<SubCategoryRecord, SubCategoryRecordBuilder> {
  static Serializer<SubCategoryRecord> get serializer =>
      _$subCategoryRecordSerializer;

  DocumentReference? get category;

  @BuiltValueField(wireName: 'sub_category_name')
  String? get subCategoryName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SubCategoryRecordBuilder builder) =>
      builder..subCategoryName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subCategory');

  static Stream<SubCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SubCategoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SubCategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SubCategoryRecord(
        (c) => c
          ..category = safeGet(() => toRef(snapshot.data['category']))
          ..subCategoryName = snapshot.data['sub_category_name']
          ..ffRef = SubCategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SubCategoryRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'subCategory',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SubCategoryRecord._();
  factory SubCategoryRecord([void Function(SubCategoryRecordBuilder) updates]) =
      _$SubCategoryRecord;

  static SubCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSubCategoryRecordData({
  DocumentReference? category,
  String? subCategoryName,
}) {
  final firestoreData = serializers.toFirestore(
    SubCategoryRecord.serializer,
    SubCategoryRecord(
      (s) => s
        ..category = category
        ..subCategoryName = subCategoryName,
    ),
  );

  return firestoreData;
}
