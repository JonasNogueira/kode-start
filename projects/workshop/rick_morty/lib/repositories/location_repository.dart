import 'package:dio/dio.dart';

import 'package:rick_morty/models/location_model.dart';
import 'package:rick_morty/models/paginated_locations_model.dart';

class LocationRepository {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'),
  );

  static Future<PaginatedLocations> getLocations({String? name}) async {
    final queryParameters = <String, dynamic>{};

    if (name != null && name.isNotEmpty) {
      queryParameters['name'] = name;
    }

    final response = await _dio.get(
      'location/',
      queryParameters: queryParameters,
    );

    return PaginatedLocations.fromJson(response.data);
  }

  static Future<List<DetailedLocation>> getAllLocations({String? name}) async {
    final List<DetailedLocation> allLocations = [];
    int page = 1;
    bool hasNext = true;

    while (hasNext) {
      final queryParameters = <String, dynamic>{'page': page};
      if (name != null && name.isNotEmpty) {
        queryParameters['name'] = name;
      }

      final response = await _dio.get(
        'location',
        queryParameters: queryParameters,
      );

      final data = response.data;
      final results = data['results'] as List;
      allLocations.addAll(results.map((c) => DetailedLocation.fromJson(c)));

      hasNext = data['info']['next'] != null;
      page++;
    }

    return allLocations;
  }

  static Future<DetailedLocation> getLocationDetails(int locationId) async {
    final response = await _dio.get('/location/$locationId');
    final locationData = response.data;

    return DetailedLocation.fromJson(locationData);
  }
}
