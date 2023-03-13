import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sub_category_record.g.dart';

abstract class SubCategoryRecord
    implements Built<SubCategoryRecord, SubCategoryRecordBuilder> {
  static Serializer<SubCategoryRecord> get serializer =>
      _$subCategoryRecordSerializer;

  @BuiltValueField(wireName: 'category_reference')
  DocumentReference? get categoryReference;

  @BuiltValueField(wireName: 'sub_category_name')
  String? get subCategoryName;

  @BuiltValueField(wireName: 'sub_category_order')
  int? get subCategoryOrder;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SubCategoryRecordBuilder builder) => builder
    ..subCategoryName = ''
    ..subCategoryOrder = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sub_category');

  static Stream<SubCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SubCategoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SubCategoryRecord._();
  factory SubCategoryRecord([void Function(SubCategoryRecordBuilder) updates]) =
      _$SubCategoryRecord;

  static SubCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSubCategoryRecordData({
  DocumentReference? categoryReference,
  String? subCategoryName,
  int? subCategoryOrder,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    SubCategoryRecord.serializer,
    SubCategoryRecord(
      (s) => s
        ..categoryReference = categoryReference
        ..subCategoryName = subCategoryName
        ..subCategoryOrder = subCategoryOrder
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
