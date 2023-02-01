// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubCategoryRecord> _$subCategoryRecordSerializer =
    new _$SubCategoryRecordSerializer();

class _$SubCategoryRecordSerializer
    implements StructuredSerializer<SubCategoryRecord> {
  @override
  final Iterable<Type> types = const [SubCategoryRecord, _$SubCategoryRecord];
  @override
  final String wireName = 'SubCategoryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubCategoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.subCategoryName;
    if (value != null) {
      result
        ..add('sub_category_name')
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
  SubCategoryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubCategoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sub_category_name':
          result.subCategoryName = serializers.deserialize(value,
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

class _$SubCategoryRecord extends SubCategoryRecord {
  @override
  final DocumentReference<Object?>? category;
  @override
  final String? subCategoryName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SubCategoryRecord(
          [void Function(SubCategoryRecordBuilder)? updates]) =>
      (new SubCategoryRecordBuilder()..update(updates))._build();

  _$SubCategoryRecord._({this.category, this.subCategoryName, this.ffRef})
      : super._();

  @override
  SubCategoryRecord rebuild(void Function(SubCategoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubCategoryRecordBuilder toBuilder() =>
      new SubCategoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubCategoryRecord &&
        category == other.category &&
        subCategoryName == other.subCategoryName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, category.hashCode), subCategoryName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubCategoryRecord')
          ..add('category', category)
          ..add('subCategoryName', subCategoryName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SubCategoryRecordBuilder
    implements Builder<SubCategoryRecord, SubCategoryRecordBuilder> {
  _$SubCategoryRecord? _$v;

  DocumentReference<Object?>? _category;
  DocumentReference<Object?>? get category => _$this._category;
  set category(DocumentReference<Object?>? category) =>
      _$this._category = category;

  String? _subCategoryName;
  String? get subCategoryName => _$this._subCategoryName;
  set subCategoryName(String? subCategoryName) =>
      _$this._subCategoryName = subCategoryName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SubCategoryRecordBuilder() {
    SubCategoryRecord._initializeBuilder(this);
  }

  SubCategoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _subCategoryName = $v.subCategoryName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubCategoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubCategoryRecord;
  }

  @override
  void update(void Function(SubCategoryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubCategoryRecord build() => _build();

  _$SubCategoryRecord _build() {
    final _$result = _$v ??
        new _$SubCategoryRecord._(
            category: category, subCategoryName: subCategoryName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
