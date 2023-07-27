import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oru_phones_assignment/models/products.dart';

class ListingsService {
  final String baseUrl = 'https://dev2be.oruphones.com/api/v1/global/assignment/getListings';

  Future<ListingsData> fetchListings(int page, int limit) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page&limit=$limit'));

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return ListingsData.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load listings');
    }
  }
}
