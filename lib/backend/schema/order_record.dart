import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  @BuiltValueField(wireName: 'order_date')
  DateTime? get orderDate;

  @BuiltValueField(wireName: 'order_seller_reference')
  DocumentReference? get orderSellerReference;

  @BuiltValueField(wireName: 'order_shipping_number')
  String? get orderShippingNumber;

  @BuiltValueField(wireName: 'order_shipping_company')
  String? get orderShippingCompany;

  @BuiltValueField(wireName: 'order_product_reference')
  DocumentReference? get orderProductReference;

  @BuiltValueField(wireName: 'order_status')
  String? get orderStatus;

  @BuiltValueField(wireName: 'order_user_reference')
  DocumentReference? get orderUserReference;

  @BuiltValueField(wireName: 'order_list_reference')
  DocumentReference? get orderListReference;

  @BuiltValueField(wireName: 'order_from_list_number')
  int? get orderFromListNumber;

  @BuiltValueField(wireName: 'order_product_price')
  double? get orderProductPrice;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderRecordBuilder builder) => builder
    ..orderShippingNumber = ''
    ..orderShippingCompany = ''
    ..orderStatus = ''
    ..orderFromListNumber = 0
    ..orderProductPrice = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;

  static OrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderRecordData({
  DateTime? orderDate,
  DocumentReference? orderSellerReference,
  String? orderShippingNumber,
  String? orderShippingCompany,
  DocumentReference? orderProductReference,
  String? orderStatus,
  DocumentReference? orderUserReference,
  DocumentReference? orderListReference,
  int? orderFromListNumber,
  double? orderProductPrice,
}) {
  final firestoreData = serializers.toFirestore(
    OrderRecord.serializer,
    OrderRecord(
      (o) => o
        ..orderDate = orderDate
        ..orderSellerReference = orderSellerReference
        ..orderShippingNumber = orderShippingNumber
        ..orderShippingCompany = orderShippingCompany
        ..orderProductReference = orderProductReference
        ..orderStatus = orderStatus
        ..orderUserReference = orderUserReference
        ..orderListReference = orderListReference
        ..orderFromListNumber = orderFromListNumber
        ..orderProductPrice = orderProductPrice,
    ),
  );

  return firestoreData;
}
