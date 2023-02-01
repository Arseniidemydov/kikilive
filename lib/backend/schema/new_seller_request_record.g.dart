// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_seller_request_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewSellerRequestRecord> _$newSellerRequestRecordSerializer =
    new _$NewSellerRequestRecordSerializer();

class _$NewSellerRequestRecordSerializer
    implements StructuredSerializer<NewSellerRequestRecord> {
  @override
  final Iterable<Type> types = const [
    NewSellerRequestRecord,
    _$NewSellerRequestRecord
  ];
  @override
  final String wireName = 'NewSellerRequestRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NewSellerRequestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isApproved;
    if (value != null) {
      result
        ..add('Is_approved')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userImg;
    if (value != null) {
      result
        ..add('user_img')
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
  NewSellerRequestRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewSellerRequestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Is_approved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_img':
          result.userImg = serializers.deserialize(value,
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

class _$NewSellerRequestRecord extends NewSellerRequestRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? userName;
  @override
  final bool? isApproved;
  @override
  final String? message;
  @override
  final DateTime? createdAt;
  @override
  final String? status;
  @override
  final String? userImg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NewSellerRequestRecord(
          [void Function(NewSellerRequestRecordBuilder)? updates]) =>
      (new NewSellerRequestRecordBuilder()..update(updates))._build();

  _$NewSellerRequestRecord._(
      {this.user,
      this.userName,
      this.isApproved,
      this.message,
      this.createdAt,
      this.status,
      this.userImg,
      this.ffRef})
      : super._();

  @override
  NewSellerRequestRecord rebuild(
          void Function(NewSellerRequestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewSellerRequestRecordBuilder toBuilder() =>
      new NewSellerRequestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewSellerRequestRecord &&
        user == other.user &&
        userName == other.userName &&
        isApproved == other.isApproved &&
        message == other.message &&
        createdAt == other.createdAt &&
        status == other.status &&
        userImg == other.userImg &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, user.hashCode), userName.hashCode),
                            isApproved.hashCode),
                        message.hashCode),
                    createdAt.hashCode),
                status.hashCode),
            userImg.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewSellerRequestRecord')
          ..add('user', user)
          ..add('userName', userName)
          ..add('isApproved', isApproved)
          ..add('message', message)
          ..add('createdAt', createdAt)
          ..add('status', status)
          ..add('userImg', userImg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NewSellerRequestRecordBuilder
    implements Builder<NewSellerRequestRecord, NewSellerRequestRecordBuilder> {
  _$NewSellerRequestRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  bool? _isApproved;
  bool? get isApproved => _$this._isApproved;
  set isApproved(bool? isApproved) => _$this._isApproved = isApproved;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _userImg;
  String? get userImg => _$this._userImg;
  set userImg(String? userImg) => _$this._userImg = userImg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NewSellerRequestRecordBuilder() {
    NewSellerRequestRecord._initializeBuilder(this);
  }

  NewSellerRequestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _userName = $v.userName;
      _isApproved = $v.isApproved;
      _message = $v.message;
      _createdAt = $v.createdAt;
      _status = $v.status;
      _userImg = $v.userImg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewSellerRequestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewSellerRequestRecord;
  }

  @override
  void update(void Function(NewSellerRequestRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewSellerRequestRecord build() => _build();

  _$NewSellerRequestRecord _build() {
    final _$result = _$v ??
        new _$NewSellerRequestRecord._(
            user: user,
            userName: userName,
            isApproved: isApproved,
            message: message,
            createdAt: createdAt,
            status: status,
            userImg: userImg,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
