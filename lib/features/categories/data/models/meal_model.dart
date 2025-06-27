class MealModel {
  final String mealName;
  final String imageUrl;
  final String id;

  MealModel({required this.id, required this.mealName, required this.imageUrl});

  factory MealModel.fromJson(json) {
    return MealModel(
      mealName: json['strMeal'],
      imageUrl: json['strMealThumb'],
      id: json['idMeal'],
    );
  }
}
