import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'taxes_record.g.dart';

abstract class TaxesRecord implements Built<TaxesRecord, TaxesRecordBuilder> {
  static Serializer<TaxesRecord> get serializer => _$taxesRecordSerializer;

  @BuiltValueField(wireName: 'tax_name')
  String? get taxName;

  @BuiltValueField(wireName: 'tax_value')
  double? get taxValue;

  bool? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaxesRecordBuilder builder) => builder
    ..taxName = ''
    ..taxValue = 0.0
    ..status = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taxes');

  static Stream<TaxesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaxesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaxesRecord._();
  factory TaxesRecord([void Function(TaxesRecordBuilder) updates]) =
      _$TaxesRecord;

  static TaxesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaxesRecordData({
  String? taxName,
  double? taxValue,
  bool? status,
}) {
  final firestoreData = serializers.toFirestore(
    TaxesRecord.serializer,
    TaxesRecord(
      (t) => t
        ..taxName = taxName
        ..taxValue = taxValue
        ..status = status,
    ),
  );

  return firestoreData;
}
