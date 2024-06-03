import 'package:express_deli/stores/food_store.dart';
import 'package:express_deli/views/cart_screen.dart';
import 'package:express_deli/views/widgets/food_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foodStore = Provider.of<FoodStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const CartScreen(),
              ));
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (foodStore.foodItems.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: foodStore.foodItems.length,
                itemBuilder: (_, index) {
                  return FoodItemCard(
                    food: foodStore.foodItems[index],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
