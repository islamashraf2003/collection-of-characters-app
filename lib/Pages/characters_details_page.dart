import 'package:flutter/material.dart';

import 'package:flutter_breaking/Data/Models/characters_model.dart';

import '../Widgets/custom_text_widget.dart';

class CharactersDetails extends StatelessWidget {
  static String id = 'CharactersDetails';

  const CharactersDetails({super.key});

  Widget BuildDivider(double endIndent) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Divider(
        height: 30,
        thickness: 2,
        endIndent: endIndent,
        color: const Color.fromARGB(255, 238, 183, 54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CharactersModel charactersModel =
        ModalRoute.of(context)!.settings.arguments as CharactersModel;
    return Scaffold(
      backgroundColor: const Color(0xff35393F),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xff35393F),
            expandedHeight: 600,
            elevation: 0.0,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              title: Text(
                charactersModel.name,
                style: const TextStyle(color: Colors.black),
              ),
              background: Hero(
                tag:
                    'character_${charactersModel.id ?? UniqueKey().toString()}',
                child: Image.network(
                  charactersModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomText(name: 'State', vlaue: charactersModel.status),
          ),
          SliverToBoxAdapter(
            child: BuildDivider(330),
          ),
          SliverToBoxAdapter(
            child: CustomText(name: 'Gender', vlaue: charactersModel.gender),
          ),
          SliverToBoxAdapter(
            child: BuildDivider(310),
          ),
          SliverToBoxAdapter(
            child: CustomText(name: 'Species', vlaue: charactersModel.species),
          ),
          SliverToBoxAdapter(
            child: BuildDivider(305),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}
