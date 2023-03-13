// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channels_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChannelsRecord> _$channelsRecordSerializer =
    new _$ChannelsRecordSerializer();

class _$ChannelsRecordSerializer
    implements StructuredSerializer<ChannelsRecord> {
  @override
  final Iterable<Type> types = const [ChannelsRecord, _$ChannelsRecord];
  @override
  final String wireName = 'ChannelsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChannelsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.channelName;
    if (value != null) {
      result
        ..add('channel_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelType;
    if (value != null) {
      result
        ..add('channel_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelUserReference;
    if (value != null) {
      result
        ..add('channel_user_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.channelDescription;
    if (value != null) {
      result
        ..add('channel_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelImage;
    if (value != null) {
      result
        ..add('channel_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelStatus;
    if (value != null) {
      result
        ..add('channel_status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.channelPrice;
    if (value != null) {
      result
        ..add('channel_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.channelApprovalMessage;
    if (value != null) {
      result
        ..add('channel_approval_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelMembers;
    if (value != null) {
      result
        ..add('channel_members')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.channelIsMain;
    if (value != null) {
      result
        ..add('channel_is_main')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ChannelsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChannelsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'channel_name':
          result.channelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_type':
          result.channelType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_user_reference':
          result.channelUserReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'channel_description':
          result.channelDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_image':
          result.channelImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_status':
          result.channelStatus = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'channel_price':
          result.channelPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'channel_approval_message':
          result.channelApprovalMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_members':
          result.channelMembers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'channel_is_main':
          result.channelIsMain = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ChannelsRecord extends ChannelsRecord {
  @override
  final String? channelName;
  @override
  final String? channelType;
  @override
  final DocumentReference<Object?>? channelUserReference;
  @override
  final String? channelDescription;
  @override
  final String? channelImage;
  @override
  final bool? channelStatus;
  @override
  final double? channelPrice;
  @override
  final String? channelApprovalMessage;
  @override
  final BuiltList<DocumentReference<Object?>>? channelMembers;
  @override
  final bool? channelIsMain;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChannelsRecord([void Function(ChannelsRecordBuilder)? updates]) =>
      (new ChannelsRecordBuilder()..update(updates))._build();

  _$ChannelsRecord._(
      {this.channelName,
      this.channelType,
      this.channelUserReference,
      this.channelDescription,
      this.channelImage,
      this.channelStatus,
      this.channelPrice,
      this.channelApprovalMessage,
      this.channelMembers,
      this.channelIsMain,
      this.createdAt,
      this.ffRef})
      : super._();

  @override
  ChannelsRecord rebuild(void Function(ChannelsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelsRecordBuilder toBuilder() =>
      new ChannelsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelsRecord &&
        channelName == other.channelName &&
        channelType == other.channelType &&
        channelUserReference == other.channelUserReference &&
        channelDescription == other.channelDescription &&
        channelImage == other.channelImage &&
        channelStatus == other.channelStatus &&
        channelPrice == other.channelPrice &&
        channelApprovalMessage == other.channelApprovalMessage &&
        channelMembers == other.channelMembers &&
        channelIsMain == other.channelIsMain &&
        createdAt == other.createdAt &&
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
                                            $jc($jc(0, channelName.hashCode),
                                                channelType.hashCode),
                                            channelUserReference.hashCode),
                                        channelDescription.hashCode),
                                    channelImage.hashCode),
                                channelStatus.hashCode),
                            channelPrice.hashCode),
                        channelApprovalMessage.hashCode),
                    channelMembers.hashCode),
                channelIsMain.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChannelsRecord')
          ..add('channelName', channelName)
          ..add('channelType', channelType)
          ..add('channelUserReference', channelUserReference)
          ..add('channelDescription', channelDescription)
          ..add('channelImage', channelImage)
          ..add('channelStatus', channelStatus)
          ..add('channelPrice', channelPrice)
          ..add('channelApprovalMessage', channelApprovalMessage)
          ..add('channelMembers', channelMembers)
          ..add('channelIsMain', channelIsMain)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChannelsRecordBuilder
    implements Builder<ChannelsRecord, ChannelsRecordBuilder> {
  _$ChannelsRecord? _$v;

  String? _channelName;
  String? get channelName => _$this._channelName;
  set channelName(String? channelName) => _$this._channelName = channelName;

  String? _channelType;
  String? get channelType => _$this._channelType;
  set channelType(String? channelType) => _$this._channelType = channelType;

  DocumentReference<Object?>? _channelUserReference;
  DocumentReference<Object?>? get channelUserReference =>
      _$this._channelUserReference;
  set channelUserReference(DocumentReference<Object?>? channelUserReference) =>
      _$this._channelUserReference = channelUserReference;

  String? _channelDescription;
  String? get channelDescription => _$this._channelDescription;
  set channelDescription(String? channelDescription) =>
      _$this._channelDescription = channelDescription;

  String? _channelImage;
  String? get channelImage => _$this._channelImage;
  set channelImage(String? channelImage) => _$this._channelImage = channelImage;

  bool? _channelStatus;
  bool? get channelStatus => _$this._channelStatus;
  set channelStatus(bool? channelStatus) =>
      _$this._channelStatus = channelStatus;

  double? _channelPrice;
  double? get channelPrice => _$this._channelPrice;
  set channelPrice(double? channelPrice) => _$this._channelPrice = channelPrice;

  String? _channelApprovalMessage;
  String? get channelApprovalMessage => _$this._channelApprovalMessage;
  set channelApprovalMessage(String? channelApprovalMessage) =>
      _$this._channelApprovalMessage = channelApprovalMessage;

  ListBuilder<DocumentReference<Object?>>? _channelMembers;
  ListBuilder<DocumentReference<Object?>> get channelMembers =>
      _$this._channelMembers ??= new ListBuilder<DocumentReference<Object?>>();
  set channelMembers(ListBuilder<DocumentReference<Object?>>? channelMembers) =>
      _$this._channelMembers = channelMembers;

  bool? _channelIsMain;
  bool? get channelIsMain => _$this._channelIsMain;
  set channelIsMain(bool? channelIsMain) =>
      _$this._channelIsMain = channelIsMain;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChannelsRecordBuilder() {
    ChannelsRecord._initializeBuilder(this);
  }

  ChannelsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _channelName = $v.channelName;
      _channelType = $v.channelType;
      _channelUserReference = $v.channelUserReference;
      _channelDescription = $v.channelDescription;
      _channelImage = $v.channelImage;
      _channelStatus = $v.channelStatus;
      _channelPrice = $v.channelPrice;
      _channelApprovalMessage = $v.channelApprovalMessage;
      _channelMembers = $v.channelMembers?.toBuilder();
      _channelIsMain = $v.channelIsMain;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChannelsRecord;
  }

  @override
  void update(void Function(ChannelsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChannelsRecord build() => _build();

  _$ChannelsRecord _build() {
    _$ChannelsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChannelsRecord._(
              channelName: channelName,
              channelType: channelType,
              channelUserReference: channelUserReference,
              channelDescription: channelDescription,
              channelImage: channelImage,
              channelStatus: channelStatus,
              channelPrice: channelPrice,
              channelApprovalMessage: channelApprovalMessage,
              channelMembers: _channelMembers?.build(),
              channelIsMain: channelIsMain,
              createdAt: createdAt,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'channelMembers';
        _channelMembers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChannelsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
