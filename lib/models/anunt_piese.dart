class AnuntModelPiese {
  int? id;
  String? name;
  String? description;
  String? images;
  String? marca;
  String? culoare;
  String? combustibil;

  AnuntModelPiese(
      {
      this.id, 
      this.images,
      this.description,
      this.name,
      this.marca,
      this.culoare,
      this.combustibil
        }
      );

  factory AnuntModelPiese.fromJson(Map<String, dynamic> json) {
    return AnuntModelPiese(
      id:json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      images: json['images'][0]["src"] as String,
    );
  }
}
