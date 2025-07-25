class Mealdetailsmodel {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strYoutube;

  Mealdetailsmodel({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strYoutube,
  });

  factory Mealdetailsmodel.fromJson(data) {
    return Mealdetailsmodel(
      idMeal: data['idMeal'],
      strMeal: data['strMeal'],
      strCategory: data['strCategory'],
      strArea: data['strArea'],
      strInstructions: data['strInstructions'],
      strMealThumb: data['strInstructions'],
      strYoutube: data['strYoutube'],
    );
  }
}
