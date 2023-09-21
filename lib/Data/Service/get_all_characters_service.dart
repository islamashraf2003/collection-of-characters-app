import 'dart:developer';
import 'package:dio/dio.dart';
import '../Models/characters_model.dart';

class CharactersServices {
  Dio dio = Dio();
  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      Response response =
          await dio.get('https://rickandmortyapi.com/api/character');
      // CharactersModel charactersModel = CharactersModel.fromJson(response.data);

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> Characters = jsonData['results'];
      List<CharactersModel> charactersList = [];

      for (var character in Characters) {
        int id = character['id'] ?? 0;
        String name = character['name'] ?? 'Unknown';
        String gender = character['gender'] ?? 'Unknown';
        String image = character['image'] ?? 'No Image';
        String status = character['status'] ?? 'Unknown';
        String species = character['species'] ?? 'Unknown';
        if (name.isNotEmpty &&
            gender.isNotEmpty &&
            image.isNotEmpty &&
            status.isNotEmpty &&
            species.isNotEmpty) {
          CharactersModel charactersModel = CharactersModel(
              name: name,
              gender: gender,
              image: image,
              status: status,
              id: id,
              species: species);
          charactersList.add(charactersModel);
        }
      }
      print(response.data);
      log('$charactersList');
      return charactersList;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error'] ?? 'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later:${e.toString()}');
    }
  }
}
