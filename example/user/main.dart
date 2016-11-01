import 'user/user.dart';

const Map<String, dynamic> kUserMap1 = const {
  'id': "111111111111111111111111",
  "N": "Somebody",
  "email": "somebody@somebody.com",
  'book': const {
    'id': '222222222222222222222222',
    'name': 'Universe',
    'publishedYear': 2002,
  },
  'books': const <Map>[
    const {
      'id': '222222222222222222222222',
      'name': 'Universe1',
      'publishedYear': 2003,
    }, const {
      'id': '222222222222222222222222',
      'name': 'Universe2',
      'publishedYear': 2004,
    },
  ],
};

main() {
  UserViewSerializer serializer = new UserViewSerializer.FromMap(kUserMap1);

  User user = serializer.model;

  print(user.viewSerializer.toMap());

  print(user.viewSerializer.toJson());
}
