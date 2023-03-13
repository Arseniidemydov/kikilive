// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverPhoto;
    if (value != null) {
      result
        ..add('cover_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userBio;
    if (value != null) {
      result
        ..add('user_bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userVerify;
    if (value != null) {
      result
        ..add('user_verify')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userRole;
    if (value != null) {
      result
        ..add('user_role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userInstagram;
    if (value != null) {
      result
        ..add('user_instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userLine;
    if (value != null) {
      result
        ..add('user_line')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userPoint;
    if (value != null) {
      result
        ..add('user_point')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sellerBankName;
    if (value != null) {
      result
        ..add('seller_bank_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sellerBankAccount;
    if (value != null) {
      result
        ..add('seller_bank_account')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sellerEarnings;
    if (value != null) {
      result
        ..add('seller_earnings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sellerPayout;
    if (value != null) {
      result
        ..add('seller_payout')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.sellerShippingCost;
    if (value != null) {
      result
        ..add('seller_shipping_cost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover_photo':
          result.coverPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_bio':
          result.userBio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_verify':
          result.userVerify = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user_role':
          result.userRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_instagram':
          result.userInstagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_line':
          result.userLine = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_point':
          result.userPoint = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'seller_bank_name':
          result.sellerBankName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'seller_bank_account':
          result.sellerBankAccount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'seller_earnings':
          result.sellerEarnings = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'seller_payout':
          result.sellerPayout = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'seller_shipping_cost':
          result.sellerShippingCost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? coverPhoto;
  @override
  final String? userBio;
  @override
  final bool? userVerify;
  @override
  final String? userRole;
  @override
  final String? userInstagram;
  @override
  final String? userLine;
  @override
  final double? userPoint;
  @override
  final String? sellerBankName;
  @override
  final int? sellerBankAccount;
  @override
  final double? sellerEarnings;
  @override
  final double? sellerPayout;
  @override
  final double? sellerShippingCost;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.coverPhoto,
      this.userBio,
      this.userVerify,
      this.userRole,
      this.userInstagram,
      this.userLine,
      this.userPoint,
      this.sellerBankName,
      this.sellerBankAccount,
      this.sellerEarnings,
      this.sellerPayout,
      this.sellerShippingCost,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        coverPhoto == other.coverPhoto &&
        userBio == other.userBio &&
        userVerify == other.userVerify &&
        userRole == other.userRole &&
        userInstagram == other.userInstagram &&
        userLine == other.userLine &&
        userPoint == other.userPoint &&
        sellerBankName == other.sellerBankName &&
        sellerBankAccount == other.sellerBankAccount &&
        sellerEarnings == other.sellerEarnings &&
        sellerPayout == other.sellerPayout &&
        sellerShippingCost == other.sellerShippingCost &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                email
                                                                                    .hashCode),
                                                                            displayName
                                                                                .hashCode),
                                                                        photoUrl
                                                                            .hashCode),
                                                                    uid
                                                                        .hashCode),
                                                                createdTime
                                                                    .hashCode),
                                                            phoneNumber
                                                                .hashCode),
                                                        coverPhoto.hashCode),
                                                    userBio.hashCode),
                                                userVerify.hashCode),
                                            userRole.hashCode),
                                        userInstagram.hashCode),
                                    userLine.hashCode),
                                userPoint.hashCode),
                            sellerBankName.hashCode),
                        sellerBankAccount.hashCode),
                    sellerEarnings.hashCode),
                sellerPayout.hashCode),
            sellerShippingCost.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('coverPhoto', coverPhoto)
          ..add('userBio', userBio)
          ..add('userVerify', userVerify)
          ..add('userRole', userRole)
          ..add('userInstagram', userInstagram)
          ..add('userLine', userLine)
          ..add('userPoint', userPoint)
          ..add('sellerBankName', sellerBankName)
          ..add('sellerBankAccount', sellerBankAccount)
          ..add('sellerEarnings', sellerEarnings)
          ..add('sellerPayout', sellerPayout)
          ..add('sellerShippingCost', sellerShippingCost)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _coverPhoto;
  String? get coverPhoto => _$this._coverPhoto;
  set coverPhoto(String? coverPhoto) => _$this._coverPhoto = coverPhoto;

  String? _userBio;
  String? get userBio => _$this._userBio;
  set userBio(String? userBio) => _$this._userBio = userBio;

  bool? _userVerify;
  bool? get userVerify => _$this._userVerify;
  set userVerify(bool? userVerify) => _$this._userVerify = userVerify;

  String? _userRole;
  String? get userRole => _$this._userRole;
  set userRole(String? userRole) => _$this._userRole = userRole;

  String? _userInstagram;
  String? get userInstagram => _$this._userInstagram;
  set userInstagram(String? userInstagram) =>
      _$this._userInstagram = userInstagram;

  String? _userLine;
  String? get userLine => _$this._userLine;
  set userLine(String? userLine) => _$this._userLine = userLine;

  double? _userPoint;
  double? get userPoint => _$this._userPoint;
  set userPoint(double? userPoint) => _$this._userPoint = userPoint;

  String? _sellerBankName;
  String? get sellerBankName => _$this._sellerBankName;
  set sellerBankName(String? sellerBankName) =>
      _$this._sellerBankName = sellerBankName;

  int? _sellerBankAccount;
  int? get sellerBankAccount => _$this._sellerBankAccount;
  set sellerBankAccount(int? sellerBankAccount) =>
      _$this._sellerBankAccount = sellerBankAccount;

  double? _sellerEarnings;
  double? get sellerEarnings => _$this._sellerEarnings;
  set sellerEarnings(double? sellerEarnings) =>
      _$this._sellerEarnings = sellerEarnings;

  double? _sellerPayout;
  double? get sellerPayout => _$this._sellerPayout;
  set sellerPayout(double? sellerPayout) => _$this._sellerPayout = sellerPayout;

  double? _sellerShippingCost;
  double? get sellerShippingCost => _$this._sellerShippingCost;
  set sellerShippingCost(double? sellerShippingCost) =>
      _$this._sellerShippingCost = sellerShippingCost;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _coverPhoto = $v.coverPhoto;
      _userBio = $v.userBio;
      _userVerify = $v.userVerify;
      _userRole = $v.userRole;
      _userInstagram = $v.userInstagram;
      _userLine = $v.userLine;
      _userPoint = $v.userPoint;
      _sellerBankName = $v.sellerBankName;
      _sellerBankAccount = $v.sellerBankAccount;
      _sellerEarnings = $v.sellerEarnings;
      _sellerPayout = $v.sellerPayout;
      _sellerShippingCost = $v.sellerShippingCost;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            coverPhoto: coverPhoto,
            userBio: userBio,
            userVerify: userVerify,
            userRole: userRole,
            userInstagram: userInstagram,
            userLine: userLine,
            userPoint: userPoint,
            sellerBankName: sellerBankName,
            sellerBankAccount: sellerBankAccount,
            sellerEarnings: sellerEarnings,
            sellerPayout: sellerPayout,
            sellerShippingCost: sellerShippingCost,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
