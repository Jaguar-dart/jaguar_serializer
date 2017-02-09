library test.common.models.address_book;

import 'package:jaguar_serializer/serializer.dart';

part 'address_book.g.dart';

@GenSerializer()
@ProvideSerializer(Address, Address)
class Person extends MapSerializer<Person> with _$Person {
  String name;

  Address address;

  Person createModel() => new Person();
}

@GenSerializer()
class Address extends MapSerializer<Address> with _$Address {
  String street;

  String houseNum;

  String city;

  String country;

  String pincode;

  Address();

  Address createModel() => new Address();
}
