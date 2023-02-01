import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_no_record.g.dart';

abstract class OrderNoRecord
    implements Built<OrderNoRecord, OrderNoRecordBuilder> {
  static Serializer<OrderNoRecord> get serializer => _$orderNoRecordSerializer;

  int? get orderNo;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderNoRecordBuilder builder) =>
      builder..orderNo = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderNo');

  static Stream<OrderNoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderNoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderNoRecord._();
  factory OrderNoRecord([void Function(OrderNoRecordBuilder) updates]) =
      _$OrderNoRecord;

  static OrderNoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderNoRecordData({
  int? orderNo,
}) {
  final firestoreData = serializers.toFirestore(
    OrderNoRecord.serializer,
    OrderNoRecord(
      (o) => o..orderNo = orderNo,
    ),
  );

  return firestoreData;
}
