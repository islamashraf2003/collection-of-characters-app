import 'package:flutter/material.dart';
import '../Data/Models/characters_model.dart';
import '../Pages/characters_details_page.dart';

class CharacterCard extends StatelessWidget {
  final CharactersModel charactersModel;

  CharacterCard({Key? key, required this.charactersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CharactersDetails.id,
            arguments: charactersModel);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //         CharactersDetails(charactersModel: charactersModel),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: GridTile(
          child: Hero(
            tag: 'character_${charactersModel.id ?? UniqueKey().toString()}',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage(charactersModel.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                charactersModel.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
