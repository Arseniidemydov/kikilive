import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'channels_record.g.dart';

abstract class ChannelsRecord
    implements Built<ChannelsRecord, ChannelsRecordBuilder> {
  static Serializer<ChannelsRecord> get serializer =>
      _$channelsRecordSerializer;

  @BuiltValueField(wireName: 'channel_name')
  String? get channelName;

  @BuiltValueField(wireName: 'channel_type')
  String? get channelType;

  @BuiltValueField(wireName: 'channel_user_reference')
  DocumentReference? get channelUserReference;

  @BuiltValueField(wireName: 'channel_description')
  String? get channelDescription;

  @BuiltValueField(wireName: 'channel_image')
  String? get channelImage;

  @BuiltValueField(wireName: 'channel_status')
  bool? get channelStatus;

  @BuiltValueField(wireName: 'channel_price')
  double? get channelPrice;

  @BuiltValueField(wireName: 'channel_approval_message')
  String? get channelApprovalMessage;

  @BuiltValueField(wireName: 'channel_members')
  BuiltList<DocumentReference>? get channelMembers;

  @BuiltValueField(wireName: 'channel_is_main')
  bool? get channelIsMain;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChannelsRecordBuilder builder) => builder
    ..channelName = ''
    ..channelType = ''
    ..channelDescription = ''
    ..channelImage = ''
    ..channelStatus = false
    ..channelPrice = 0.0
    ..channelApprovalMessage = ''
    ..channelMembers = ListBuilder()
    ..channelIsMain = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('channels');

  static Stream<ChannelsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChannelsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChannelsRecord._();
  factory ChannelsRecord([void Function(ChannelsRecordBuilder) updates]) =
      _$ChannelsRecord;

  static ChannelsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChannelsRecordData({
  String? channelName,
  String? channelType,
  DocumentReference? channelUserReference,
  String? channelDescription,
  String? channelImage,
  bool? channelStatus,
  double? channelPrice,
  String? channelApprovalMessage,
  bool? channelIsMain,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    ChannelsRecord.serializer,
    ChannelsRecord(
      (c) => c
        ..channelName = channelName
        ..channelType = channelType
        ..channelUserReference = channelUserReference
        ..channelDescription = channelDescription
        ..channelImage = channelImage
        ..channelStatus = channelStatus
        ..channelPrice = channelPrice
        ..channelApprovalMessage = channelApprovalMessage
        ..channelMembers = null
        ..channelIsMain = channelIsMain
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
