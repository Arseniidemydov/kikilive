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

  @BuiltValueField(wireName: 'channel_join_at')
  DateTime? get channelJoinAt;

  @BuiltValueField(wireName: 'channel_join_user_reference')
  DocumentReference? get channelJoinUserReference;

  @BuiltValueField(wireName: 'channel_join_reference')
  DocumentReference? get channelJoinReference;

  @BuiltValueField(wireName: 'channel_join_payment_id')
  String? get channelJoinPaymentId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChannelJoinPaymentRecordBuilder builder) =>
      builder..channelJoinPaymentId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('channel_join_payment');

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
  DateTime? channelJoinAt,
  DocumentReference? channelJoinUserReference,
  DocumentReference? channelJoinReference,
  String? channelJoinPaymentId,
}) {
  final firestoreData = serializers.toFirestore(
    ChannelJoinPaymentRecord.serializer,
    ChannelJoinPaymentRecord(
      (c) => c
        ..channelJoinAt = channelJoinAt
        ..channelJoinUserReference = channelJoinUserReference
        ..channelJoinReference = channelJoinReference
        ..channelJoinPaymentId = channelJoinPaymentId,
    ),
  );

  return firestoreData;
}
