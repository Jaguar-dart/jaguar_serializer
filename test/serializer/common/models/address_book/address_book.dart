library test.common.models.address_book;

import 'package:jaguar_serializer/serializer.dart';

part 'address_book.g.dart';

@GenSerializer()
class Person extends Object with JsonMixin, _$Person, MapSerializer<Person> {
  String name;

  Address address;

  Person createModel() => new Person();
  Person() {
    JaguarSerializer.addSerializer(new Address());
  }
}

@GenSerializer()
class Address extends Object with JsonMixin, _$Address, MapSerializer<Address> {
  String street;

  String houseNum;

  String city;

  String country;

  String pincode;

  Address();

  Address createModel() => new Address();
}
