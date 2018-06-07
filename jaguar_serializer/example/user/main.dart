import 'user/user.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

const Map<String, dynamic> kUserMap1 = const <String, dynamic>{
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

void main() {
  SerializerRepo serializer = new JsonRepo();
  serializer.add(new UserViewSerializer());

  User user = serializer.from<User>(kUserMap1);

  print(serializer.to(user));
}
