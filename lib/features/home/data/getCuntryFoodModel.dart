class CuntryFood {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  CuntryFood({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });
  factory CuntryFood.fromJson(data) {
    return CuntryFood(
      strMeal: data['strMeal'],
      strMealThumb: data['strMealThumb'],
      idMeal: data['idMeal'],
    );
  }
}
