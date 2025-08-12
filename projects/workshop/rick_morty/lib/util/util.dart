import 'package:rick_morty/repositories/character_repository.dart';

class StatisticsFunctions {
  Future<Map<String, Map<String, int>>> fetchStatistics() async {
    final characters = await CharacterRepository.getCharacters();

    final statusCount = <String, int>{};
    final genderCount = <String, int>{};
    final speciesCount = <String, int>{};

    for (var c in characters) {
      statusCount[c.status] = (statusCount[c.status] ?? 0) + 1;
      genderCount[c.gender] = (genderCount[c.gender] ?? 0) + 1;
      speciesCount[c.species] = (speciesCount[c.species] ?? 0) + 1;
    }

    return {
      'status': statusCount,
      'gender': genderCount,
      'species': speciesCount,
    };
  }
}
