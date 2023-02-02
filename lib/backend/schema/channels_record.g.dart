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
    value = object.channelOwner;
    if (value != null) {
      result
        ..add('channel_owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.shopType;
    if (value != null) {
      result
        ..add('shop_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelDesc;
    if (value != null) {
      result
        ..add('channel_desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelViews;
    if (value != null) {
      result
        ..add('channel_views')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.channelVideoUrl;
    if (value != null) {
      result
        ..add('channel_video_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.channelCreatedOn;
    if (value != null) {
      result
        ..add('channel_created_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.channelPrice;
    if (value != null) {
      result
        ..add('channel_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.channelStatus;
    if (value != null) {
      result
        ..add('channel_status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.channelImage;
    if (value != null) {
      result
        ..add('channel_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.messageReason;
    if (value != null) {
      result
        ..add('message_reason')
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
        case 'channel_owner':
          result.channelOwner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'shop_type':
          result.shopType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_desc':
          result.channelDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_views':
          result.channelViews = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'channel_video_url':
          result.channelVideoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_created_on':
          result.channelCreatedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'channel_price':
          result.channelPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'channel_status':
          result.channelStatus = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'channel_image':
          result.channelImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message_reason':
          result.messageReason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'channel_members':
          result.channelMembers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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
  final DocumentReference<Object?>? channelOwner;
  @override
  final String? shopType;
  @override
  final String? channelDesc;
  @override
  final int? channelViews;
  @override
  final String? channelVideoUrl;
  @override
  final DateTime? channelCreatedOn;
  @override
  final double? channelPrice;
  @override
  final bool? channelStatus;
  @override
  final String? channelImage;
  @override
  final String? messageReason;
  @override
  final BuiltList<DocumentReference<Object?>>? channelMembers;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChannelsRecord([void Function(ChannelsRecordBuilder)? updates]) =>
      (new ChannelsRecordBuilder()..update(updates))._build();

  _$ChannelsRecord._(
      {this.channelName,
      this.channelType,
      this.channelOwner,
      this.shopType,
      this.channelDesc,
      this.channelViews,
      this.channelVideoUrl,
      this.channelCreatedOn,
      this.channelPrice,
      this.channelStatus,
      this.channelImage,
      this.messageReason,
      this.channelMembers,
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
        channelOwner == other.channelOwner &&
        shopType == other.shopType &&
        channelDesc == other.channelDesc &&
        channelViews == other.channelViews &&
        channelVideoUrl == other.channelVideoUrl &&
        channelCreatedOn == other.channelCreatedOn &&
        channelPrice == other.channelPrice &&
        channelStatus == other.channelStatus &&
        channelImage == other.channelImage &&
        messageReason == other.messageReason &&
        channelMembers == other.channelMembers &&
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
                                                            0,
                                                            channelName
                                                                .hashCode),
                                                        channelType.hashCode),
                                                    channelOwner.hashCode),
                                                shopType.hashCode),
                                            channelDesc.hashCode),
                                        channelViews.hashCode),
                                    channelVideoUrl.hashCode),
                                channelCreatedOn.hashCode),
                            channelPrice.hashCode),
                        channelStatus.hashCode),
                    channelImage.hashCode),
                messageReason.hashCode),
            channelMembers.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChannelsRecord')
          ..add('channelName', channelName)
          ..add('channelType', channelType)
          ..add('channelOwner', channelOwner)
          ..add('shopType', shopType)
          ..add('channelDesc', channelDesc)
          ..add('channelViews', channelViews)
          ..add('channelVideoUrl', channelVideoUrl)
          ..add('channelCreatedOn', channelCreatedOn)
          ..add('channelPrice', channelPrice)
          ..add('channelStatus', channelStatus)
          ..add('channelImage', channelImage)
          ..add('messageReason', messageReason)
          ..add('channelMembers', channelMembers)
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

  DocumentReference<Object?>? _channelOwner;
  DocumentReference<Object?>? get channelOwner => _$this._channelOwner;
  set channelOwner(DocumentReference<Object?>? channelOwner) =>
      _$this._channelOwner = channelOwner;

  String? _shopType;
  String? get shopType => _$this._shopType;
  set shopType(String? shopType) => _$this._shopType = shopType;

  String? _channelDesc;
  String? get channelDesc => _$this._channelDesc;
  set channelDesc(String? channelDesc) => _$this._channelDesc = channelDesc;

  int? _channelViews;
  int? get channelViews => _$this._channelViews;
  set channelViews(int? channelViews) => _$this._channelViews = channelViews;

  String? _channelVideoUrl;
  String? get channelVideoUrl => _$this._channelVideoUrl;
  set channelVideoUrl(String? channelVideoUrl) =>
      _$this._channelVideoUrl = channelVideoUrl;

  DateTime? _channelCreatedOn;
  DateTime? get channelCreatedOn => _$this._channelCreatedOn;
  set channelCreatedOn(DateTime? channelCreatedOn) =>
      _$this._channelCreatedOn = channelCreatedOn;

  double? _channelPrice;
  double? get channelPrice => _$this._channelPrice;
  set channelPrice(double? channelPrice) => _$this._channelPrice = channelPrice;

  bool? _channelStatus;
  bool? get channelStatus => _$this._channelStatus;
  set channelStatus(bool? channelStatus) =>
      _$this._channelStatus = channelStatus;

  String? _channelImage;
  String? get channelImage => _$this._channelImage;
  set channelImage(String? channelImage) => _$this._channelImage = channelImage;

  String? _messageReason;
  String? get messageReason => _$this._messageReason;
  set messageReason(String? messageReason) =>
      _$this._messageReason = messageReason;

  ListBuilder<DocumentReference<Object?>>? _channelMembers;
  ListBuilder<DocumentReference<Object?>> get channelMembers =>
      _$this._channelMembers ??= new ListBuilder<DocumentReference<Object?>>();
  set channelMembers(ListBuilder<DocumentReference<Object?>>? channelMembers) =>
      _$this._channelMembers = channelMembers;

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
      _channelOwner = $v.channelOwner;
      _shopType = $v.shopType;
      _channelDesc = $v.channelDesc;
      _channelViews = $v.channelViews;
      _channelVideoUrl = $v.channelVideoUrl;
      _channelCreatedOn = $v.channelCreatedOn;
      _channelPrice = $v.channelPrice;
      _channelStatus = $v.channelStatus;
      _channelImage = $v.channelImage;
      _messageReason = $v.messageReason;
      _channelMembers = $v.channelMembers?.toBuilder();
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
              channelOwner: channelOwner,
              shopType: shopType,
              channelDesc: channelDesc,
              channelViews: channelViews,
              channelVideoUrl: channelVideoUrl,
              channelCreatedOn: channelCreatedOn,
              channelPrice: channelPrice,
              channelStatus: channelStatus,
              channelImage: channelImage,
              messageReason: messageReason,
              channelMembers: _channelMembers?.build(),
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
