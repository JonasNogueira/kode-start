import 'package:flutter/material.dart';
import 'package:rick_morty/models/episode_model.dart';
import 'package:rick_morty/theme/app_colors.dart';

class EpisodeCardWidget extends StatelessWidget {
  final DetailedEpisode episode;
  final VoidCallback? onTap;

  const EpisodeCardWidget({super.key, required this.episode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                episode.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                'Episode: ${episode.episode}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.6),
                  fontSize: 11,
                ),
              ),
              Text(
                'Air Date: ${episode.airDate}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.6),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
