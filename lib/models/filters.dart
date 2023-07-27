import 'dart:convert';
import 'package:http/http.dart' as http;

class FiltersResponse {
  Map<String, List<String>> filters;
  String message;

  FiltersResponse({required this.filters, required this.message});

  factory FiltersResponse.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>> convertedFilters = {};
    json['filters'].forEach((key, value) {
      if (value is List<dynamic>) {
        convertedFilters[key] = value.map((item) => item.toString()).toList();
      }
    });

    return FiltersResponse(
      filters: convertedFilters,
      message: json['message'],
    );
  }

static Future<FiltersResponse> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return FiltersResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  }
