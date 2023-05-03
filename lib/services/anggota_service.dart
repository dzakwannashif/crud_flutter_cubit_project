import 'dart:convert';
import 'dart:developer';

import 'package:crud_flutter_cubit_project/models/anggota.dart';
import 'package:http/http.dart' as http;

import '../config/api_config.dart';

class AnggotaService {
  AnggotaService._();

  static Future<List<Anggota>> fetchAllProducts() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        final status = responseJson['status'];
        if (status == true) {
          List anggotaApi = responseJson['data'];
          List<Anggota> anggota = [];
          for (final json in anggotaApi) {
            anggota.add(Anggota.fromJson(json));
          }
          return anggota;
        } else {
          final message = responseJson['message'];
          throw Exception(message);
        }
      } else {
        throw Exception('Service not available');
      }
    } catch (_) {
      rethrow;
    }
  }

  static Future addAnggota({
    required Anggota anggota,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/create');
      final response = await http.post(url, body: anggota.toJson());
    } catch (_) {
      rethrow;
    }
  }

  static Future updateAnggota({
    required Anggota anggota,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/update${anggota.id}');
      log(url.toString());

      final response = await http.post(url, body: {
        'name': anggota.name,
        'price': anggota.price.toString(),
      });
      log(response.body);
    } catch (_) {
      rethrow;
    }
  }

  static Future deleteAnggota({
    required Anggota anggota,
  }) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/delete${anggota.id}');
      final response = await http.delete(url);
    } catch (_) {
      rethrow;
    }
  }
}
