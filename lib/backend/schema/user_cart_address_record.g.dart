// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_address_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserCartAddressRecord> _$userCartAddressRecordSerializer =
    new _$UserCartAddressRecordSerializer();

class _$UserCartAddressRecordSerializer
    implements StructuredSerializer<UserCartAddressRecord> {
  @override
  final Iterable<Type> types = const [
    UserCartAddressRecord,
    _$UserCartAddressRecord
  ];
  @override
  final String wireName = 'UserCartAddressRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserCartAddressRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.addressLabel;
    if (value != null) {
      result
        ..add('addressLabel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address1;
    if (value != null) {
      result
        ..add('address1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address2;
    if (value != null) {
      result
        ..add('address2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zip;
    if (value != null) {
      result
        ..add('zip')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userinfo;
    if (value != null) {
      result
        ..add('userinfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderNo;
    if (value != null) {
      result
        ..add('order_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  UserCartAddressRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCartAddressRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'addressLabel':
          result.addressLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address1':
          result.address1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address2':
          result.address2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zip':
          result.zip = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'userinfo':
          result.userinfo = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'order_no':
          result.orderNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$UserCartAddressRecord extends UserCartAddressRecord {
  @override
  final String? userName;
  @override
  final int? phone;
  @override
  final String? addressLabel;
  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? city;
  @override
  final int? zip;
  @override
  final DocumentReference<Object?>? userinfo;
  @override
  final String? orderNo;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserCartAddressRecord(
          [void Function(UserCartAddressRecordBuilder)? updates]) =>
      (new UserCartAddressRecordBuilder()..update(updates))._build();

  _$UserCartAddressRecord._(
      {this.userName,
      this.phone,
      this.addressLabel,
      this.address1,
      this.address2,
      this.city,
      this.zip,
      this.userinfo,
      this.orderNo,
      this.ffRef})
      : super._();

  @override
  UserCartAddressRecord rebuild(
          void Function(UserCartAddressRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCartAddressRecordBuilder toBuilder() =>
      new UserCartAddressRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCartAddressRecord &&
        userName == other.userName &&
        phone == other.phone &&
        addressLabel == other.addressLabel &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        zip == other.zip &&
        userinfo == other.userinfo &&
        orderNo == other.orderNo &&
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
                                    $jc($jc(0, userName.hashCode),
                                        phone.hashCode),
                                    addressLabel.hashCode),
                                address1.hashCode),
                            address2.hashCode),
                        city.hashCode),
                    zip.hashCode),
                userinfo.hashCode),
            orderNo.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCartAddressRecord')
          ..add('userName', userName)
          ..add('phone', phone)
          ..add('addressLabel', addressLabel)
          ..add('address1', address1)
          ..add('address2', address2)
          ..add('city', city)
          ..add('zip', zip)
          ..add('userinfo', userinfo)
          ..add('orderNo', orderNo)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserCartAddressRecordBuilder
    implements Builder<UserCartAddressRecord, UserCartAddressRecordBuilder> {
  _$UserCartAddressRecord? _$v;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  int? _phone;
  int? get phone => _$this._phone;
  set phone(int? phone) => _$this._phone = phone;

  String? _addressLabel;
  String? get addressLabel => _$this._addressLabel;
  set addressLabel(String? addressLabel) => _$this._addressLabel = addressLabel;

  String? _address1;
  String? get address1 => _$this._address1;
  set address1(String? address1) => _$this._address1 = address1;

  String? _address2;
  String? get address2 => _$this._address2;
  set address2(String? address2) => _$this._address2 = address2;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  int? _zip;
  int? get zip => _$this._zip;
  set zip(int? zip) => _$this._zip = zip;

  DocumentReference<Object?>? _userinfo;
  DocumentReference<Object?>? get userinfo => _$this._userinfo;
  set userinfo(DocumentReference<Object?>? userinfo) =>
      _$this._userinfo = userinfo;

  String? _orderNo;
  String? get orderNo => _$this._orderNo;
  set orderNo(String? orderNo) => _$this._orderNo = orderNo;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserCartAddressRecordBuilder() {
    UserCartAddressRecord._initializeBuilder(this);
  }

  UserCartAddressRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userName = $v.userName;
      _phone = $v.phone;
      _addressLabel = $v.addressLabel;
      _address1 = $v.address1;
      _address2 = $v.address2;
      _city = $v.city;
      _zip = $v.zip;
      _userinfo = $v.userinfo;
      _orderNo = $v.orderNo;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCartAddressRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCartAddressRecord;
  }

  @override
  void update(void Function(UserCartAddressRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCartAddressRecord build() => _build();

  _$UserCartAddressRecord _build() {
    final _$result = _$v ??
        new _$UserCartAddressRecord._(
            userName: userName,
            phone: phone,
            addressLabel: addressLabel,
            address1: address1,
            address2: address2,
            city: city,
            zip: zip,
            userinfo: userinfo,
            orderNo: orderNo,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
