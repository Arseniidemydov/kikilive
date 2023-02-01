import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_cart_address_record.g.dart';

abstract class UserCartAddressRecord
    implements Built<UserCartAddressRecord, UserCartAddressRecordBuilder> {
  static Serializer<UserCartAddressRecord> get serializer =>
      _$userCartAddressRecordSerializer;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  int? get phone;

  String? get addressLabel;

  String? get address1;

  String? get address2;

  String? get city;

  int? get zip;

  DocumentReference? get userinfo;

  @BuiltValueField(wireName: 'order_no')
  String? get orderNo;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserCartAddressRecordBuilder builder) =>
      builder
        ..userName = ''
        ..phone = 0
        ..addressLabel = ''
        ..address1 = ''
        ..address2 = ''
        ..city = ''
        ..zip = 0
        ..orderNo = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userCartAddress')
          : FirebaseFirestore.instance.collectionGroup('userCartAddress');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('userCartAddress').doc();

  static Stream<UserCartAddressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserCartAddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserCartAddressRecord._();
  factory UserCartAddressRecord(
          [void Function(UserCartAddressRecordBuilder) updates]) =
      _$UserCartAddressRecord;

  static UserCartAddressRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserCartAddressRecordData({
  String? userName,
  int? phone,
  String? addressLabel,
  String? address1,
  String? address2,
  String? city,
  int? zip,
  DocumentReference? userinfo,
  String? orderNo,
}) {
  final firestoreData = serializers.toFirestore(
    UserCartAddressRecord.serializer,
    UserCartAddressRecord(
      (u) => u
        ..userName = userName
        ..phone = phone
        ..addressLabel = addressLabel
        ..address1 = address1
        ..address2 = address2
        ..city = city
        ..zip = zip
        ..userinfo = userinfo
        ..orderNo = orderNo,
    ),
  );

  return firestoreData;
}
