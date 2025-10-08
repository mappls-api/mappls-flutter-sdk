class CategoryModel {
  final int type;
  final String name;
  final String icon;// Flutter uses asset paths as String for icons/images

  CategoryModel({
    required this.type,
    required this.name,
    required this.icon,
  });
}