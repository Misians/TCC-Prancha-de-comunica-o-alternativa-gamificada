// models/category.dart
class Category {
  const Category({
    required this.name,
    required this.searchKeyword,
    required this.imagePath, // Adicione esta linha
  });

  final String name;
  final String searchKeyword;
  final String imagePath; // Adicione esta linha
}
