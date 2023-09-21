part of 'characters_cubit.dart';

@immutable
class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharactersModel> charachters;

  CharactersLoaded({required this.charachters});
}
