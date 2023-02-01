import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shipping_status_record.g.dart';

abstract class ShippingStatusRecord
    implements Built<ShippingStatusRecord, ShippingStatusRecordBuilder> {
  static Serializer<ShippingStatusRecord> get serializer =>
      _$shippingStatusRecordSerializer;

  @BuiltValueField(wireName: 'status_name')
  String? get statusName;

  bool? get isActive;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ShippingStatusRecordBuilder builder) => builder
    ..statusName = ''
    ..isActive = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shippingStatus');

  static Stream<ShippingStatusRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ShippingStatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ShippingStatusRecord._();
  factory ShippingStatusRecord(
          [void Function(ShippingStatusRecordBuilder) updates]) =
      _$ShippingStatusRecord;

  static ShippingStatusRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createShippingStatusRecordData({
  String? statusName,
  bool? isActive,
}) {
  final firestoreData = serializers.toFirestore(
    ShippingStatusRecord.serializer,
    ShippingStatusRecord(
      (s) => s
        ..statusName = statusName
        ..isActive = isActive,
    ),
  );

  return firestoreData;
}
