class CategoryModel {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });
  factory CategoryModel.fromJson(data) {
    return CategoryModel(
      idCategory: data['idCategory'],
      strCategory: data['strCategory'],
      strCategoryThumb: data['strCategoryThumb'],
      strCategoryDescription: data['strCategoryDescription'],
    );
  }
}
