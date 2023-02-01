import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'address_types_record.g.dart';

abstract class AddressTypesRecord
    implements Built<AddressTypesRecord, AddressTypesRecordBuilder> {
  static Serializer<AddressTypesRecord> get serializer =>
      _$addressTypesRecordSerializer;

  @BuiltValueField(wireName: 'address_name')
  String? get addressName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AddressTypesRecordBuilder builder) =>
      builder..addressName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('address_types');

  static Stream<AddressTypesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddressTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AddressTypesRecord._();
  factory AddressTypesRecord(
          [void Function(AddressTypesRecordBuilder) updates]) =
      _$AddressTypesRecord;

  static AddressTypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddressTypesRecordData({
  String? addressName,
}) {
  final firestoreData = serializers.toFirestore(
    AddressTypesRecord.serializer,
    AddressTypesRecord(
      (a) => a..addressName = addressName,
    ),
  );

  return firestoreData;
}
