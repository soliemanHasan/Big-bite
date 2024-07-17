import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  // final int page;

  final int id;
  final String name;
  final String price;
  // final String? imagePath;
  final String description;
  final List<IngredientEntity>? ingredients;
  const MealEntity(
      {required this.id,
      // required this.page,
      required this.name,
      required this.price,
      required this.description,
      //this.imagePath,
      this.ingredients});

  @override
  List<Object?> get props => [
        id, name, price, //imagePath,
        description, ingredients
      ];
}

class IngredientEntity extends Equatable {
  final int id;
  final String name;
  const IngredientEntity({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
