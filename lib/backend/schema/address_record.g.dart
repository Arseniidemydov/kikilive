// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddressRecord> _$addressRecordSerializer =
    new _$AddressRecordSerializer();

class _$AddressRecordSerializer implements StructuredSerializer<AddressRecord> {
  @override
  final Iterable<Type> types = const [AddressRecord, _$AddressRecord];
  @override
  final String wireName = 'AddressRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddressRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.addressLabel;
    if (value != null) {
      result
        ..add('addressLabel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deliveryInstruction;
    if (value != null) {
      result
        ..add('deliveryInstruction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userInfo;
    if (value != null) {
      result
        ..add('userInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
    value = object.zipcode;
    if (value != null) {
      result
        ..add('zipcode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.addressType;
    if (value != null) {
      result
        ..add('address_type')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isActive;
    if (value != null) {
      result
        ..add('isActive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.defaultAddress;
    if (value != null) {
      result
        ..add('default_address')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shipTo;
    if (value != null) {
      result
        ..add('ship_to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shipToPhone;
    if (value != null) {
      result
        ..add('ship_to_phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shipUser;
    if (value != null) {
      result
        ..add('ship_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shipPhone;
    if (value != null) {
      result
        ..add('ship_phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  AddressRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'addressLabel':
          result.addressLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deliveryInstruction':
          result.deliveryInstruction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userInfo':
          result.userInfo = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'address2':
          result.address2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zipcode':
          result.zipcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address_type':
          result.addressType.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'isActive':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'default_address':
          result.defaultAddress = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ship_to':
          result.shipTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ship_to_phone':
          result.shipToPhone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ship_user':
          result.shipUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ship_phone':
          result.shipPhone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$AddressRecord extends AddressRecord {
  @override
  final String? addressLabel;
  @override
  final String? address;
  @override
  final String? deliveryInstruction;
  @override
  final DocumentReference<Object?>? userInfo;
  @override
  final DateTime? createdAt;
  @override
  final String? address2;
  @override
  final String? city;
  @override
  final int? zipcode;
  @override
  final BuiltList<String>? addressType;
  @override
  final bool? isActive;
  @override
  final bool? defaultAddress;
  @override
  final String? shipTo;
  @override
  final int? shipToPhone;
  @override
  final String? shipUser;
  @override
  final int? shipPhone;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddressRecord([void Function(AddressRecordBuilder)? updates]) =>
      (new AddressRecordBuilder()..update(updates))._build();

  _$AddressRecord._(
      {this.addressLabel,
      this.address,
      this.deliveryInstruction,
      this.userInfo,
      this.createdAt,
      this.address2,
      this.city,
      this.zipcode,
      this.addressType,
      this.isActive,
      this.defaultAddress,
      this.shipTo,
      this.shipToPhone,
      this.shipUser,
      this.shipPhone,
      this.ffRef})
      : super._();

  @override
  AddressRecord rebuild(void Function(AddressRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressRecordBuilder toBuilder() => new AddressRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressRecord &&
        addressLabel == other.addressLabel &&
        address == other.address &&
        deliveryInstruction == other.deliveryInstruction &&
        userInfo == other.userInfo &&
        createdAt == other.createdAt &&
        address2 == other.address2 &&
        city == other.city &&
        zipcode == other.zipcode &&
        addressType == other.addressType &&
        isActive == other.isActive &&
        defaultAddress == other.defaultAddress &&
        shipTo == other.shipTo &&
        shipToPhone == other.shipToPhone &&
        shipUser == other.shipUser &&
        shipPhone == other.shipPhone &&
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
                                                                    0,
                                                                    addressLabel
                                                                        .hashCode),
                                                                address
                                                                    .hashCode),
                                                            deliveryInstruction
                                                                .hashCode),
                                                        userInfo.hashCode),
                                                    createdAt.hashCode),
                                                address2.hashCode),
                                            city.hashCode),
                                        zipcode.hashCode),
                                    addressType.hashCode),
                                isActive.hashCode),
                            defaultAddress.hashCode),
                        shipTo.hashCode),
                    shipToPhone.hashCode),
                shipUser.hashCode),
            shipPhone.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressRecord')
          ..add('addressLabel', addressLabel)
          ..add('address', address)
          ..add('deliveryInstruction', deliveryInstruction)
          ..add('userInfo', userInfo)
          ..add('createdAt', createdAt)
          ..add('address2', address2)
          ..add('city', city)
          ..add('zipcode', zipcode)
          ..add('addressType', addressType)
          ..add('isActive', isActive)
          ..add('defaultAddress', defaultAddress)
          ..add('shipTo', shipTo)
          ..add('shipToPhone', shipToPhone)
          ..add('shipUser', shipUser)
          ..add('shipPhone', shipPhone)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddressRecordBuilder
    implements Builder<AddressRecord, AddressRecordBuilder> {
  _$AddressRecord? _$v;

  String? _addressLabel;
  String? get addressLabel => _$this._addressLabel;
  set addressLabel(String? addressLabel) => _$this._addressLabel = addressLabel;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _deliveryInstruction;
  String? get deliveryInstruction => _$this._deliveryInstruction;
  set deliveryInstruction(String? deliveryInstruction) =>
      _$this._deliveryInstruction = deliveryInstruction;

  DocumentReference<Object?>? _userInfo;
  DocumentReference<Object?>? get userInfo => _$this._userInfo;
  set userInfo(DocumentReference<Object?>? userInfo) =>
      _$this._userInfo = userInfo;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _address2;
  String? get address2 => _$this._address2;
  set address2(String? address2) => _$this._address2 = address2;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  int? _zipcode;
  int? get zipcode => _$this._zipcode;
  set zipcode(int? zipcode) => _$this._zipcode = zipcode;

  ListBuilder<String>? _addressType;
  ListBuilder<String> get addressType =>
      _$this._addressType ??= new ListBuilder<String>();
  set addressType(ListBuilder<String>? addressType) =>
      _$this._addressType = addressType;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  bool? _defaultAddress;
  bool? get defaultAddress => _$this._defaultAddress;
  set defaultAddress(bool? defaultAddress) =>
      _$this._defaultAddress = defaultAddress;

  String? _shipTo;
  String? get shipTo => _$this._shipTo;
  set shipTo(String? shipTo) => _$this._shipTo = shipTo;

  int? _shipToPhone;
  int? get shipToPhone => _$this._shipToPhone;
  set shipToPhone(int? shipToPhone) => _$this._shipToPhone = shipToPhone;

  String? _shipUser;
  String? get shipUser => _$this._shipUser;
  set shipUser(String? shipUser) => _$this._shipUser = shipUser;

  int? _shipPhone;
  int? get shipPhone => _$this._shipPhone;
  set shipPhone(int? shipPhone) => _$this._shipPhone = shipPhone;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddressRecordBuilder() {
    AddressRecord._initializeBuilder(this);
  }

  AddressRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addressLabel = $v.addressLabel;
      _address = $v.address;
      _deliveryInstruction = $v.deliveryInstruction;
      _userInfo = $v.userInfo;
      _createdAt = $v.createdAt;
      _address2 = $v.address2;
      _city = $v.city;
      _zipcode = $v.zipcode;
      _addressType = $v.addressType?.toBuilder();
      _isActive = $v.isActive;
      _defaultAddress = $v.defaultAddress;
      _shipTo = $v.shipTo;
      _shipToPhone = $v.shipToPhone;
      _shipUser = $v.shipUser;
      _shipPhone = $v.shipPhone;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressRecord;
  }

  @override
  void update(void Function(AddressRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressRecord build() => _build();

  _$AddressRecord _build() {
    _$AddressRecord _$result;
    try {
      _$result = _$v ??
          new _$AddressRecord._(
              addressLabel: addressLabel,
              address: address,
              deliveryInstruction: deliveryInstruction,
              userInfo: userInfo,
              createdAt: createdAt,
              address2: address2,
              city: city,
              zipcode: zipcode,
              addressType: _addressType?.build(),
              isActive: isActive,
              defaultAddress: defaultAddress,
              shipTo: shipTo,
              shipToPhone: shipToPhone,
              shipUser: shipUser,
              shipPhone: shipPhone,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'addressType';
        _addressType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddressRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
