// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streams_comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StreamsCommentsRecord> _$streamsCommentsRecordSerializer =
    new _$StreamsCommentsRecordSerializer();

class _$StreamsCommentsRecordSerializer
    implements StructuredSerializer<StreamsCommentsRecord> {
  @override
  final Iterable<Type> types = const [
    StreamsCommentsRecord,
    _$StreamsCommentsRecord
  ];
  @override
  final String wireName = 'StreamsCommentsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, StreamsCommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.streamReference;
    if (value != null) {
      result
        ..add('stream_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.streamComment;
    if (value != null) {
      result
        ..add('stream_comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.streamUserReference;
    if (value != null) {
      result
        ..add('stream_user_reference')
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
  StreamsCommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamsCommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stream_reference':
          result.streamReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'stream_comment':
          result.streamComment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stream_user_reference':
          result.streamUserReference = serializers.deserialize(value,
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

class _$StreamsCommentsRecord extends StreamsCommentsRecord {
  @override
  final DocumentReference<Object?>? streamReference;
  @override
  final String? streamComment;
  @override
  final DocumentReference<Object?>? streamUserReference;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StreamsCommentsRecord(
          [void Function(StreamsCommentsRecordBuilder)? updates]) =>
      (new StreamsCommentsRecordBuilder()..update(updates))._build();

  _$StreamsCommentsRecord._(
      {this.streamReference,
      this.streamComment,
      this.streamUserReference,
      this.createdAt,
      this.ffRef})
      : super._();

  @override
  StreamsCommentsRecord rebuild(
          void Function(StreamsCommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamsCommentsRecordBuilder toBuilder() =>
      new StreamsCommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamsCommentsRecord &&
        streamReference == other.streamReference &&
        streamComment == other.streamComment &&
        streamUserReference == other.streamUserReference &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, streamReference.hashCode), streamComment.hashCode),
                streamUserReference.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StreamsCommentsRecord')
          ..add('streamReference', streamReference)
          ..add('streamComment', streamComment)
          ..add('streamUserReference', streamUserReference)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StreamsCommentsRecordBuilder
    implements Builder<StreamsCommentsRecord, StreamsCommentsRecordBuilder> {
  _$StreamsCommentsRecord? _$v;

  DocumentReference<Object?>? _streamReference;
  DocumentReference<Object?>? get streamReference => _$this._streamReference;
  set streamReference(DocumentReference<Object?>? streamReference) =>
      _$this._streamReference = streamReference;

  String? _streamComment;
  String? get streamComment => _$this._streamComment;
  set streamComment(String? streamComment) =>
      _$this._streamComment = streamComment;

  DocumentReference<Object?>? _streamUserReference;
  DocumentReference<Object?>? get streamUserReference =>
      _$this._streamUserReference;
  set streamUserReference(DocumentReference<Object?>? streamUserReference) =>
      _$this._streamUserReference = streamUserReference;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StreamsCommentsRecordBuilder() {
    StreamsCommentsRecord._initializeBuilder(this);
  }

  StreamsCommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _streamReference = $v.streamReference;
      _streamComment = $v.streamComment;
      _streamUserReference = $v.streamUserReference;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamsCommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StreamsCommentsRecord;
  }

  @override
  void update(void Function(StreamsCommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StreamsCommentsRecord build() => _build();

  _$StreamsCommentsRecord _build() {
    final _$result = _$v ??
        new _$StreamsCommentsRecord._(
            streamReference: streamReference,
            streamComment: streamComment,
            streamUserReference: streamUserReference,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
