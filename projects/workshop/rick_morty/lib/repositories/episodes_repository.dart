import 'package:dio/dio.dart';
import 'package:rick_morty/models/episode_model.dart';
import 'package:rick_morty/models/paginated_episodes_model.dart';

class EpisodeRepository {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'),
  );

  static Future<PaginatedEpisodes> getEpisodes({
    String? name,
    int? page,
  }) async {
    final queryParameters = <String, dynamic>{};

    if (name != null && name.isNotEmpty) {
      queryParameters['name'] = name;
    }
    if (page != null && page > 0) {
      queryParameters['page'] = page;
    }

    final response = await _dio.get(
      'episode/',
      queryParameters: queryParameters,
    );

    return PaginatedEpisodes.fromJson(response.data);
  }

  static Future<DetailedEpisode> getEpisodeDetails(int episodeId) async {
    final response = await _dio.get('episode/$episodeId');
    return DetailedEpisode.fromJson(response.data);
  }
}
