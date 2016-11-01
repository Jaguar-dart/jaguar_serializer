import 'user.dart';

const Map<String, dynamic> kUserMap1 = const {
  "N": "Somebody",
  "email": "somebody@somebody.com",
};

main() {
  UserViewSerializer serializer = new UserViewSerializer.FromMap(kUserMap1);

  User user = serializer.model;

  print(user.viewSerializer.toMap());

  print(user.viewSerializer.toJson());
}