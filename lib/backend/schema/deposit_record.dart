import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deposit_record.g.dart';

abstract class DepositRecord
    implements Built<DepositRecord, DepositRecordBuilder> {
  static Serializer<DepositRecord> get serializer => _$depositRecordSerializer;

  DocumentReference? get userRef;

  DocumentReference? get adminRef;

  double? get depositAmout;

  DateTime? get depositDate;

  String? get transactionID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DepositRecordBuilder builder) => builder
    ..depositAmout = 0.0
    ..transactionID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deposit');

  static Stream<DepositRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DepositRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DepositRecord._();
  factory DepositRecord([void Function(DepositRecordBuilder) updates]) =
      _$DepositRecord;

  static DepositRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDepositRecordData({
  DocumentReference? userRef,
  DocumentReference? adminRef,
  double? depositAmout,
  DateTime? depositDate,
  String? transactionID,
}) {
  final firestoreData = serializers.toFirestore(
    DepositRecord.serializer,
    DepositRecord(
      (d) => d
        ..userRef = userRef
        ..adminRef = adminRef
        ..depositAmout = depositAmout
        ..depositDate = depositDate
        ..transactionID = transactionID,
    ),
  );

  return firestoreData;
}
