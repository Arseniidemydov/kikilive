import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'address_record.g.dart';

abstract class AddressRecord
    implements Built<AddressRecord, AddressRecordBuilder> {
  static Serializer<AddressRecord> get serializer => _$addressRecordSerializer;

  String? get addressLabel;

  String? get address;

  String? get deliveryInstruction;

  DocumentReference? get userInfo;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get address2;

  String? get city;

  int? get zipcode;

  @BuiltValueField(wireName: 'address_type')
  BuiltList<String>? get addressType;

  bool? get isActive;

  @BuiltValueField(wireName: 'default_address')
  bool? get defaultAddress;

  @BuiltValueField(wireName: 'ship_to')
  String? get shipTo;

  @BuiltValueField(wireName: 'ship_to_phone')
  int? get shipToPhone;

  @BuiltValueField(wireName: 'ship_user')
  String? get shipUser;

  @BuiltValueField(wireName: 'ship_phone')
  int? get shipPhone;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AddressRecordBuilder builder) => builder
    ..addressLabel = ''
    ..address = ''
    ..deliveryInstruction = ''
    ..address2 = ''
    ..city = ''
    ..zipcode = 0
    ..addressType = ListBuilder()
    ..isActive = false
    ..defaultAddress = false
    ..shipTo = ''
    ..shipToPhone = 0
    ..shipUser = ''
    ..shipPhone = 0;

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
  String? addressLabel,
  String? address,
  String? deliveryInstruction,
  DocumentReference? userInfo,
  DateTime? createdAt,
  String? address2,
  String? city,
  int? zipcode,
  bool? isActive,
  bool? defaultAddress,
  String? shipTo,
  int? shipToPhone,
  String? shipUser,
  int? shipPhone,
}) {
  final firestoreData = serializers.toFirestore(
    AddressRecord.serializer,
    AddressRecord(
      (a) => a
        ..addressLabel = addressLabel
        ..address = address
        ..deliveryInstruction = deliveryInstruction
        ..userInfo = userInfo
        ..createdAt = createdAt
        ..address2 = address2
        ..city = city
        ..zipcode = zipcode
        ..addressType = null
        ..isActive = isActive
        ..defaultAddress = defaultAddress
        ..shipTo = shipTo
        ..shipToPhone = shipToPhone
        ..shipUser = shipUser
        ..shipPhone = shipPhone,
    ),
  );

  return firestoreData;
}
