class Mountain {
  Mountain({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.height,
    required this.basecamp,
    // required this.createdAt,
    // required this.updatedAt,
  });

  final int id;
  final String name;
  final String image;
  final String description;
  final String location;
  final int height;
  final int basecamp;
  // late final String createdAt;
  // late final String updatedAt;

  factory Mountain.fromJson(Map<String, dynamic> json) => Mountain(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        description: json['description'] as String,
        location: json['location'] as String,
        height: json['height'] as int,
        basecamp: json['basecamp'] as int,
        // createdAt: json['created_at'],
        // updatedAt: json['updated_at'],
      );
}
