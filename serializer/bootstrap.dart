// GENERATED CODE - DO NOT MODIFY BY HAND

library jaguar_serializer.serializer.bootstrap;

import 'package:jaguar_serializer/serializer.dart';
import '../example/basic/basic_main.dart' as _1;
import '../example/field_manipulation/field_manipulation_main.dart' as _2;
import '../example/custom_field_processor/custom_field_processor.dart' as _3;
import '../example/user/user/user.dart' as _4;
import '../example/user/user/user_mongo.dart' as _5;
import '../example/user/book/book.dart' as _6;
import '../example/user/book/book_mongo.dart' as _7;
import '../test/serializer/common/models/player/player.dart' as _8;
import '../test/serializer/common/models/bibliotek/author.dart' as _9;
import '../test/serializer/common/models/bibliotek/book.dart' as _10;
import '../test/serializer/common/models/address_book/address_book.dart' as _11;
import '../test/serializer/various/various.dart' as _12;

void bootstrap() {
  JaguarSerializer.addSerializer(new _1.PlayerSerializer());
  JaguarSerializer.addSerializer(new _1.AddressSerializer());
  JaguarSerializer.addSerializer(new _2.PlayerJsonSerializer());
  JaguarSerializer.addSerializer(new _3.PlayerMongoSerializer());
  JaguarSerializer.addSerializer(new _4.UserViewSerializer());
  JaguarSerializer.addSerializer(new _5.UserMongoSerializer());
  JaguarSerializer.addSerializer(new _6.BookViewSerializer());
  JaguarSerializer.addSerializer(new _7.BookMongoSerializer());
  JaguarSerializer.addSerializer(new _8.PlayerSerializer());
  JaguarSerializer.addSerializer(new _8.PlayerSerializerIgnore());
  JaguarSerializer.addSerializer(new _8.PlayerSerializerIgnores());
  JaguarSerializer.addSerializer(new _8.PlayerSerializerRename());
  JaguarSerializer.addSerializer(new _9.AuthorSerializer());
  JaguarSerializer.addSerializer(new _10.BookSerializer());
  JaguarSerializer.addSerializer(new _11.Person());
  JaguarSerializer.addSerializer(new _11.Address());
  JaguarSerializer.addSerializer(new _12.ModelIntSerializer());
  JaguarSerializer.addSerializer(new _12.ModelDoubleSerializer());
  JaguarSerializer.addSerializer(new _12.InheritanceSerializer());
  JaguarSerializer.addSerializer(new _12.DateSerializer());
  JaguarSerializer.addSerializer(new _12.NullTestSerializer());
  JaguarSerializer.addSerializer(new _12.WithIgnoreSerializer());
  JaguarSerializer.addSerializer(new _12.ModelRenamedSerializer());
  JaguarSerializer.addSerializer(new _12.ComplexSerializer());
}
// **************************************************************************
