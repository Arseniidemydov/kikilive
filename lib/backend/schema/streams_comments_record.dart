import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'streams_comments_record.g.dart';

abstract class StreamsCommentsRecord
    implements Built<StreamsCommentsRecord, StreamsCommentsRecordBuilder> {
  static Serializer<StreamsCommentsRecord> get serializer =>
      _$streamsCommentsRecordSerializer;

  @BuiltValueField(wireName: 'stream_reference')
  DocumentReference? get streamReference;

  @BuiltValueField(wireName: 'stream_comment')
  String? get streamComment;

  @BuiltValueField(wireName: 'stream_user_reference')
  DocumentReference? get streamUserReference;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StreamsCommentsRecordBuilder builder) =>
      builder..streamComment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streams_comments');

  static Stream<StreamsCommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StreamsCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StreamsCommentsRecord._();
  factory StreamsCommentsRecord(
          [void Function(StreamsCommentsRecordBuilder) updates]) =
      _$StreamsCommentsRecord;

  static StreamsCommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStreamsCommentsRecordData({
  DocumentReference? streamReference,
  String? streamComment,
  DocumentReference? streamUserReference,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    StreamsCommentsRecord.serializer,
    StreamsCommentsRecord(
      (s) => s
        ..streamReference = streamReference
        ..streamComment = streamComment
        ..streamUserReference = streamUserReference
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
