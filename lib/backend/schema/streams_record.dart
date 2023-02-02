import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'streams_record.g.dart';

abstract class StreamsRecord
    implements Built<StreamsRecord, StreamsRecordBuilder> {
  static Serializer<StreamsRecord> get serializer => _$streamsRecordSerializer;

  @BuiltValueField(wireName: 'is_live')
  bool? get isLive;

  @BuiltValueField(wireName: 'playback_name')
  String? get playbackName;

  @BuiltValueField(wireName: 'playback_url')
  String? get playbackUrl;

  DateTime? get timestamp;

  String? get uid;

  @BuiltValueField(wireName: 'stream_id')
  String? get streamId;

  @BuiltValueField(wireName: 'channel_reference')
  BuiltList<DocumentReference>? get channelReference;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'stream_view_offline')
  int? get streamViewOffline;

  @BuiltValueField(wireName: 'stream_view_online')
  int? get streamViewOnline;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StreamsRecordBuilder builder) => builder
    ..isLive = false
    ..playbackName = ''
    ..playbackUrl = ''
    ..uid = ''
    ..streamId = ''
    ..channelReference = ListBuilder()
    ..streamViewOffline = 0
    ..streamViewOnline = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streams');

  static Stream<StreamsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StreamsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StreamsRecord._();
  factory StreamsRecord([void Function(StreamsRecordBuilder) updates]) =
      _$StreamsRecord;

  static StreamsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStreamsRecordData({
  bool? isLive,
  String? playbackName,
  String? playbackUrl,
  DateTime? timestamp,
  String? uid,
  String? streamId,
  DocumentReference? userRef,
  int? streamViewOffline,
  int? streamViewOnline,
}) {
  final firestoreData = serializers.toFirestore(
    StreamsRecord.serializer,
    StreamsRecord(
      (s) => s
        ..isLive = isLive
        ..playbackName = playbackName
        ..playbackUrl = playbackUrl
        ..timestamp = timestamp
        ..uid = uid
        ..streamId = streamId
        ..channelReference = null
        ..userRef = userRef
        ..streamViewOffline = streamViewOffline
        ..streamViewOnline = streamViewOnline,
    ),
  );

  return firestoreData;
}
