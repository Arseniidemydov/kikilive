import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'defaul_img_record.g.dart';

abstract class DefaulImgRecord
    implements Built<DefaulImgRecord, DefaulImgRecordBuilder> {
  static Serializer<DefaulImgRecord> get serializer =>
      _$defaulImgRecordSerializer;

  @BuiltValueField(wireName: 'default_img')
  String? get defaultImg;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DefaulImgRecordBuilder builder) =>
      builder..defaultImg = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('defaul_img');

  static Stream<DefaulImgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DefaulImgRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DefaulImgRecord._();
  factory DefaulImgRecord([void Function(DefaulImgRecordBuilder) updates]) =
      _$DefaulImgRecord;

  static DefaulImgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDefaulImgRecordData({
  String? defaultImg,
}) {
  final firestoreData = serializers.toFirestore(
    DefaulImgRecord.serializer,
    DefaulImgRecord(
      (d) => d..defaultImg = defaultImg,
    ),
  );

  return firestoreData;
}
