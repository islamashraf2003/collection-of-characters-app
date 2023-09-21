import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the Flutter Bloc package
import 'package:flutter_breaking/Data/Models/characters_model.dart';
import 'Bussines_Logic/Cubit/cubit/characters_cubit.dart';
import 'Data/Service/get_all_characters_service.dart';
import 'Pages/characters_details_page.dart';
import 'Pages/home_page.dart';

void main() {
  CharactersServices charactersServices = CharactersServices();
  charactersServices.getAllCharacters();

  runApp(BreakingBadApp());
}

class BreakingBadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharactersCubit(charactersServices: CharactersServices()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.id: (context) => HomePage(),
          CharactersDetails.id: (context) => CharactersDetails(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }
}
