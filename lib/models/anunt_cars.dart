class AnuntModel {
  String? name;
  String? description;
  String? imageUrl;
  String? marca;
  String? culoare;
  String? combustibil;

  AnuntModel(
      {this.name,
      this.description,
      this.imageUrl,
      this.marca,
      this.culoare,
      this.combustibil});

  factory AnuntModel.fromJson(Map<String, dynamic> json) {
   
    return AnuntModel(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['images'][0]["src"] as String,
      // marca: json['marca'] as String,
      // culoare: json['culoare'] as String,
      // combustibil: json['combustibil'] as String,
      
    );
  }
}
