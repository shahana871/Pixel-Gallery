import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/image_model.dart';

class ApiService {

  Future<List<ImageModel>> fetchImages() async {

    final response = await http.get(
      Uri.parse('https://picsum.photos/v2/list'),
    );

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data
          .map((json) => ImageModel.fromJson(json))
          .toList();

    } else {

      throw Exception('Failed to load images');
    }
  }
}