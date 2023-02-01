// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streaming_comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StreamingCommentsRecord> _$streamingCommentsRecordSerializer =
    new _$StreamingCommentsRecordSerializer();

class _$StreamingCommentsRecordSerializer
    implements StructuredSerializer<StreamingCommentsRecord> {
  @override
  final Iterable<Type> types = const [
    StreamingCommentsRecord,
    _$StreamingCommentsRecord
  ];
  @override
  final String wireName = 'StreamingCommentsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, StreamingCommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.streamID;
    if (value != null) {
      result
        ..add('streamID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userID;
    if (value != null) {
      result
        ..add('userID')
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
  StreamingCommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamingCommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'streamID':
          result.streamID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userID':
          result.userID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$StreamingCommentsRecord extends StreamingCommentsRecord {
  @override
  final DocumentReference<Object?>? streamID;
  @override
  final String? comment;
  @override
  final DocumentReference<Object?>? userID;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StreamingCommentsRecord(
          [void Function(StreamingCommentsRecordBuilder)? updates]) =>
      (new StreamingCommentsRecordBuilder()..update(updates))._build();

  _$StreamingCommentsRecord._(
      {this.streamID, this.comment, this.userID, this.createdAt, this.ffRef})
      : super._();

  @override
  StreamingCommentsRecord rebuild(
          void Function(StreamingCommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamingCommentsRecordBuilder toBuilder() =>
      new StreamingCommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamingCommentsRecord &&
        streamID == other.streamID &&
        comment == other.comment &&
        userID == other.userID &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, streamID.hashCode), comment.hashCode),
                userID.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StreamingCommentsRecord')
          ..add('streamID', streamID)
          ..add('comment', comment)
          ..add('userID', userID)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StreamingCommentsRecordBuilder
    implements
        Builder<StreamingCommentsRecord, StreamingCommentsRecordBuilder> {
  _$StreamingCommentsRecord? _$v;

  DocumentReference<Object?>? _streamID;
  DocumentReference<Object?>? get streamID => _$this._streamID;
  set streamID(DocumentReference<Object?>? streamID) =>
      _$this._streamID = streamID;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DocumentReference<Object?>? _userID;
  DocumentReference<Object?>? get userID => _$this._userID;
  set userID(DocumentReference<Object?>? userID) => _$this._userID = userID;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StreamingCommentsRecordBuilder() {
    StreamingCommentsRecord._initializeBuilder(this);
  }

  StreamingCommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _streamID = $v.streamID;
      _comment = $v.comment;
      _userID = $v.userID;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamingCommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StreamingCommentsRecord;
  }

  @override
  void update(void Function(StreamingCommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StreamingCommentsRecord build() => _build();

  _$StreamingCommentsRecord _build() {
    final _$result = _$v ??
        new _$StreamingCommentsRecord._(
            streamID: streamID,
            comment: comment,
            userID: userID,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
