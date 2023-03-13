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
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.addressType;
    if (value != null) {
      result
        ..add('address_type')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.addressLabelName;
    if (value != null) {
      result
        ..add('address_label_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressLine1;
    if (value != null) {
      result
        ..add('address_line_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressLine2;
    if (value != null) {
      result
        ..add('address_line_2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressCity;
    if (value != null) {
      result
        ..add('address_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressZipcode;
    if (value != null) {
      result
        ..add('address_zipcode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.addressIsDefault;
    if (value != null) {
      result
        ..add('address_is_default')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.addressShipToName;
    if (value != null) {
      result
        ..add('address_ship_to_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressShipToPhone;
    if (value != null) {
      result
        ..add('address_ship_to_phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.addressShipUserName;
    if (value != null) {
      result
        ..add('address_ship_user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressShipUserPhone;
    if (value != null) {
      result
        ..add('address_ship_user_phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.addressDeliveryInstruction;
    if (value != null) {
      result
        ..add('address_delivery_instruction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userReference;
    if (value != null) {
      result
        ..add('user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'address_type':
          result.addressType.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'address_label_name':
          result.addressLabelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_line_1':
          result.addressLine1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_line_2':
          result.addressLine2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_city':
          result.addressCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_zipcode':
          result.addressZipcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address_is_default':
          result.addressIsDefault = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'address_ship_to_name':
          result.addressShipToName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_ship_to_phone':
          result.addressShipToPhone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address_ship_user_name':
          result.addressShipUserName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_ship_user_phone':
          result.addressShipUserPhone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address_delivery_instruction':
          result.addressDeliveryInstruction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_reference':
          result.userReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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
  final DateTime? createdAt;
  @override
  final BuiltList<String>? addressType;
  @override
  final String? addressLabelName;
  @override
  final String? addressLine1;
  @override
  final String? addressLine2;
  @override
  final String? addressCity;
  @override
  final int? addressZipcode;
  @override
  final bool? addressIsDefault;
  @override
  final String? addressShipToName;
  @override
  final int? addressShipToPhone;
  @override
  final String? addressShipUserName;
  @override
  final int? addressShipUserPhone;
  @override
  final String? addressDeliveryInstruction;
  @override
  final DocumentReference<Object?>? userReference;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddressRecord([void Function(AddressRecordBuilder)? updates]) =>
      (new AddressRecordBuilder()..update(updates))._build();

  _$AddressRecord._(
      {this.createdAt,
      this.addressType,
      this.addressLabelName,
      this.addressLine1,
      this.addressLine2,
      this.addressCity,
      this.addressZipcode,
      this.addressIsDefault,
      this.addressShipToName,
      this.addressShipToPhone,
      this.addressShipUserName,
      this.addressShipUserPhone,
      this.addressDeliveryInstruction,
      this.userReference,
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
        createdAt == other.createdAt &&
        addressType == other.addressType &&
        addressLabelName == other.addressLabelName &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        addressCity == other.addressCity &&
        addressZipcode == other.addressZipcode &&
        addressIsDefault == other.addressIsDefault &&
        addressShipToName == other.addressShipToName &&
        addressShipToPhone == other.addressShipToPhone &&
        addressShipUserName == other.addressShipUserName &&
        addressShipUserPhone == other.addressShipUserPhone &&
        addressDeliveryInstruction == other.addressDeliveryInstruction &&
        userReference == other.userReference &&
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
                                                                0,
                                                                createdAt
                                                                    .hashCode),
                                                            addressType
                                                                .hashCode),
                                                        addressLabelName
                                                            .hashCode),
                                                    addressLine1.hashCode),
                                                addressLine2.hashCode),
                                            addressCity.hashCode),
                                        addressZipcode.hashCode),
                                    addressIsDefault.hashCode),
                                addressShipToName.hashCode),
                            addressShipToPhone.hashCode),
                        addressShipUserName.hashCode),
                    addressShipUserPhone.hashCode),
                addressDeliveryInstruction.hashCode),
            userReference.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressRecord')
          ..add('createdAt', createdAt)
          ..add('addressType', addressType)
          ..add('addressLabelName', addressLabelName)
          ..add('addressLine1', addressLine1)
          ..add('addressLine2', addressLine2)
          ..add('addressCity', addressCity)
          ..add('addressZipcode', addressZipcode)
          ..add('addressIsDefault', addressIsDefault)
          ..add('addressShipToName', addressShipToName)
          ..add('addressShipToPhone', addressShipToPhone)
          ..add('addressShipUserName', addressShipUserName)
          ..add('addressShipUserPhone', addressShipUserPhone)
          ..add('addressDeliveryInstruction', addressDeliveryInstruction)
          ..add('userReference', userReference)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddressRecordBuilder
    implements Builder<AddressRecord, AddressRecordBuilder> {
  _$AddressRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<String>? _addressType;
  ListBuilder<String> get addressType =>
      _$this._addressType ??= new ListBuilder<String>();
  set addressType(ListBuilder<String>? addressType) =>
      _$this._addressType = addressType;

  String? _addressLabelName;
  String? get addressLabelName => _$this._addressLabelName;
  set addressLabelName(String? addressLabelName) =>
      _$this._addressLabelName = addressLabelName;

  String? _addressLine1;
  String? get addressLine1 => _$this._addressLine1;
  set addressLine1(String? addressLine1) => _$this._addressLine1 = addressLine1;

  String? _addressLine2;
  String? get addressLine2 => _$this._addressLine2;
  set addressLine2(String? addressLine2) => _$this._addressLine2 = addressLine2;

  String? _addressCity;
  String? get addressCity => _$this._addressCity;
  set addressCity(String? addressCity) => _$this._addressCity = addressCity;

  int? _addressZipcode;
  int? get addressZipcode => _$this._addressZipcode;
  set addressZipcode(int? addressZipcode) =>
      _$this._addressZipcode = addressZipcode;

  bool? _addressIsDefault;
  bool? get addressIsDefault => _$this._addressIsDefault;
  set addressIsDefault(bool? addressIsDefault) =>
      _$this._addressIsDefault = addressIsDefault;

  String? _addressShipToName;
  String? get addressShipToName => _$this._addressShipToName;
  set addressShipToName(String? addressShipToName) =>
      _$this._addressShipToName = addressShipToName;

  int? _addressShipToPhone;
  int? get addressShipToPhone => _$this._addressShipToPhone;
  set addressShipToPhone(int? addressShipToPhone) =>
      _$this._addressShipToPhone = addressShipToPhone;

  String? _addressShipUserName;
  String? get addressShipUserName => _$this._addressShipUserName;
  set addressShipUserName(String? addressShipUserName) =>
      _$this._addressShipUserName = addressShipUserName;

  int? _addressShipUserPhone;
  int? get addressShipUserPhone => _$this._addressShipUserPhone;
  set addressShipUserPhone(int? addressShipUserPhone) =>
      _$this._addressShipUserPhone = addressShipUserPhone;

  String? _addressDeliveryInstruction;
  String? get addressDeliveryInstruction => _$this._addressDeliveryInstruction;
  set addressDeliveryInstruction(String? addressDeliveryInstruction) =>
      _$this._addressDeliveryInstruction = addressDeliveryInstruction;

  DocumentReference<Object?>? _userReference;
  DocumentReference<Object?>? get userReference => _$this._userReference;
  set userReference(DocumentReference<Object?>? userReference) =>
      _$this._userReference = userReference;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddressRecordBuilder() {
    AddressRecord._initializeBuilder(this);
  }

  AddressRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _addressType = $v.addressType?.toBuilder();
      _addressLabelName = $v.addressLabelName;
      _addressLine1 = $v.addressLine1;
      _addressLine2 = $v.addressLine2;
      _addressCity = $v.addressCity;
      _addressZipcode = $v.addressZipcode;
      _addressIsDefault = $v.addressIsDefault;
      _addressShipToName = $v.addressShipToName;
      _addressShipToPhone = $v.addressShipToPhone;
      _addressShipUserName = $v.addressShipUserName;
      _addressShipUserPhone = $v.addressShipUserPhone;
      _addressDeliveryInstruction = $v.addressDeliveryInstruction;
      _userReference = $v.userReference;
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
              createdAt: createdAt,
              addressType: _addressType?.build(),
              addressLabelName: addressLabelName,
              addressLine1: addressLine1,
              addressLine2: addressLine2,
              addressCity: addressCity,
              addressZipcode: addressZipcode,
              addressIsDefault: addressIsDefault,
              addressShipToName: addressShipToName,
              addressShipToPhone: addressShipToPhone,
              addressShipUserName: addressShipUserName,
              addressShipUserPhone: addressShipUserPhone,
              addressDeliveryInstruction: addressDeliveryInstruction,
              userReference: userReference,
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
