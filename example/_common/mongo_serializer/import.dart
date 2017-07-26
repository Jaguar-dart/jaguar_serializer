library serializer.mongo_serializer;

import 'package:mongo_dart/mongo_dart.dart' as mgo;
import 'package:jaguar_serializer/jaguar_serializer.dart';

abstract class SerializableToMongo {
  Serializer get mongoSerializer;
}

class MongoId implements FieldProcessor<String, mgo.ObjectId> {
  const MongoId();

  String deserialize(mgo.ObjectId input) {
    return input.toHexString();
  }

  mgo.ObjectId serialize(String value) {
    return new mgo.ObjectId.fromHexString(value);
  }
}

class MongoRefId {
  const MongoRefId();
}
