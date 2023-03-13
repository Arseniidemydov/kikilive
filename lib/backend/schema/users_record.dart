import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'cover_photo')
  String? get coverPhoto;

  @BuiltValueField(wireName: 'user_bio')
  String? get userBio;

  @BuiltValueField(wireName: 'user_verify')
  bool? get userVerify;

  @BuiltValueField(wireName: 'user_role')
  String? get userRole;

  @BuiltValueField(wireName: 'user_instagram')
  String? get userInstagram;

  @BuiltValueField(wireName: 'user_line')
  String? get userLine;

  @BuiltValueField(wireName: 'user_point')
  double? get userPoint;

  @BuiltValueField(wireName: 'seller_bank_name')
  String? get sellerBankName;

  @BuiltValueField(wireName: 'seller_bank_account')
  int? get sellerBankAccount;

  @BuiltValueField(wireName: 'seller_earnings')
  double? get sellerEarnings;

  @BuiltValueField(wireName: 'seller_payout')
  double? get sellerPayout;

  @BuiltValueField(wireName: 'seller_shipping_cost')
  double? get sellerShippingCost;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..coverPhoto = ''
    ..userBio = ''
    ..userVerify = false
    ..userRole = ''
    ..userInstagram = ''
    ..userLine = ''
    ..userPoint = 0.0
    ..sellerBankName = ''
    ..sellerBankAccount = 0
    ..sellerEarnings = 0.0
    ..sellerPayout = 0.0
    ..sellerShippingCost = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..coverPhoto = snapshot.data['cover_photo']
          ..userBio = snapshot.data['user_bio']
          ..userVerify = snapshot.data['user_verify']
          ..userRole = snapshot.data['user_role']
          ..userInstagram = snapshot.data['user_instagram']
          ..userLine = snapshot.data['user_line']
          ..userPoint = snapshot.data['user_point']?.toDouble()
          ..sellerBankName = snapshot.data['seller_bank_name']
          ..sellerBankAccount = snapshot.data['seller_bank_account']?.round()
          ..sellerEarnings = snapshot.data['seller_earnings']?.toDouble()
          ..sellerPayout = snapshot.data['seller_payout']?.toDouble()
          ..sellerShippingCost =
              snapshot.data['seller_shipping_cost']?.toDouble()
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? coverPhoto,
  String? userBio,
  bool? userVerify,
  String? userRole,
  String? userInstagram,
  String? userLine,
  double? userPoint,
  String? sellerBankName,
  int? sellerBankAccount,
  double? sellerEarnings,
  double? sellerPayout,
  double? sellerShippingCost,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..coverPhoto = coverPhoto
        ..userBio = userBio
        ..userVerify = userVerify
        ..userRole = userRole
        ..userInstagram = userInstagram
        ..userLine = userLine
        ..userPoint = userPoint
        ..sellerBankName = sellerBankName
        ..sellerBankAccount = sellerBankAccount
        ..sellerEarnings = sellerEarnings
        ..sellerPayout = sellerPayout
        ..sellerShippingCost = sellerShippingCost,
    ),
  );

  return firestoreData;
}
