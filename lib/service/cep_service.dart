import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:example_bloc_cep/constant.dart';
import 'package:example_bloc_cep/model/model.dart';

class CepService {

  Future<Cep> getCep(String CEP) async {

    print('Cep -> ${CEP.toString()}');

    var url = Uri.https(Constant.baseUrl, Constant.resourcePath+CEP);

    final response = await http.Client().get(url);

    if(response.statusCode != 200) {
      print('Status Code -> ${response.statusCode}');
      throw Exception();
    }

    print('Body -> ${response.body.toString()}');
    return parsedJson(response.body);
  }

  Cep parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    return Cep.fromJson(jsonDecoded);
  }

}