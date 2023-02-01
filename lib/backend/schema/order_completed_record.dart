import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_completed_record.g.dart';

abstract class OrderCompletedRecord
    implements Built<OrderCompletedRecord, OrderCompletedRecordBuilder> {
  static Serializer<OrderCompletedRecord> get serializer =>
      _$orderCompletedRecordSerializer;

  @BuiltValueField(wireName: 'order_date')
  DateTime? get orderDate;

  @BuiltValueField(wireName: 'order_number')
  String? get orderNumber;

  @BuiltValueField(wireName: 'transaction_id')
  String? get transactionId;

  String? get status;

  @BuiltValueField(wireName: 'shipping_company')
  String? get shippingCompany;

  @BuiltValueField(wireName: 'shipping_no')
  String? get shippingNo;

  @BuiltValueField(wireName: 'product_name')
  String? get productName;

  @BuiltValueField(wireName: 'product_qty')
  int? get productQty;

  @BuiltValueField(wireName: 'product_price')
  double? get productPrice;

  @BuiltValueField(wireName: 'product_subtotal')
  double? get productSubtotal;

  @BuiltValueField(wireName: 'shop_name')
  String? get shopName;

  @BuiltValueField(wireName: 'sub_order')
  String? get subOrder;

  @BuiltValueField(wireName: 'final_total')
  double? get finalTotal;

  @BuiltValueField(wireName: 'product_image')
  String? get productImage;

  @BuiltValueField(wireName: 'shop_ref')
  DocumentReference? get shopRef;

  String? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(OrderCompletedRecordBuilder builder) => builder
    ..orderNumber = ''
    ..transactionId = ''
    ..status = ''
    ..shippingCompany = ''
    ..shippingNo = ''
    ..productName = ''
    ..productQty = 0
    ..productPrice = 0.0
    ..productSubtotal = 0.0
    ..shopName = ''
    ..subOrder = ''
    ..finalTotal = 0.0
    ..productImage = ''
    ..date = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orderCompleted')
          : FirebaseFirestore.instance.collectionGroup('orderCompleted');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('orderCompleted').doc();

  static Stream<OrderCompletedRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderCompletedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderCompletedRecord._();
  factory OrderCompletedRecord(
          [void Function(OrderCompletedRecordBuilder) updates]) =
      _$OrderCompletedRecord;

  static OrderCompletedRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderCompletedRecordData({
  DateTime? orderDate,
  String? orderNumber,
  String? transactionId,
  String? status,
  String? shippingCompany,
  String? shippingNo,
  String? productName,
  int? productQty,
  double? productPrice,
  double? productSubtotal,
  String? shopName,
  String? subOrder,
  double? finalTotal,
  String? productImage,
  DocumentReference? shopRef,
  String? date,
}) {
  final firestoreData = serializers.toFirestore(
    OrderCompletedRecord.serializer,
    OrderCompletedRecord(
      (o) => o
        ..orderDate = orderDate
        ..orderNumber = orderNumber
        ..transactionId = transactionId
        ..status = status
        ..shippingCompany = shippingCompany
        ..shippingNo = shippingNo
        ..productName = productName
        ..productQty = productQty
        ..productPrice = productPrice
        ..productSubtotal = productSubtotal
        ..shopName = shopName
        ..subOrder = subOrder
        ..finalTotal = finalTotal
        ..productImage = productImage
        ..shopRef = shopRef
        ..date = date,
    ),
  );

  return firestoreData;
}
