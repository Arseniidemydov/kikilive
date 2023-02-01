import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'email_verification_record.g.dart';

abstract class EmailVerificationRecord
    implements Built<EmailVerificationRecord, EmailVerificationRecordBuilder> {
  static Serializer<EmailVerificationRecord> get serializer =>
      _$emailVerificationRecordSerializer;

  String? get toEmail;

  String? get subject;

  String? get content;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EmailVerificationRecordBuilder builder) =>
      builder
        ..toEmail = ''
        ..subject = ''
        ..content = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emailVerification');

  static Stream<EmailVerificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EmailVerificationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EmailVerificationRecord._();
  factory EmailVerificationRecord(
          [void Function(EmailVerificationRecordBuilder) updates]) =
      _$EmailVerificationRecord;

  static EmailVerificationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEmailVerificationRecordData({
  String? toEmail,
  String? subject,
  String? content,
}) {
  final firestoreData = serializers.toFirestore(
    EmailVerificationRecord.serializer,
    EmailVerificationRecord(
      (e) => e
        ..toEmail = toEmail
        ..subject = subject
        ..content = content,
    ),
  );

  return firestoreData;
}
