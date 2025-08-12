import 'package:dio/dio.dart';
import 'package:rick_morty/models/detailed_character_model.dart';
import 'package:rick_morty/models/paginated_characters_model.dart';

class CharacterRepository {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'),
  );

  static Future<List<DetailedCharacter>> getCharacters({String? name}) async {
    final List<DetailedCharacter> allCharacters = [];
    int page = 1;
    bool hasNext = true;

    while (hasNext) {
      final queryParameters = <String, dynamic>{'page': page};
      if (name != null && name.isNotEmpty) {
        queryParameters['name'] = name;
      }

      final response = await _dio.get(
        'character',
        queryParameters: queryParameters,
      );

      final data = response.data;
      final results = data['results'] as List;
      allCharacters.addAll(results.map((c) => DetailedCharacter.fromJson(c)));

      hasNext = data['info']['next'] != null;
      page++;
    }

    return allCharacters;
  }

  static Future<PaginatedCharacters> getCharactersSearch({String? name}) async {
    final queryParameters = <String, dynamic>{};

    if (name != null && name.isNotEmpty) {
      queryParameters['name'] = name;
    }

    final response = await _dio.get(
      'character/',
      queryParameters: queryParameters,
    );

    return PaginatedCharacters.fromJson(response.data);
  }

  static Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    final response = await _dio.get('character/$characterId');
    final characterData = response.data;

    String? firstEpisodeName;

    if (characterData['episode'] != null &&
        characterData['episode'].isNotEmpty) {
      final firstEpisodeUrl = characterData['episode'][0];
      final episodeResponse = await _dio.get(firstEpisodeUrl);
      firstEpisodeName = episodeResponse.data['name'];
    }

    return DetailedCharacter.fromJson(
      characterData,
      firstEpisodeName: firstEpisodeName,
    );
  }
}
