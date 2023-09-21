class CharactersModel {
  late int? id;
  late String name;
  late String status;
  late String gender;
  late String species;
  late String image;

  CharactersModel({
    required this.name,
    required this.gender,
    required this.image,
    this.id,
    required this.status,
    required this.species,
  });

  factory CharactersModel.fromJson(jsonData) {
    if (jsonData == null) {
      return CharactersModel(
        id: 0,
        status: 'Unknown',
        species: 'Unknown',
        name: 'Unknown',
        gender: 'Unknown',
        image: 'No Image',
      );
    }

    return CharactersModel(
      id: jsonData['id'],
      name: jsonData['name'] ?? 'Unknown',
      gender: jsonData['gender'] ?? 'Unknown',
      image: jsonData['image'] ?? 'No Image',
      status: jsonData['status'],
      species: jsonData['species'],
    );
  }
}
