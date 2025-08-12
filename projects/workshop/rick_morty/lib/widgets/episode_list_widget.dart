import 'package:flutter/material.dart';
import 'package:rick_morty/models/episode_model.dart';
import 'package:rick_morty/widgets/episode_card_widget.dart';

class EpisodeListWidget extends StatelessWidget {
  final List<DetailedEpisode> episodes;
  final ScrollController scrollController;

  const EpisodeListWidget({
    super.key,
    required this.episodes,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3 / 2,
      ),
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return EpisodeCardWidget(episode: episode, onTap: () {});
      },
    );
  }
}
