library example.user.mongo;

import 'package:jaguar_serializer/serializer.dart';
import '../../_common/mongo_serializer/import.dart';
import 'user.dart';
import '../book/book_mongo.dart';

export 'user.dart' show User;

part 'user_mongo.g.dart';

@GenSerializer()
@MongoId(#id)
@DateTimeSerializer(#dob)
@EnDecodeField(#name, asAndFrom: 'N')
@ProvideSerializers(const <String, Type>{
  "Book": BookMongoSerializer
})
@IgnoreFields(const [#viewSerializer])
class UserMongoSerializer extends MapSerializer<User>
    with _$UserMongoSerializer {
  User createModel() => new User();

  UserMongoSerializer() {
    providers[Book] = new BookMongoSerializer();
  }

  UserMongoSerializer.FromMap(Map map) {
    providers[Book] = new BookMongoSerializer();
    fromMap(map);
  }
}

/*
abstract class _$UserMongoSerializer {
  User get _model;

  Map toMap() => {
    "_id": new MongoId(null).to(_model.id),
    "email": _model.email,
    "N": _model.name,
  };

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = new MongoId(null).from(map['_id']);
    _model.email = map['email'];
    _model.name = map['N'];
  }
}
 */
