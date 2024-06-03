import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  @HiveType(typeId: 0)
  const factory FoodItem({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String image,
    @HiveField(3) required String link,
    @HiveField(4) String?content,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}
