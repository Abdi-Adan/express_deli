import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:express_deli/models/food_item.dart';

class SpoonacularApiService {
  static const String _baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';
  static const String _apiKey = 'YOUR_SPOONACULAR_API_KEY'; 

  Future<List<FoodItem>> fetchFoodItems() async {
    final response = await http.get(Uri.parse('$_baseUrl?apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;
      return results.map((item) => FoodItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch food items');
    }
  }
}