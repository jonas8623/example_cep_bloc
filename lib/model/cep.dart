
class Cep {

  final String district;
  final String city;
  final String address;
  final String zipcode;
  final String state;

  Cep(this.district, this.city, this.address, this.zipcode, this.state);

  String get getDistrict => district;
  String get getCity => city;
  String get getAddress => address;
  String get getZipcode => zipcode;
  String get getState => state;

  factory Cep.fromJson(Map<String, dynamic> map) {
    return Cep(
      map["bairro"],
      map["cidade"],
      map["logradouro"],
      map["cep"],
      map["estado"],
    );
  }

  @override
  String toString() {
    return 'Cep{district: $district, city: $city, address: $address, zipcode: $zipcode, state: $state}';
  }
}

/*
  {
    "bairro": "Terra Nova",
    "cidade": "Alvorada",
    "logradouro": "Acesso Terra Nova",
     "cep": "94857550",
     "estado": "RS"
  }
 */