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
    value = object.userVerified;
    if (value != null) {
      result
        ..add('userVerified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isSeller;
    if (value != null) {
      result
        ..add('is_Seller')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shippingCost;
    if (value != null) {
      result
        ..add('shipping_cost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.accountType;
    if (value != null) {
      result
        ..add('account_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagram;
    if (value != null) {
      result
        ..add('instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.line;
    if (value != null) {
      result
        ..add('line')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankName;
    if (value != null) {
      result
        ..add('bank_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccount;
    if (value != null) {
      result
        ..add('bank_account')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isAdmin;
    if (value != null) {
      result
        ..add('IsAdmin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
        case 'userVerified':
          result.userVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_Seller':
          result.isSeller = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'shipping_cost':
          result.shippingCost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'account_type':
          result.accountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'instagram':
          result.instagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'line':
          result.line = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bank_name':
          result.bankName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bank_account':
          result.bankAccount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'IsAdmin':
          result.isAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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
  final bool? userVerified;
  @override
  final bool? isSeller;
  @override
  final double? shippingCost;
  @override
  final String? accountType;
  @override
  final String? instagram;
  @override
  final String? line;
  @override
  final String? bankName;
  @override
  final int? bankAccount;
  @override
  final bool? isAdmin;
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
      this.userVerified,
      this.isSeller,
      this.shippingCost,
      this.accountType,
      this.instagram,
      this.line,
      this.bankName,
      this.bankAccount,
      this.isAdmin,
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
        userVerified == other.userVerified &&
        isSeller == other.isSeller &&
        shippingCost == other.shippingCost &&
        accountType == other.accountType &&
        instagram == other.instagram &&
        line == other.line &&
        bankName == other.bankName &&
        bankAccount == other.bankAccount &&
        isAdmin == other.isAdmin &&
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
                                                                            0,
                                                                            email
                                                                                .hashCode),
                                                                        displayName
                                                                            .hashCode),
                                                                    photoUrl
                                                                        .hashCode),
                                                                uid.hashCode),
                                                            createdTime
                                                                .hashCode),
                                                        phoneNumber.hashCode),
                                                    coverPhoto.hashCode),
                                                userBio.hashCode),
                                            userVerified.hashCode),
                                        isSeller.hashCode),
                                    shippingCost.hashCode),
                                accountType.hashCode),
                            instagram.hashCode),
                        line.hashCode),
                    bankName.hashCode),
                bankAccount.hashCode),
            isAdmin.hashCode),
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
          ..add('userVerified', userVerified)
          ..add('isSeller', isSeller)
          ..add('shippingCost', shippingCost)
          ..add('accountType', accountType)
          ..add('instagram', instagram)
          ..add('line', line)
          ..add('bankName', bankName)
          ..add('bankAccount', bankAccount)
          ..add('isAdmin', isAdmin)
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

  bool? _userVerified;
  bool? get userVerified => _$this._userVerified;
  set userVerified(bool? userVerified) => _$this._userVerified = userVerified;

  bool? _isSeller;
  bool? get isSeller => _$this._isSeller;
  set isSeller(bool? isSeller) => _$this._isSeller = isSeller;

  double? _shippingCost;
  double? get shippingCost => _$this._shippingCost;
  set shippingCost(double? shippingCost) => _$this._shippingCost = shippingCost;

  String? _accountType;
  String? get accountType => _$this._accountType;
  set accountType(String? accountType) => _$this._accountType = accountType;

  String? _instagram;
  String? get instagram => _$this._instagram;
  set instagram(String? instagram) => _$this._instagram = instagram;

  String? _line;
  String? get line => _$this._line;
  set line(String? line) => _$this._line = line;

  String? _bankName;
  String? get bankName => _$this._bankName;
  set bankName(String? bankName) => _$this._bankName = bankName;

  int? _bankAccount;
  int? get bankAccount => _$this._bankAccount;
  set bankAccount(int? bankAccount) => _$this._bankAccount = bankAccount;

  bool? _isAdmin;
  bool? get isAdmin => _$this._isAdmin;
  set isAdmin(bool? isAdmin) => _$this._isAdmin = isAdmin;

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
      _userVerified = $v.userVerified;
      _isSeller = $v.isSeller;
      _shippingCost = $v.shippingCost;
      _accountType = $v.accountType;
      _instagram = $v.instagram;
      _line = $v.line;
      _bankName = $v.bankName;
      _bankAccount = $v.bankAccount;
      _isAdmin = $v.isAdmin;
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
            userVerified: userVerified,
            isSeller: isSeller,
            shippingCost: shippingCost,
            accountType: accountType,
            instagram: instagram,
            line: line,
            bankName: bankName,
            bankAccount: bankAccount,
            isAdmin: isAdmin,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
