import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'channel_join_payment_record.g.dart';

abstract class ChannelJoinPaymentRecord
    implements
        Built<ChannelJoinPaymentRecord, ChannelJoinPaymentRecordBuilder> {
  static Serializer<ChannelJoinPaymentRecord> get serializer =>
      _$channelJoinPaymentRecordSerializer;

  DateTime? get joinAt;

  DocumentReference? get userRef;

  DocumentReference? get channelRef;

  String? get paymentID;

  @BuiltValueField(wireName: 'PricePaid')
  double? get pricePaid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChannelJoinPaymentRecordBuilder builder) =>
      builder
        ..paymentID = ''
        ..pricePaid = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ChannelJoinPayment');

  static Stream<ChannelJoinPaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChannelJoinPaymentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChannelJoinPaymentRecord._();
  factory ChannelJoinPaymentRecord(
          [void Function(ChannelJoinPaymentRecordBuilder) updates]) =
      _$ChannelJoinPaymentRecord;

  static ChannelJoinPaymentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChannelJoinPaymentRecordData({
  DateTime? joinAt,
  DocumentReference? userRef,
  DocumentReference? channelRef,
  String? paymentID,
  double? pricePaid,
}) {
  final firestoreData = serializers.toFirestore(
    ChannelJoinPaymentRecord.serializer,
    ChannelJoinPaymentRecord(
      (c) => c
        ..joinAt = joinAt
        ..userRef = userRef
        ..channelRef = channelRef
        ..paymentID = paymentID
        ..pricePaid = pricePaid,
    ),
  );

  return firestoreData;
}
