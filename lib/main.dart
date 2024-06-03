import 'package:express_deli/stores/food_store.dart';
import 'package:express_deli/views/food_list_screen.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  await Hive.openBox('foodBox');

  runApp(
    MultiProvider(
      providers: [
        Provider<FoodStore>(create: (_) => FoodStore()..fetchFoodItems()),
      ],
      child: const ExpressDeliApp(),
    ),
  );
}

class ExpressDeliApp extends StatelessWidget {
  const ExpressDeliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Food App',
      home: FoodListScreen(),
    );
  }
}
