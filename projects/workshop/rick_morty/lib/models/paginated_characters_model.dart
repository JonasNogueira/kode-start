import 'package:rick_morty/models/detailed_character_model.dart';

class PaginatedCharacters {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<DetailedCharacter> results;

  PaginatedCharacters({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
    required this.results,
  });

  factory PaginatedCharacters.fromJson(Map<String, dynamic> json) {
    final info = json['info'];
    return PaginatedCharacters(
      count: info['count'],
      pages: info['pages'],
      next: info['next'],
      prev: info['prev'],
      results: List.from(
        json['results'],
      ).map((e) => DetailedCharacter.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info': {'count': count, 'pages': pages, 'next': next, 'prev': prev},
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}
