import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl =
      'https://gist.githubusercontent.com/donejeh/5dd73ca4e2c8c94527219af52a5f53b8/raw/bdf5c0511f1fa7b188d633df456534f6a40528b4/banklist.json'; // Replace with the actual API endpoint

  Future<List<Map<String, dynamic>>> fetchData() async {
    print('im called');
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('no errors');
        return List<Map<String, dynamic>>.from(data);
      } else {
        print('HTTP request failed with status: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error during HTTP request: $error');
      throw Exception('Failed to load data');
    }
  }

}




class JsonReader {
  Future<List<Map<String, dynamic>>> fetchData() async {
    // Load JSON file from assets
    String jsonString = await rootBundle.loadString('assets/data.json');

    // Parse JSON
    List<dynamic> jsonData = json.decode(jsonString);

    // Convert dynamic list to List<Map<String, dynamic>>
    List<Map<String, dynamic>> dataList =
    jsonData.cast<Map<String, dynamic>>().toList();

    return dataList;
  }
}

