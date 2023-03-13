import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deposits_record.g.dart';

abstract class DepositsRecord
    implements Built<DepositsRecord, DepositsRecordBuilder> {
  static Serializer<DepositsRecord> get serializer =>
      _$depositsRecordSerializer;

  @BuiltValueField(wireName: 'deposit_seller_reference')
  DocumentReference? get depositSellerReference;

  @BuiltValueField(wireName: 'deposit_admin_reference')
  DocumentReference? get depositAdminReference;

  @BuiltValueField(wireName: 'deposit_amount')
  double? get depositAmount;

  @BuiltValueField(wireName: 'deposit_transaction_id')
  String? get depositTransactionId;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DepositsRecordBuilder builder) => builder
    ..depositAmount = 0.0
    ..depositTransactionId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deposits');

  static Stream<DepositsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DepositsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DepositsRecord._();
  factory DepositsRecord([void Function(DepositsRecordBuilder) updates]) =
      _$DepositsRecord;

  static DepositsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDepositsRecordData({
  DocumentReference? depositSellerReference,
  DocumentReference? depositAdminReference,
  double? depositAmount,
  String? depositTransactionId,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    DepositsRecord.serializer,
    DepositsRecord(
      (d) => d
        ..depositSellerReference = depositSellerReference
        ..depositAdminReference = depositAdminReference
        ..depositAmount = depositAmount
        ..depositTransactionId = depositTransactionId
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
