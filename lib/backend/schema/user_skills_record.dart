import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_skills_record.g.dart';

abstract class UserSkillsRecord
    implements Built<UserSkillsRecord, UserSkillsRecordBuilder> {
  static Serializer<UserSkillsRecord> get serializer =>
      _$userSkillsRecordSerializer;

  @BuiltValueField(wireName: 'skill_name')
  String? get skillName;

  @BuiltValueField(wireName: 'expertise_level')
  BuiltList<String>? get expertiseLevel;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserSkillsRecordBuilder builder) => builder
    ..skillName = ''
    ..expertiseLevel = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_skills')
          : FirebaseFirestore.instance.collectionGroup('user_skills');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_skills').doc();

  static Stream<UserSkillsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserSkillsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserSkillsRecord._();
  factory UserSkillsRecord([void Function(UserSkillsRecordBuilder) updates]) =
      _$UserSkillsRecord;

  static UserSkillsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserSkillsRecordData({
  String? skillName,
}) {
  final firestoreData = serializers.toFirestore(
    UserSkillsRecord.serializer,
    UserSkillsRecord(
      (u) => u
        ..skillName = skillName
        ..expertiseLevel = null,
    ),
  );

  return firestoreData;
}
