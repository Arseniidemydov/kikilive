import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'generate_s_k_u_record.g.dart';

abstract class GenerateSKURecord
    implements Built<GenerateSKURecord, GenerateSKURecordBuilder> {
  static Serializer<GenerateSKURecord> get serializer =>
      _$generateSKURecordSerializer;

  @BuiltValueField(wireName: 'SKU')
  int? get sku;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GenerateSKURecordBuilder builder) =>
      builder..sku = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('generateSKU');

  static Stream<GenerateSKURecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GenerateSKURecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GenerateSKURecord._();
  factory GenerateSKURecord([void Function(GenerateSKURecordBuilder) updates]) =
      _$GenerateSKURecord;

  static GenerateSKURecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGenerateSKURecordData({
  int? sku,
}) {
  final firestoreData = serializers.toFirestore(
    GenerateSKURecord.serializer,
    GenerateSKURecord(
      (g) => g..sku = sku,
    ),
  );

  return firestoreData;
}
