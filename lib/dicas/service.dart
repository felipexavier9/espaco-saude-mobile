import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dica.dart';

class DicaService {

  static const String baseEndpoint = "https://staging.jfal.jus.br/api/dicas";

  const DicaService();

  Future<List<Dica>> getDicas({int page = 0, int limit = 10}) async {
    try {
      final response = await http.get(
          Uri.parse('$baseEndpoint?page=$page&limit=$limit'),
          headers: {
            'Accept': 'application/json'
          }
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var dicas = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
        return dicas.map<Dica>((dica) => Dica.fromJson(dica)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}