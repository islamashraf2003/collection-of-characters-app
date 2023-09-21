import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Data/Models/characters_model.dart';
import '../../../Data/Service/get_all_characters_service.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersServices charactersServices;
  List<CharactersModel> characterList = [];

  CharactersCubit({required this.charactersServices})
      : super(CharactersInitial()) {
    characterList = [];
  }

  List<CharactersModel> getAllCharacters() {
    charactersServices.getAllCharacters().then(
      (characters) {
        emit(CharactersLoaded(charachters: characters));
        characterList = characters;
      },
    );
    return characterList;
  }
}
