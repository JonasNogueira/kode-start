import 'package:rick_morty/models/episode_model.dart';

class PaginatedEpisodes {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<DetailedEpisode> results;

  PaginatedEpisodes({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
    required this.results,
  });

  factory PaginatedEpisodes.fromJson(Map<String, dynamic> json) {
    final info = json['info'];
    return PaginatedEpisodes(
      count: info['count'],
      pages: info['pages'],
      next: info['next'],
      prev: info['prev'],
      results: List<Map<String, dynamic>>.from(
        json['results'],
      ).map((e) => DetailedEpisode.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info': {'count': count, 'pages': pages, 'next': next, 'prev': prev},
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}
