library test.common.models.address_book;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'address_book.g.dart';

@GenSerializer(serializers: const [Address])
class Person extends Serializer<Person> with _$Person {
  String name;

  Address address;

  Person createModel() => new Person();
}

@GenSerializer()
class Address extends Serializer<Address> with _$Address {
  String street;

  String houseNum;

  String city;

  String country;

  String pincode;

  Address();

  Address createModel() => new Address();
}
