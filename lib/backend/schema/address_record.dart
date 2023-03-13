import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'address_record.g.dart';

abstract class AddressRecord
    implements Built<AddressRecord, AddressRecordBuilder> {
  static Serializer<AddressRecord> get serializer => _$addressRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'address_type')
  BuiltList<String>? get addressType;

  @BuiltValueField(wireName: 'address_label_name')
  String? get addressLabelName;

  @BuiltValueField(wireName: 'address_line_1')
  String? get addressLine1;

  @BuiltValueField(wireName: 'address_line_2')
  String? get addressLine2;

  @BuiltValueField(wireName: 'address_city')
  String? get addressCity;

  @BuiltValueField(wireName: 'address_zipcode')
  int? get addressZipcode;

  @BuiltValueField(wireName: 'address_is_default')
  bool? get addressIsDefault;

  @BuiltValueField(wireName: 'address_ship_to_name')
  String? get addressShipToName;

  @BuiltValueField(wireName: 'address_ship_to_phone')
  int? get addressShipToPhone;

  @BuiltValueField(wireName: 'address_ship_user_name')
  String? get addressShipUserName;

  @BuiltValueField(wireName: 'address_ship_user_phone')
  int? get addressShipUserPhone;

  @BuiltValueField(wireName: 'address_delivery_instruction')
  String? get addressDeliveryInstruction;

  @BuiltValueField(wireName: 'user_reference')
  DocumentReference? get userReference;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AddressRecordBuilder builder) => builder
    ..addressType = ListBuilder()
    ..addressLabelName = ''
    ..addressLine1 = ''
    ..addressLine2 = ''
    ..addressCity = ''
    ..addressZipcode = 0
    ..addressIsDefault = false
    ..addressShipToName = ''
    ..addressShipToPhone = 0
    ..addressShipUserName = ''
    ..addressShipUserPhone = 0
    ..addressDeliveryInstruction = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('address');

  static Stream<AddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddressRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AddressRecord._();
  factory AddressRecord([void Function(AddressRecordBuilder) updates]) =
      _$AddressRecord;

  static AddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddressRecordData({
  DateTime? createdAt,
  String? addressLabelName,
  String? addressLine1,
  String? addressLine2,
  String? addressCity,
  int? addressZipcode,
  bool? addressIsDefault,
  String? addressShipToName,
  int? addressShipToPhone,
  String? addressShipUserName,
  int? addressShipUserPhone,
  String? addressDeliveryInstruction,
  DocumentReference? userReference,
}) {
  final firestoreData = serializers.toFirestore(
    AddressRecord.serializer,
    AddressRecord(
      (a) => a
        ..createdAt = createdAt
        ..addressType = null
        ..addressLabelName = addressLabelName
        ..addressLine1 = addressLine1
        ..addressLine2 = addressLine2
        ..addressCity = addressCity
        ..addressZipcode = addressZipcode
        ..addressIsDefault = addressIsDefault
        ..addressShipToName = addressShipToName
        ..addressShipToPhone = addressShipToPhone
        ..addressShipUserName = addressShipUserName
        ..addressShipUserPhone = addressShipUserPhone
        ..addressDeliveryInstruction = addressDeliveryInstruction
        ..userReference = userReference,
    ),
  );

  return firestoreData;
}
