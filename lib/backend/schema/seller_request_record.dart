import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'seller_request_record.g.dart';

abstract class SellerRequestRecord
    implements Built<SellerRequestRecord, SellerRequestRecordBuilder> {
  static Serializer<SellerRequestRecord> get serializer =>
      _$sellerRequestRecordSerializer;

  @BuiltValueField(wireName: 'request_user_reference')
  DocumentReference? get requestUserReference;

  @BuiltValueField(wireName: 'request_user_name')
  String? get requestUserName;

  @BuiltValueField(wireName: 'request_status')
  String? get requestStatus;

  @BuiltValueField(wireName: 'request_message')
  String? get requestMessage;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SellerRequestRecordBuilder builder) => builder
    ..requestUserName = ''
    ..requestStatus = ''
    ..requestMessage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('seller_request');

  static Stream<SellerRequestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SellerRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SellerRequestRecord._();
  factory SellerRequestRecord(
          [void Function(SellerRequestRecordBuilder) updates]) =
      _$SellerRequestRecord;

  static SellerRequestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSellerRequestRecordData({
  DocumentReference? requestUserReference,
  String? requestUserName,
  String? requestStatus,
  String? requestMessage,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    SellerRequestRecord.serializer,
    SellerRequestRecord(
      (s) => s
        ..requestUserReference = requestUserReference
        ..requestUserName = requestUserName
        ..requestStatus = requestStatus
        ..requestMessage = requestMessage
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
