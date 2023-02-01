import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_record.g.dart';

abstract class OrdersRecord
    implements Built<OrdersRecord, OrdersRecordBuilder> {
  static Serializer<OrdersRecord> get serializer => _$ordersRecordSerializer;

  @BuiltValueField(wireName: 'order_date')
  DateTime? get orderDate;

  @BuiltValueField(wireName: 'shop_ref')
  DocumentReference? get shopRef;

  @BuiltValueField(wireName: 'shop_name')
  String? get shopName;

  @BuiltValueField(wireName: 'shipping_no')
  String? get shippingNo;

  @BuiltValueField(wireName: 'shipping_company')
  String? get shippingCompany;

  @BuiltValueField(wireName: 'product_name')
  String? get productName;

  @BuiltValueField(wireName: 'product_qty')
  int? get productQty;

  @BuiltValueField(wireName: 'product_price')
  double? get productPrice;

  @BuiltValueField(wireName: 'product_subtotal')
  double? get productSubtotal;

  @BuiltValueField(wireName: 'final_total')
  double? get finalTotal;

  @BuiltValueField(wireName: 'order_status')
  String? get orderStatus;

  double? get deposit;

  @BuiltValueField(wireName: 'sub_order')
  String? get subOrder;

  @BuiltValueField(wireName: 'depost_date')
  DateTime? get depostDate;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'order_number')
  String? get orderNumber;

  @BuiltValueField(wireName: 'product_image')
  String? get productImage;

  @BuiltValueField(wireName: 'transaction_id')
  String? get transactionId;

  String? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrdersRecordBuilder builder) => builder
    ..shopName = ''
    ..shippingNo = ''
    ..shippingCompany = ''
    ..productName = ''
    ..productQty = 0
    ..productPrice = 0.0
    ..productSubtotal = 0.0
    ..finalTotal = 0.0
    ..orderStatus = ''
    ..deposit = 0.0
    ..subOrder = ''
    ..orderNumber = ''
    ..productImage = ''
    ..transactionId = ''
    ..date = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrdersRecord._();
  factory OrdersRecord([void Function(OrdersRecordBuilder) updates]) =
      _$OrdersRecord;

  static OrdersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? orderDate,
  DocumentReference? shopRef,
  String? shopName,
  String? shippingNo,
  String? shippingCompany,
  String? productName,
  int? productQty,
  double? productPrice,
  double? productSubtotal,
  double? finalTotal,
  String? orderStatus,
  double? deposit,
  String? subOrder,
  DateTime? depostDate,
  DocumentReference? userRef,
  String? orderNumber,
  String? productImage,
  String? transactionId,
  String? date,
}) {
  final firestoreData = serializers.toFirestore(
    OrdersRecord.serializer,
    OrdersRecord(
      (o) => o
        ..orderDate = orderDate
        ..shopRef = shopRef
        ..shopName = shopName
        ..shippingNo = shippingNo
        ..shippingCompany = shippingCompany
        ..productName = productName
        ..productQty = productQty
        ..productPrice = productPrice
        ..productSubtotal = productSubtotal
        ..finalTotal = finalTotal
        ..orderStatus = orderStatus
        ..deposit = deposit
        ..subOrder = subOrder
        ..depostDate = depostDate
        ..userRef = userRef
        ..orderNumber = orderNumber
        ..productImage = productImage
        ..transactionId = transactionId
        ..date = date,
    ),
  );

  return firestoreData;
}
