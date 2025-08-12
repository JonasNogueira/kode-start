import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:rick_morty/models/detailed_character_model.dart';

import 'package:rick_morty/widgets/character_card_widget.dart';
import 'package:rick_morty/pages/details_page.dart';

class CharacterListWidget extends StatelessWidget {
  final List<DetailedCharacter> characters;

  const CharacterListWidget({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return CharacterCard(
          character: character,
          onTap: () {
            if (character.name.toLowerCase() == 'pickle rick') {
              final player = AudioPlayer();
              player.play(AssetSource('pickle_rick.mp3'));
            }

            Navigator.of(
              context,
            ).pushNamed(DetailsPage.routeId, arguments: character.id);
          },
        );
      },
    );
  }
}
