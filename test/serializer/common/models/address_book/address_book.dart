library test.common.models.address_book;

import 'package:jaguar_serializer/serializer.dart';

part 'address_book.g.dart';

@GenSerializer()
@ProvideSerializers(const <Type, Type>{Address: Address})
class Person extends Object
    with JsonMixin, _$Person
    implements MapSerializer<Person> {
  String name;

  Address address;

  Person createModel() => new Person();
}

@GenSerializer()
class Address extends Object
    with JsonMixin, _$Address
    implements MapSerializer<Address> {
  String street;

  String houseNum;

  String city;

  String country;

  String pincode;

  Address();

  Address createModel() => new Address();
}
