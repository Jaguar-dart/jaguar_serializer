import "../../common/models/player/player.dart";
import '../../common/models/inheritance/inheritance.dart';
import "package:test/test.dart";

void main() {
  group("Serializer", () {
    group("toMap", () {
      Player player;

      setUp(() {
        player = new Player.make(
            name: "John",
            age: 25,
            score: 100.2,
            confirmed: true,
            friends: ["Friend1", "Friend2"]);
      });

      test("Normal", () {
        final ser = new PlayerSerializer();
        expect(ser.toMap(player), {
          'name': 'John',
          'age': 25,
          'score': 100.2,
          'confirmed': true,
          'friends': ["Friend1", "Friend2"],
        });
      });

      test("Non-nullable", () {
        player.confirmed = null;
        final ser = new PlayerSerializer();
        expect(ser.toMap(player), {
          'name': 'John',
          'age': 25,
          'score': 100.2,
          'friends': ["Friend1", "Friend2"],
        });
      });

      test("IgnoreOne", () {
        var ser = new PlayerSerializerIgnore();
        expect(ser.toMap(player), {
          'name': 'John',
          'age': 25,
          'score': 100.2,
          'friends': ["Friend1", "Friend2"],
        });
      });

      test("IgnoreMany", () {
        var ser = new PlayerSerializerIgnores();
        expect(ser.toMap(player), {
          'name': 'John',
          'score': 100.2,
        });
      });

      test("Alias", () {
        final ser = new PlayerSerializerRename();
        expect(ser.toMap(player), {
          'N': 'John',
          'age': 25,
          'S': 100.2,
          'C': true,
          'friends': ["Friend1", "Friend2"],
        });
      });

      test("ExcludeByDefault", () {
        var ser = new PlayerSerializerExcludeDef();
        expect(ser.toMap(player), {
          'name': 'John',
          'score': 100.2,
        });
      });

      test("Inheritance", () {
        var ser = new DerivedSerializer();
        expect(
            ser.toMap(new Derived(
                derived: 'Dog', based: 'Animal', mixed: 'Domestic')),
            {
              'derived': 'Dog',
              'm': 'Domestic',
              'b': 'Animal',
            });
      });
    });
  });
}
