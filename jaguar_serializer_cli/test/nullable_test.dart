import 'common/models/nullable/nullable.dart';
import 'common/models/base/base.dart';
import 'package:test/test.dart';

void main() {
  final now = new DateTime.now();

  final buildModel = () => new Model()
    ..date = now
    ..foo = "bar"
    ..listDates = [now]
    ..mapDates = {"1": now}
    ..modelInt = new ModelInt()
    ..listModelInt = [new ModelInt()]
    ..mapModelInt = {"1": new ModelInt()};

  Model model;
  Map<String, dynamic> map;

  group("Nullable", () {
    final serializer = new NullableSerializer();

    group("encode", () {
      setUp(() {
        model = buildModel();
      });

      test("should have value null", () {
        model.foo = null;
        final res = serializer.toMap(model);
        expect(res.containsKey("foo"), isTrue);
        expect(res["foo"], isNull);
        expect(res["modelInt"], isNotNull);
      });

      test("should have object null", () {
        model.modelInt = null;
        final res = serializer.toMap(model);
        expect(res.containsKey("modelInt"), isTrue);
        expect(res["modelInt"], isNull);
        expect(res["foo"], isNotNull);
      });

      test("should have processor null", () {
        model.date = null;
        final res = serializer.toMap(model);
        expect(res.containsKey("date"), isTrue);
        expect(res["date"], isNull);
        expect(res["foo"], isNotNull);
      });

      test("should have list object null", () {
        model.listModelInt = [null];
        final res = serializer.toMap(model);
        expect(res.containsKey("listModelInt"), isTrue);
        expect(res["listModelInt"], isNotNull);
        expect(res["listModelInt"], [null]);
        expect(res["foo"], isNotNull);
      });

      test("should have list processor null", () {
        model.listDates = [null];
        final res = serializer.toMap(model);
        expect(res.containsKey("listDates"), isTrue);
        expect(res["listDates"], isNotNull);
        expect(res["listDates"], [null]);
        expect(res["foo"], isNotNull);
      });

      test("should have map object null", () {
        model.mapModelInt = {"1": null};
        final res = serializer.toMap(model);
        expect(res.containsKey("mapModelInt"), isTrue);
        expect(res["mapModelInt"], isNotNull);
        expect(res["mapModelInt"], {"1": null});
        expect(res["foo"], isNotNull);
      });

      test("should have map processor null", () {
        model.mapDates = {"1": null};
        final res = serializer.toMap(model);
        expect(res.containsKey("mapDates"), isTrue);
        expect(res["mapDates"], isNotNull);
        expect(res["mapDates"], {"1": null});
        expect(res["foo"], isNotNull);
      });

      test("should have null List/Map", () {
        model = new Model();
        final res = serializer.toMap(model);

        expect(res["listModelInt"], isNull);
        expect(res["listDates"], isNull);
        expect(res["mapModelInt"], isNull);
        expect(res["mapDates"], isNull);
      });
    });

    group("decode", () {
      setUp(() {
        model = buildModel();
        map = serializer.toMap(model);
      });

      test("should have value null", () {
        map["foo"] = null;
        final res = serializer.fromMap(map);
        expect(res.foo, isNull);
        expect(res.modelInt, isNotNull);
      });

      test("should have object null", () {
        map["modelInt"] = null;
        final res = serializer.fromMap(map);
        expect(res.modelInt, isNull);
        expect(res.foo, isNotNull);
      });

      test("should have processor null", () {
        map["date"] = null;
        final res = serializer.fromMap(map);
        expect(res.date, isNull);
        expect(res.foo, isNotNull);
      });

      test("should have list object null", () {
        map["listModelInt"] = [null];
        final res = serializer.fromMap(map);
        expect(res.listModelInt, [null]);
        expect(res.foo, isNotNull);
      });

      test("should have list processor null", () {
        map["listDates"] = [null];
        final res = serializer.fromMap(map);
        expect(res.listDates, [null]);
        expect(res.foo, isNotNull);
      });

      test("should have map object null", () {
        map["mapModelInt"] = {"1": null};
        final res = serializer.fromMap(map);
        expect(res.mapModelInt, {"1": null});
        expect(res.foo, isNotNull);
      });

      test("should have map processor null", () {
        map["mapDates"] = {"1": null};
        final res = serializer.fromMap(map);
        expect(res.mapDates, {"1": null});
        expect(res.foo, isNotNull);
      });

      test("should have null List/Map", () {
        final res = serializer.fromMap(<String, dynamic>{});
        expect(res.listModelInt, isNull);
        expect(res.listDates, isNull);
        expect(res.mapModelInt, isNull);
        expect(res.mapDates, isNull);
      });
    });
  });

  group("Non Nullable", () {
    final serializer = new NonNullableSerializer();
    group("encode", () {
      setUp(() {
        model = buildModel();
      });

      test("should have value null", () {
        model.foo = null;
        final res = serializer.toMap(model);
        expect(res.containsKey("foo"), isFalse);
        expect(res["modelInt"], isNotNull);
      });

      test("should have object null", () {
        model.modelInt = null;
        final res = serializer.toMap(model);
        expect(res.containsKey("modelInt"), isFalse);
        expect(res["foo"], isNotNull);
      });

      test("should have processor null", () {
        model.date = null;
        final res = serializer.toMap(model);
        expect(res.containsKey("date"), isFalse);
        expect(res["foo"], isNotNull);
      });

      test("should have list object null", () {
        model.listModelInt = [null];
        final res = serializer.toMap(model);
        expect(res.containsKey("listModelInt"), isTrue);
        expect(res["listModelInt"], isNotNull);
        expect(res["listModelInt"], [null]);
        expect(res["foo"], isNotNull);
      });

      test("should have list processor null", () {
        model.listDates = [null];
        final res = serializer.toMap(model);
        expect(res.containsKey("listDates"), isTrue);
        expect(res["listDates"], isNotNull);
        expect(res["listDates"], [null]);
        expect(res["foo"], isNotNull);
      });

      test("should have map object null", () {
        model.mapModelInt = {"1": null};
        final res = serializer.toMap(model);
        expect(res.containsKey("mapModelInt"), isTrue);
        expect(res["mapModelInt"], isNotNull);
        expect(res["mapModelInt"], {"1": null});
        expect(res["foo"], isNotNull);
      });

      test("should have map processor null", () {
        model.mapDates = {"1": null};
        final res = serializer.toMap(model);
        expect(res.containsKey("mapDates"), isTrue);
        expect(res["mapDates"], isNotNull);
        expect(res["mapDates"], {"1": null});
        expect(res["foo"], isNotNull);
      });

      test("should not have null List/Map", () {
        model = new Model();
        final res = serializer.toMap(model);

        expect(res["listModelInt"], <ModelInt>[]);
        expect(res["listDates"], <DateTime>[]);
        expect(res["mapModelInt"], <String, dynamic>{});
        expect(res["mapDates"], <String, dynamic>{});
      });
    });

    group("decode", () {
      setUp(() {
        model = buildModel();
        map = serializer.toMap(model);
      });

      test("should have empty list object for null", () {
        map["listModelInt"] = null;
        final res = serializer.fromMap(map);
        expect(res.listModelInt, <ModelInt>[]);
        expect(res.foo, isNotNull);
      });

      test("should have empty list processor for null", () {
        map["listDates"] = null;
        final res = serializer.fromMap(map);
        expect(res.listDates, <DateTime>[]);
        expect(res.foo, isNotNull);
      });

      test("should have empty object for null list object", () {
        map["mapModelInt"] = null;
        final res = serializer.fromMap(map);
        expect(res.mapModelInt, <String, dynamic>{});
        expect(res.foo, isNotNull);
      });

      test("should have empty object for null list processor", () {
        map["mapDates"] = null;
        final res = serializer.fromMap(map);
        expect(res.mapDates, <String, DateTime>{});
        expect(res.foo, isNotNull);
      });

      test("should not have null List/Map", () {
        final res = serializer.fromMap(<String, dynamic>{});
        expect(res.listModelInt, <ModelInt>[]);
        expect(res.listDates, <DateTime>[]);
        expect(res.mapModelInt, <String, ModelInt>{});
        expect(res.mapDates, <String, DateTime>{});
      });
    });
  });

  final serializerModelInt = new ModelIntSerializer();

  test("toMap(null) should return null", () {
    final res = serializerModelInt.toMap(null);
    expect(res, isNull);
  });

  test("fromMap(null) should return null", () {
    final res = serializerModelInt.fromMap(null);
    expect(res, isNull);
  });

  test("fromMap({}) should return object", () {
    final res = serializerModelInt.fromMap(<String, dynamic>{});
    expect(res, isNotNull);
    expect(res is ModelInt, isTrue);
  });
}
