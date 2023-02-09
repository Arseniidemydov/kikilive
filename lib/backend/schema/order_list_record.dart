import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_list_record.g.dart';

abstract class OrderListRecord
    implements Built<OrderListRecord, OrderListRecordBuilder> {
  static Serializer<OrderListRecord> get serializer =>
      _$orderListRecordSerializer;

  @BuiltValueField(wireName: 'order_no')
  String? get orderNo;

  @BuiltValueField(wireName: 'order_date')
  DateTime? get orderDate;

  @BuiltValueField(wireName: 'order_total')
  double? get orderTotal;

  @BuiltValueField(wireName: 'user_Ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'shop_Ref')
  DocumentReference? get shopRef;

  DocumentReference? get addressRef;

  BuiltList<DocumentReference>? get productsList;

  bool? get isPaid;

  BuiltList<DocumentReference>? get productsListUnique;

  double? get shippingTotal;

  @BuiltValueField(wireName: 'PaymentID')
  String? get paymentID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderListRecordBuilder builder) => builder
    ..orderNo = ''
    ..orderTotal = 0.0
    ..productsList = ListBuilder()
    ..isPaid = false
    ..productsListUnique = ListBuilder()
    ..shippingTotal = 0.0
    ..paymentID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderList');

  static Stream<OrderListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderListRecord._();
  factory OrderListRecord([void Function(OrderListRecordBuilder) updates]) =
      _$OrderListRecord;

  static OrderListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderListRecordData({
  String? orderNo,
  DateTime? orderDate,
  double? orderTotal,
  DocumentReference? userRef,
  DocumentReference? shopRef,
  DocumentReference? addressRef,
  bool? isPaid,
  double? shippingTotal,
  String? paymentID,
}) {
  final firestoreData = serializers.toFirestore(
    OrderListRecord.serializer,
    OrderListRecord(
      (o) => o
        ..orderNo = orderNo
        ..orderDate = orderDate
        ..orderTotal = orderTotal
        ..userRef = userRef
        ..shopRef = shopRef
        ..addressRef = addressRef
        ..productsList = null
        ..isPaid = isPaid
        ..productsListUnique = null
        ..shippingTotal = shippingTotal
        ..paymentID = paymentID,
    ),
  );

  return firestoreData;
}
