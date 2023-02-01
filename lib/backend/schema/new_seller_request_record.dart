import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'new_seller_request_record.g.dart';

abstract class NewSellerRequestRecord
    implements Built<NewSellerRequestRecord, NewSellerRequestRecordBuilder> {
  static Serializer<NewSellerRequestRecord> get serializer =>
      _$newSellerRequestRecordSerializer;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  @BuiltValueField(wireName: 'Is_approved')
  bool? get isApproved;

  String? get message;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get status;

  @BuiltValueField(wireName: 'user_img')
  String? get userImg;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NewSellerRequestRecordBuilder builder) =>
      builder
        ..userName = ''
        ..isApproved = false
        ..message = ''
        ..status = ''
        ..userImg = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('newSellerRequest');

  static Stream<NewSellerRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NewSellerRequestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NewSellerRequestRecord._();
  factory NewSellerRequestRecord(
          [void Function(NewSellerRequestRecordBuilder) updates]) =
      _$NewSellerRequestRecord;

  static NewSellerRequestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNewSellerRequestRecordData({
  DocumentReference? user,
  String? userName,
  bool? isApproved,
  String? message,
  DateTime? createdAt,
  String? status,
  String? userImg,
}) {
  final firestoreData = serializers.toFirestore(
    NewSellerRequestRecord.serializer,
    NewSellerRequestRecord(
      (n) => n
        ..user = user
        ..userName = userName
        ..isApproved = isApproved
        ..message = message
        ..createdAt = createdAt
        ..status = status
        ..userImg = userImg,
    ),
  );

  return firestoreData;
}
