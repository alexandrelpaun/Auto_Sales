class AnuntModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? marca;
  String? culoare;
  String? combustibil;

  AnuntModel(
      {
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.marca,
      this.culoare,
      this.combustibil});

  factory AnuntModel.fromJson(Map<String, dynamic> json) {
    return AnuntModel(
      id:json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['images'][0]["src"] as String,
      // marca: json['marca'] as String,
      // culoare: json['culoare'] as String,
      // combustibil: json['combustibil'] as String,
    );
  }
}
