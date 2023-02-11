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

  bool? get userVerified;

  @BuiltValueField(wireName: 'is_Seller')
  bool? get isSeller;

  @BuiltValueField(wireName: 'shipping_cost')
  double? get shippingCost;

  @BuiltValueField(wireName: 'account_type')
  String? get accountType;

  String? get instagram;

  String? get line;

  @BuiltValueField(wireName: 'bank_name')
  String? get bankName;

  @BuiltValueField(wireName: 'bank_account')
  int? get bankAccount;

  @BuiltValueField(wireName: 'IsAdmin')
  bool? get isAdmin;

  double? get userPoints;

  double? get earnings;

  double? get payout;

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
    ..userVerified = false
    ..isSeller = false
    ..shippingCost = 0.0
    ..accountType = ''
    ..instagram = ''
    ..line = ''
    ..bankName = ''
    ..bankAccount = 0
    ..isAdmin = false
    ..userPoints = 0.0
    ..earnings = 0.0
    ..payout = 0.0;

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
          ..userVerified = snapshot.data['userVerified']
          ..isSeller = snapshot.data['is_Seller']
          ..shippingCost = snapshot.data['shipping_cost']?.toDouble()
          ..accountType = snapshot.data['account_type']
          ..instagram = snapshot.data['instagram']
          ..line = snapshot.data['line']
          ..bankName = snapshot.data['bank_name']
          ..bankAccount = snapshot.data['bank_account']?.round()
          ..isAdmin = snapshot.data['IsAdmin']
          ..userPoints = snapshot.data['userPoints']?.toDouble()
          ..earnings = snapshot.data['earnings']?.toDouble()
          ..payout = snapshot.data['payout']?.toDouble()
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
  bool? userVerified,
  bool? isSeller,
  double? shippingCost,
  String? accountType,
  String? instagram,
  String? line,
  String? bankName,
  int? bankAccount,
  bool? isAdmin,
  double? userPoints,
  double? earnings,
  double? payout,
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
        ..userVerified = userVerified
        ..isSeller = isSeller
        ..shippingCost = shippingCost
        ..accountType = accountType
        ..instagram = instagram
        ..line = line
        ..bankName = bankName
        ..bankAccount = bankAccount
        ..isAdmin = isAdmin
        ..userPoints = userPoints
        ..earnings = earnings
        ..payout = payout,
    ),
  );

  return firestoreData;
}
