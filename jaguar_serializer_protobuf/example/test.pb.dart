///
//  Generated code. Do not modify.
//  source: test.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

//  Generated code. Do not modify.
//  source: test.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import
// ignore: UNUSED_SHOWN_NAME

class Person extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Person')
    ..aOS(1, 'name')
    ..a<int>(2, 'id', $pb.PbFieldType.O3)
    ..aOS(3, 'email')
    ..hasRequiredFields = false;

  Person() : super();

  Person.fromBuffer(List<int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);

  Person.fromJson(String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);

  Person clone() => new Person()..mergeFromMessage(this);

  // ignore: return_of_invalid_type
  Person copyWith(void Function(Person) updates) =>
      super.copyWith((message) => updates(message as Person));

  $pb.BuilderInfo get info_ => _i;

  static Person create() => new Person();

  static $pb.PbList<Person> createRepeated() => new $pb.PbList<Person>();

  static Person getDefault() => _defaultInstance ??= create()..freeze();
  static Person _defaultInstance;

  static void $checkItem(Person v) {
    if (v is! Person) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get name => $_getS(0, '');

  set name(String v) {
    $_setString(0, v);
  }

  bool hasName() => $_has(0);

  void clearName() => clearField(1);

  int get id => $_get(1, 0);

  set id(int v) {
    $_setSignedInt32(1, v);
  }

  bool hasId() => $_has(1);

  void clearId() => clearField(2);

  String get email => $_getS(2, '');

  set email(String v) {
    $_setString(2, v);
  }

  bool hasEmail() => $_has(2);

  void clearEmail() => clearField(3);
}
