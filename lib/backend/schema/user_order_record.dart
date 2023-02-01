import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_order_record.g.dart';

abstract class UserOrderRecord
    implements Built<UserOrderRecord, UserOrderRecordBuilder> {
  static Serializer<UserOrderRecord> get serializer =>
      _$userOrderRecordSerializer;

  String? get shopName;

  String? get productName;

  double? get productPrice;

  int? get productQuantity;

  double? get subtotal;

  DateTime? get timestamp;

  String? get productImage;

  @BuiltValueField(wireName: 'order_number')
  String? get orderNumber;

  double? get tax;

  double? get shipping;

  double? get finalTotal;

  @BuiltValueField(wireName: 'sub_order')
  int? get subOrder;

  String? get sku;

  int? get phone;

  @BuiltValueField(wireName: 'shop_ref')
  DocumentReference? get shopRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserOrderRecordBuilder builder) => builder
    ..shopName = ''
    ..productName = ''
    ..productPrice = 0.0
    ..productQuantity = 0
    ..subtotal = 0.0
    ..productImage = ''
    ..orderNumber = ''
    ..tax = 0.0
    ..shipping = 0.0
    ..finalTotal = 0.0
    ..subOrder = 0
    ..sku = ''
    ..phone = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userOrder')
          : FirebaseFirestore.instance.collectionGroup('userOrder');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('userOrder').doc();

  static Stream<UserOrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserOrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserOrderRecord._();
  factory UserOrderRecord([void Function(UserOrderRecordBuilder) updates]) =
      _$UserOrderRecord;

  static UserOrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserOrderRecordData({
  String? shopName,
  String? productName,
  double? productPrice,
  int? productQuantity,
  double? subtotal,
  DateTime? timestamp,
  String? productImage,
  String? orderNumber,
  double? tax,
  double? shipping,
  double? finalTotal,
  int? subOrder,
  String? sku,
  int? phone,
  DocumentReference? shopRef,
}) {
  final firestoreData = serializers.toFirestore(
    UserOrderRecord.serializer,
    UserOrderRecord(
      (u) => u
        ..shopName = shopName
        ..productName = productName
        ..productPrice = productPrice
        ..productQuantity = productQuantity
        ..subtotal = subtotal
        ..timestamp = timestamp
        ..productImage = productImage
        ..orderNumber = orderNumber
        ..tax = tax
        ..shipping = shipping
        ..finalTotal = finalTotal
        ..subOrder = subOrder
        ..sku = sku
        ..phone = phone
        ..shopRef = shopRef,
    ),
  );

  return firestoreData;
}
