import 'package:dio/dio.dart';
import 'package:rick_morty/models/detailed_character_model.dart';
import 'package:rick_morty/models/paginated_characters_model.dart';

class CharacterRepository {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'),
  );

  static Future<PaginatedCharacters> getCharacters({String? name}) async {
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
    final response = await _dio.get('/character/$characterId');
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
