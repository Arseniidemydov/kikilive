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

  @BuiltValueField(wireName: 'channel_owner')
  DocumentReference? get channelOwner;

  @BuiltValueField(wireName: 'shop_type')
  String? get shopType;

  @BuiltValueField(wireName: 'channel_desc')
  String? get channelDesc;

  @BuiltValueField(wireName: 'channel_views')
  int? get channelViews;

  @BuiltValueField(wireName: 'channel_video_url')
  String? get channelVideoUrl;

  @BuiltValueField(wireName: 'channel_created_on')
  DateTime? get channelCreatedOn;

  @BuiltValueField(wireName: 'channel_price')
  double? get channelPrice;

  @BuiltValueField(wireName: 'channel_status')
  bool? get channelStatus;

  @BuiltValueField(wireName: 'channel_image')
  String? get channelImage;

  @BuiltValueField(wireName: 'message_reason')
  String? get messageReason;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChannelsRecordBuilder builder) => builder
    ..channelName = ''
    ..channelType = ''
    ..shopType = ''
    ..channelDesc = ''
    ..channelViews = 0
    ..channelVideoUrl = ''
    ..channelPrice = 0.0
    ..channelStatus = false
    ..channelImage = ''
    ..messageReason = '';

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
  DocumentReference? channelOwner,
  String? shopType,
  String? channelDesc,
  int? channelViews,
  String? channelVideoUrl,
  DateTime? channelCreatedOn,
  double? channelPrice,
  bool? channelStatus,
  String? channelImage,
  String? messageReason,
}) {
  final firestoreData = serializers.toFirestore(
    ChannelsRecord.serializer,
    ChannelsRecord(
      (c) => c
        ..channelName = channelName
        ..channelType = channelType
        ..channelOwner = channelOwner
        ..shopType = shopType
        ..channelDesc = channelDesc
        ..channelViews = channelViews
        ..channelVideoUrl = channelVideoUrl
        ..channelCreatedOn = channelCreatedOn
        ..channelPrice = channelPrice
        ..channelStatus = channelStatus
        ..channelImage = channelImage
        ..messageReason = messageReason,
    ),
  );

  return firestoreData;
}
