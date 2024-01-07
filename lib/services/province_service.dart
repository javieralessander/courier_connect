import 'package:courier_connect/models/province.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final provinceProvider = FutureProvider<List<Province>>((ref) async {
  final response = await http
      .get(Uri.parse('https://api.digital.gob.do/v1/territories/provinces'));

  if (response.statusCode == 200) {
    return provinceFromJson(response.body).data;
  } else {
    throw Exception('Failed to load provinces');
  }
});
