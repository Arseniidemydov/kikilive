import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'streaming_comments_record.g.dart';

abstract class StreamingCommentsRecord
    implements Built<StreamingCommentsRecord, StreamingCommentsRecordBuilder> {
  static Serializer<StreamingCommentsRecord> get serializer =>
      _$streamingCommentsRecordSerializer;

  DocumentReference? get streamID;

  String? get comment;

  DocumentReference? get userID;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StreamingCommentsRecordBuilder builder) =>
      builder..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streaming_comments');

  static Stream<StreamingCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StreamingCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StreamingCommentsRecord._();
  factory StreamingCommentsRecord(
          [void Function(StreamingCommentsRecordBuilder) updates]) =
      _$StreamingCommentsRecord;

  static StreamingCommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStreamingCommentsRecordData({
  DocumentReference? streamID,
  String? comment,
  DocumentReference? userID,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    StreamingCommentsRecord.serializer,
    StreamingCommentsRecord(
      (s) => s
        ..streamID = streamID
        ..comment = comment
        ..userID = userID
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
