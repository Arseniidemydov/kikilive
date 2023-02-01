import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'country_code_record.g.dart';

abstract class CountryCodeRecord
    implements Built<CountryCodeRecord, CountryCodeRecordBuilder> {
  static Serializer<CountryCodeRecord> get serializer =>
      _$countryCodeRecordSerializer;

  @BuiltValueField(wireName: 'country_code')
  BuiltList<String>? get countryCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CountryCodeRecordBuilder builder) =>
      builder..countryCode = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('country_code');

  static Stream<CountryCodeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CountryCodeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CountryCodeRecord._();
  factory CountryCodeRecord([void Function(CountryCodeRecordBuilder) updates]) =
      _$CountryCodeRecord;

  static CountryCodeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCountryCodeRecordData() {
  final firestoreData = serializers.toFirestore(
    CountryCodeRecord.serializer,
    CountryCodeRecord(
      (c) => c..countryCode = null,
    ),
  );

  return firestoreData;
}
