library test.common.models.address_book;

import 'package:jaguar_serializer/serializer.dart';

part 'address_book.g.dart';

@GenSerializer()
@ProvideSerializer(Address, Address)
class Person extends Object with JsonMixin, _$Person, MapSerializer<Person> {
  String name;

  Address address;

  Person createModel() => new Person();
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
