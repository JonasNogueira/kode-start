import 'package:flutter/material.dart';
import 'package:rick_morty/models/detailed_character_model.dart';
import 'package:rick_morty/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  final DetailedCharacter character;

  const DetailedCharacterCard({super.key, required this.character});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return AppColors.green;
      case 'dead':
        return AppColors.red;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            character.image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  character.name.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First seen in:',
                            style: TextStyle(
                              color: AppColors.white.withValues(alpha: 0.6),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            character.firstEpisodeName ?? 'Unknown',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 13,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Last known location:',
                            style: TextStyle(
                              color: AppColors.white.withValues(alpha: 0.6),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            character.location.name,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 13,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender:',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: 0.6),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          character.gender,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Origin:',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: 0.6),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          character.origin.name,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: _getStatusColor(character.status),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${character.status} - ${character.species}',
                      style: TextStyle(color: AppColors.white, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
