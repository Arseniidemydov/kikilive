import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_list_record.g.dart';

abstract class OrderListRecord
    implements Built<OrderListRecord, OrderListRecordBuilder> {
  static Serializer<OrderListRecord> get serializer =>
      _$orderListRecordSerializer;

  @BuiltValueField(wireName: 'order_list_number')
  int? get orderListNumber;

  @BuiltValueField(wireName: 'order_list_date')
  DateTime? get orderListDate;

  @BuiltValueField(wireName: 'order_list_total')
  double? get orderListTotal;

  @BuiltValueField(wireName: 'order_list_user_reference')
  DocumentReference? get orderListUserReference;

  @BuiltValueField(wireName: 'order_list_address_reference')
  DocumentReference? get orderListAddressReference;

  @BuiltValueField(wireName: 'order_list_product_list')
  BuiltList<DocumentReference>? get orderListProductList;

  @BuiltValueField(wireName: 'order_list_product_list_unique')
  BuiltList<DocumentReference>? get orderListProductListUnique;

  @BuiltValueField(wireName: 'order_list_shipping_total')
  double? get orderListShippingTotal;

  @BuiltValueField(wireName: 'order_list_payment_id')
  String? get orderListPaymentId;

  @BuiltValueField(wireName: 'order_list_seller_reference')
  BuiltList<DocumentReference>? get orderListSellerReference;

  @BuiltValueField(wireName: 'order_list_is_paid')
  bool? get orderListIsPaid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderListRecordBuilder builder) => builder
    ..orderListNumber = 0
    ..orderListTotal = 0.0
    ..orderListProductList = ListBuilder()
    ..orderListProductListUnique = ListBuilder()
    ..orderListShippingTotal = 0.0
    ..orderListPaymentId = ''
    ..orderListSellerReference = ListBuilder()
    ..orderListIsPaid = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_list');

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
  int? orderListNumber,
  DateTime? orderListDate,
  double? orderListTotal,
  DocumentReference? orderListUserReference,
  DocumentReference? orderListAddressReference,
  double? orderListShippingTotal,
  String? orderListPaymentId,
  bool? orderListIsPaid,
}) {
  final firestoreData = serializers.toFirestore(
    OrderListRecord.serializer,
    OrderListRecord(
      (o) => o
        ..orderListNumber = orderListNumber
        ..orderListDate = orderListDate
        ..orderListTotal = orderListTotal
        ..orderListUserReference = orderListUserReference
        ..orderListAddressReference = orderListAddressReference
        ..orderListProductList = null
        ..orderListProductListUnique = null
        ..orderListShippingTotal = orderListShippingTotal
        ..orderListPaymentId = orderListPaymentId
        ..orderListSellerReference = null
        ..orderListIsPaid = orderListIsPaid,
    ),
  );

  return firestoreData;
}
