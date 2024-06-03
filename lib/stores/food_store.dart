import 'package:express_deli/models/food_item.dart';
import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'food_store.g.dart';

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  final Box foodBox = Hive.box('foodBox');

  @observable
  ObservableList<FoodItem> foodItems = ObservableList<FoodItem>();

  @observable
  ObservableList<FoodItem> cartItems = ObservableList<FoodItem>();

  @action
  Future<void> fetchFoodItems() async {
    if (foodBox.isEmpty) {
      final response = await http.get(Uri.parse(
          'https://api.spoonacular.com/food/search?apiKey=261695cb12c848029dc8d869c377049a'));
      final  jsonData = json.decode(response.body);
      final List<dynamic> data = filterProducts(jsonData);

      for (var item in data) {
        final food = FoodItem.fromJson(item);
        foodItems.add(food);
        foodBox.add(food);
      }
    } else {
      for (var item in foodBox.values) {
        foodItems.add(item);
      }
    }
  }

  List<dynamic> filterProducts(Map<String, dynamic> jsonData) {
    List<dynamic> searchResults = jsonData['searchResults'];
    List<dynamic> productResults = [];

    for (var result in searchResults) {
      if (result['type'] == 'products') {
        productResults.addAll(result['results']);
      }
    }

    return productResults;
  }

  @action
  void addToCart(FoodItem food) {
    cartItems.add(food);
  }

  @action
  Future<void> checkout() async {
    // Simulate a POST request to a dummy endpoint
    await Future.delayed(const Duration(seconds: 2));
    cartItems.clear();
  }
}
