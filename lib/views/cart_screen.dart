import 'package:express_deli/views/checkout_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/food_store.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foodStore = Provider.of<FoodStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Observer(
        builder: (_) {
          if (foodStore.cartItems.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          } else {
            return ListView.builder(
              itemCount: foodStore.cartItems.length,
              itemBuilder: (_, index) {
                final food = foodStore.cartItems[index];
                return ListTile(
                  title: Text(food.name),
                  leading: Image.network(food.image),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            await foodStore.checkout();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const CheckoutSuccessScreen(),
              ),
            );
          },
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
