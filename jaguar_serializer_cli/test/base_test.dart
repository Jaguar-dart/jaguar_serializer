import "common/models/base/base.dart";
import "common/models/player/player.dart";
import "package:jaguar_serializer/jaguar_serializer.dart";
import "package:test/test.dart";

void main() {
  group("Base", () {
    group("encode", () {
      Player player;

      setUp(() {
        player = new Player();
        player.name = "John";
        player.email = "john@noemail.com";
        player.age = 25;
        player.score = 1000;
        player.emailConfirmed = true;
      });

      // Check if toMap converts all fields to Map items
      test("should convert to Map<String, dynamic>", () {
        PlayerSerializer serializer = new PlayerSerializer();
        Map result = serializer.toMap(player);
        expect(result, containsPair("name", "John"));
        expect(result, containsPair("email", "john@noemail.com"));
        expect(result, containsPair("age", 25));
        expect(result, containsPair("score", 1000));
        expect(result, containsPair("emailConfirmed", true));
      });

      test("should convert to Map<String, dynamic> without null fields", () {
        player.emailConfirmed = null;

        PlayerSerializer serializer = new PlayerSerializer();

        Map result = serializer.toMap(player);
        expect(result, containsPair("name", "John"));
        expect(result, containsPair("email", "john@noemail.com"));
        expect(result, containsPair("age", 25));
        expect(result, containsPair("score", 1000));
        expect(result, isNot(contains("emailConfirmed")));
      });

      test("should ignore 'emailConfirmed' field", () {
        PlayerSerializerIgnore serializer = new PlayerSerializerIgnore();

        Map result = serializer.toMap(player);
        expect(result, containsPair("name", "John"));
        expect(result, containsPair("email", "john@noemail.com"));
        expect(result, containsPair("age", 25));
        expect(result, containsPair("score", 1000));
        expect(result, isNot(contains("emailConfirmed")));
      });

      test("should ignore multiple fields", () {
        PlayerSerializerIgnores serializer = new PlayerSerializerIgnores();

        Map result = serializer.toMap(player);
        expect(result, containsPair("name", "John"));
        expect(result, containsPair("score", 1000));
        expect(result, isNot(contains("email")));
        expect(result, isNot(contains("age")));
        expect(result, isNot(contains("emailConfirmed")));
      });

      test("should rename fields", () {
        PlayerSerializerRename serializer = new PlayerSerializerRename();
        Map result = serializer.toMap(player);
        expect(result, containsPair("N", "John"));
        expect(result, containsPair("S", 1000));
        expect(result, containsPair("eC", true));
      });

      // Check if toMap converts all fields to Map items
      test("should exclude all fields by default", () {
        ExcludeByDefaultCodec serializer = new ExcludeByDefaultCodec();
        ExcludeByDefault model = new ExcludeByDefault();
        model.id = "2";
        model.name = "kleak";
        model.email = "cryptic";
        model.number = 2;

        Map result = serializer.toMap(model);
        expect(result, containsPair("id", "2"));
        expect(result, containsPair("name", "kleak"));
        expect(result, isNot(contains("email")));
        expect(result, isNot(contains("number")));
      });
    });

    group("decode", () {
      Map<String, dynamic> m;

      setUp(() {
        m = <String, dynamic>{};
        m["name"] = "John";
        m["email"] = "john@noemail.com";
        m["age"] = 25;
        m["score"] = 1000;
        m["emailConfirmed"] = true;
      });

      // Check if fromMap converts all Map items to fields
      test("should decode map to Player", () {
        PlayerSerializer serializer = new PlayerSerializer();
        Player player = serializer.fromMap(m);
        expect(player.name, "John");
        expect(player.email, "john@noemail.com");
        expect(player.age, 25);
        expect(player.score, 1000);
        expect(player.emailConfirmed, true);
      });

      // When field not present in Map
      test("should decode map to Player with null field", () {
        m.remove("emailConfirmed");

        PlayerSerializer serializer = new PlayerSerializer();
        Player player = serializer.fromMap(m);
        expect(player.name, "John");
        expect(player.email, "john@noemail.com");
        expect(player.age, 25);
        expect(player.score, 1000);
        expect(player.emailConfirmed, isNull);
      });

      // Ignore field
      test("should ignore field in map", () {
        PlayerSerializerIgnore serializer = new PlayerSerializerIgnore();
        Player player = serializer.fromMap(m);
        expect(player.name, "John");
        expect(player.email, "john@noemail.com");
        expect(player.age, 25);
        expect(player.score, 1000);
        expect(player.emailConfirmed, isNull);
      });

      // Ignore fields
      test("should ignore multiple fields in map", () {
        PlayerSerializerIgnores serializer = new PlayerSerializerIgnores();
        Player player = serializer.fromMap(m);
        expect(player.name, "John");
        expect(player.email, isNull);
        expect(player.age, isNull);
        expect(player.score, 1000);
        expect(player.emailConfirmed, isNull);
      });

      test("should handle renamed field", () {
        m = <String, dynamic>{};
        m["N"] = "John";
        m["email"] = "john@noemail.com";
        m["age"] = 25;
        m["S"] = 1000; // EncodeOnly
        m["eC"] = true;

        PlayerSerializerRename serializer = new PlayerSerializerRename();
        Player player = serializer.fromMap(m);
        expect(player.name, "John");
        expect(player.email, "john@noemail.com");
        expect(player.age, 25);
        expect(player.score, isNull);
        expect(player.emailConfirmed, true);
      });
    });

    test("should handle inheritance", () {
      Inheritance d = new Inheritance();
      final serializer = new InheritanceSerializer();
      expect(serializer.serialize(d),
          {"clazzA": "ClassA", "clazzB": "inheritance"});
      expect(serializer.serialize(d, withType: true), {
        "clazzA": "ClassA",
        "clazzB": "inheritance",
        defaultTypeInfoKey: "Inheritance"
      });
    });

    test("should handle int", () {
      ModelInt d = new ModelInt();
      final serializer = new ModelIntSerializer();
      expect(serializer.serialize(d), {"bar": 42, "clazzA": "ClassA"});
      expect(serializer.serialize(d, withType: true),
          {"bar": 42, "clazzA": "ClassA", defaultTypeInfoKey: "ModelInt"});
    });

    test("should handle double", () {
      ModelDouble d = new ModelDouble();
      final serializer = new ModelDoubleSerializer();
      expect(serializer.serialize(d), {"bar": 42.42, "clazzA": "ClassA"});
      expect(serializer.serialize(d, withType: true), {
        "bar": 42.42,
        "clazzA": "ClassA",
        defaultTypeInfoKey: "ModelDouble"
      });
    });

    test("should handle processor", () {
      DateTime now = new DateTime.now();

      Date d = new Date(now);
      final serializer = new DateSerializer();
      expect(serializer.serialize(d),
          {"date": now.toIso8601String(), "clazzA": "ClassA"});
      expect(serializer.serialize(d, withType: true), {
        "date": now.toIso8601String(),
        "clazzA": "ClassA",
        defaultTypeInfoKey: "Date"
      });
    });

    test("should handle custom model name", () {
      CustomModelName model = new CustomModelName()..foo = "bar";
      final serializer = new CustomModelNameSerializer();
      expect(serializer.serialize(model, withType: true),
          {"foo": "bar", defaultTypeInfoKey: "MyCustomModelName"});
    });

    // Check if fromMap converts all Map items to fields
    test("should handle includeByDefault false", () {
      ExcludeByDefaultCodec serializer = new ExcludeByDefaultCodec();
      final m = <String, dynamic>{};
      m["id"] = "1";
      m["name"] = "teja";
      m["email"] = "secret";
      m["number"] = 1000;

      ExcludeByDefault model = serializer.fromMap(m);
      expect(model.id, "1");
      expect(model.name, "teja");
      expect(model.email, null);
      expect(model.number, null);
    });
  });
}
