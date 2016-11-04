import 'user/user.dart';

const Map<String, dynamic> kUserMap1 = const {
  'Id': "111111111111111111111111",
  "N": "Somebody",
  "Email": "somebody@somebody.com",
  'Book': const {
    'id': '222222222222222222222222',
    'name': 'Universe',
    'publishedYear': 2002,
  },
  'DoB': '1989-02-21 09:05:00',
  /*
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
  */
};

main() {
  UserViewSerializer serializer = new UserViewSerializer.FromMap(kUserMap1);

  User user = serializer.model;

  print(user.viewSerializer.toMap());

  print(user.viewSerializer.toJson());
}
