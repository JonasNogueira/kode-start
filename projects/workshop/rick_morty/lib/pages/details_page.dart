import 'package:flutter/material.dart';

import 'package:rick_morty/models/detailed_character_model.dart';
import 'package:rick_morty/repositories/character_repository.dart';
import 'package:rick_morty/theme/app_colors.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/detail_character_card_widget.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  const DetailsPage({required this.characterId, super.key});

  final int characterId;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<DetailedCharacter>? character;

  @override
  void initState() {
    character = CharacterRepository.getCharacterDetails(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<DetailedCharacter>(
        future: character,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong, please try again.',
                style: TextStyle(color: AppColors.white),
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                'Character not found.',
                style: TextStyle(color: AppColors.white),
              ),
            );
          }

          final data = snapshot.data!;
          return ListView(children: [DetailedCharacterCard(character: data)]);
        },
      ),
    );
  }
}
