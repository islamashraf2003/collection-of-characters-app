import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bussines_Logic/Cubit/cubit/characters_cubit.dart';
import '../Data/Models/characters_model.dart';
import '../Widgets/characterCard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CharactersModel> allCharacters;
  late List<CharactersModel> searchForCharacters;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).charachters;
          return buildLoadedListWidget();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
  //  TODO: her widget singleScroleView --> no ended!

  Widget buildLoadedListWidget() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
        ),
        itemCount: allCharacters.length,
        itemBuilder: (context, index) {
          return CharacterCard(
            charactersModel: allCharacters[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 208, 129, 55),
      ),
      body: buildBlocWidget(),
    );
  }
}
