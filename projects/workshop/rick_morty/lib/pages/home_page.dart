import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/character_card_widget.dart';
import 'package:rick_morty/widgets/search_bar_widget.dart';
import 'package:rick_morty/repositories/character_repository.dart';
import 'package:rick_morty/models/paginated_characters_model.dart';
import 'package:rick_morty/theme/app_colors.dart';
import 'details_page.dart';

class CharacterHomePage extends StatefulWidget {
  static const routeId = '/';
  const CharacterHomePage({super.key});

  @override
  State<CharacterHomePage> createState() => _CharacterHomePageState();
}

class _CharacterHomePageState extends State<CharacterHomePage> {
  Future<PaginatedCharacters>? characters;
  final TextEditingController _searchController = TextEditingController();

  void _fetchCharacters([String name = '']) {
    setState(() {
      characters = CharacterRepository.getCharacters(name: name);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchCharacters();

    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarWidget(
              controller: _searchController,
              onChanged: (value) => _fetchCharacters(value),
            ),
          ),
          Expanded(
            child: FutureBuilder<PaginatedCharacters>(
              future: characters,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final characterList = snapshot.data!.results;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 7.5),
                    itemCount: characterList.length,
                    itemBuilder: (context, index) {
                      return CharacterCard(
                        character: characterList[index],
                        onTap: () {
                          final selectedCharacter = characterList[index];

                          if (selectedCharacter.name.toLowerCase() ==
                              'pickle rick') {
                            final player = AudioPlayer();
                            player.play(AssetSource('pickle_rick.mp3'));
                          }

                          if (!mounted) return;

                          Navigator.of(context).pushNamed(
                            DetailsPage.routeId,
                            arguments: selectedCharacter.id,
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "No characters found.",
                      style: TextStyle(color: AppColors.white),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
