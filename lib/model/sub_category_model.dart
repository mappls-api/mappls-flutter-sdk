
class SubCategoryModel {
  final String name;
  final String description;
  final String icon;// Flutter uses asset paths as String for icons/images
  final String route;

   SubCategoryModel({
    required this.name,
    required this.description,
    required this.icon,
    required this.route,
  });
}