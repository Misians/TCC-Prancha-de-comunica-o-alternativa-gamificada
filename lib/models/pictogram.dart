// lib/models/pictogram.dart

class Pictogram {
  final String imagePath;
  final String keyword;

  const Pictogram({required this.imagePath, required this.keyword});

  // Convert a Pictogram object to a JSON map
  Map<String, dynamic> toJson() {
    return {'imagePath': imagePath, 'keyword': keyword};
  }

  // Create a Pictogram object from a JSON map
  factory Pictogram.fromJson(Map<String, dynamic> json) {
    return Pictogram(
      imagePath: json['imagePath'] as String,
      keyword: json['keyword'] as String,
    );
  }
}
